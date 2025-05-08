// Suponha que as classes Entity<E>, Controller<E> e ResultData existam no seu projeto.
// - Entity<E> representa uma entidade de dados genérica.
// - Controller<E> deve ter um método save() que retorna um objeto ResultData.
// - ResultData deveria conter pelo menos campos 'success' (bool) e 'message' (String?).

import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/presentation/app/apps.dart';
import 'package:flutter_controle_enderecos/presentation/app/base_form_state.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/dialog_widgets.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/progress_widget.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart';

/// Widget genérico de formulário para entidades do tipo [E] com controle [C].
class GenericFormScreen<E extends Entity<E>, C extends Controller<E>>
    extends StatefulWidget {
  /// O controlador associado ao formulário, responsável por salvar a entidade.
  final C controller;

  /// Título exibido na AppBar da tela.
  final String title;

  final List<Widget>? actionsButtons;

  /// Função que retorna a lista de campos (widgets) do formulário.
  /// Recebe o controller para construir os campos vinculados a ele.
  final Widget? Function() buildForm;

  /// Função assíncrona chamada quando o formulário é enviado (submit).
  /// Deve retornar um [ResultData] indicando o sucesso ou falha da operação.
  /// Pode ser usada, por exemplo, para salvar dados via controller.
  final Future<ResultData> Function()? onActionSubmit;

  /// Callback opcional chamado imediatamente antes do início do envio do formulário.
  /// Ideal para executar ações como iniciar animações, bloquear a interface, ou limpar mensagens anteriores.
  final VoidCallback? onBeforeSubmit;

  /// Callback opcional chamado após a finalização do envio do formulário,
  /// independentemente de sucesso ou falha. Pode ser usado para reativar a interface,
  /// parar animações ou atualizar o estado da tela.
  final VoidCallback? onAfterSubmit;

  /// Callback opcional chamado após salvar com sucesso.
  final VoidCallback? onSuccess;

  /// Construtor do [GenericFormScreen].
  const GenericFormScreen(
      {super.key,
      required this.controller,
      required this.title,
      required this.buildForm,
      this.onActionSubmit,
      this.onSuccess,
      this.onBeforeSubmit,
      this.onAfterSubmit,
      this.actionsButtons});

  @override
  State<GenericFormScreen> createState() => GenericFormScreenState<E, C>();
}

/// Estado associado ao [GenericFormScreen].
/// Usa [BaseFormState] como base para integrar com o padrão existente do usuário.
class GenericFormScreenState<E extends Entity<E>, C extends Controller<E>>
    extends BaseFormState<GenericFormScreen, E> {
  // Chave global para o formulário, utilizada para validação.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusScopeNode();
    // Dê um pequeno atraso para garantir que o contexto está pronto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is! Bundle) {
        throw Exception('Argumentos inválidos para formulário!');
      }
      final entity = args.get(Argument.entity);
      if (entity is! E) {
        throw Exception('Entidade inválida ou ausente no formulário!');
      }
      widget.controller.fromEntity(entity);
      setState(() {}); // Força o rebuild
    });
  }

  Future<void> submitForm() async {
    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    // ⚡ CHAMA O CALLBACK ANTES DO SUBMIT
    widget.onBeforeSubmit?.call();

    _startLoading();

    // Tenta salvar a entidade usando o controller
    ResultData result = ResultData();

    result = await _onAction();
    if (!mounted) return;

    _showFeedback(result);

    widget.onAfterSubmit?.call(); // ⚡ após sucesso
  }

  Future<ResultData> _onAction() async {
    try {
      if (widget.onActionSubmit == null) {
        return ResultData(success: false, message: 'Nenhuma ação definida.');
      }

      return await widget.onActionSubmit!.call();
    } catch (e) {
      if (!mounted) {
        return ResultData(success: false, message: 'Erro inesperado.');
      }
      // Em caso de erro inesperado, interrompe o carregamento e exibe mensagem de erro.
      _showFeedbackError(e);
      return ResultData(success: false, message: e.toString());
    }
  }

  void _showFeedbackError(Object e) {
    // Em caso de erro inesperado, interrompe o carregamento e exibe mensagem de erro.
    _stopLoading();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao salvar: ${e.toString()}')),
    );

    // ⚡ CHAMA O CALLBACK DEPOIS, MESMO EM CASO DE ERRO
    widget.onAfterSubmit?.call();
  }

  void _startLoading() {
    setState(() => isLoading = true);
  }

  void _showFeedback(ResultData<dynamic> result) {
    if (!result.success) {
      showErrorDialog(result, context);
      _stopLoading();
      return;
    }

    _stopLoading();
    // Sucesso: exibe mensagem e chama callback onSuccess se houver.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Salvo com sucesso')),
    );
    widget.onSuccess?.call();
  }

  void _stopLoading() {
    setState(() => isLoading = false);
  }

  Widget _buildButtonIcon() {
    return IconButton(
        onPressed: isLoading ? null : submitForm,
        icon: const Icon(Icons.check));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    if (widget.actionsButtons != null) {
      for (var element in widget.actionsButtons!) {
        actions.add(element);
      }
    }
    actions.add(_buildButtonIcon());

    return Scaffold(
        appBar: AppBar(
          actions: actions,
          title: Text(
            widget.controller.title,
          ),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return AppForm(
        focusNode: _focusNode,
        formKey: _formKey,
        child: isLoading
            ? const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgress()]))
            : widget.buildForm.call() ??
                const Center(child: Text('Formulário indisponível')));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
