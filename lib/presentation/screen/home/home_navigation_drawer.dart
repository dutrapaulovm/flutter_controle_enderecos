import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/authenticated.dart';
import 'package:flutter_controle_enderecos/presentation/screen/screens.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class HomeNavigationDrawer extends StatelessWidget {
  String selectedIndex;
  final Function(String item) onSelectItem;

  HomeNavigationDrawer(
      {super.key, required this.onSelectItem, this.selectedIndex = ""});

  @override
  Widget build(BuildContext context) {
    return _drawer(context);
  }

  Future<void> _logout(BuildContext context) async {
    Authenticated authenticated = Authenticated();
    await authenticated.deleteToken();

    // Voltar para tela de login (exemplo fictício)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  Widget _drawer(BuildContext context) {
    // Criando o mapa
    Map<String, Widget> drawerItems = {
      HomeScreen.routeName: const DrawerHeader(child: Text("Home")),
      "usuario": MenuItemWidget(
          selected: selectedIndex == "usuario",
          onTap: () => onSelectItem("usuario"),
          icon: Icons.person,
          title: "Usuário"),
      SearchEstadoScreen.routeName: MenuItemWidget(
          selected: selectedIndex == SearchEstadoScreen.routeName,
          icon: Icons.abc,
          rota: SearchEstadoScreen.routeName,
          title: "Estado"),
      SearchCidadeScreen.routeName: MenuItemWidget(
          selected: selectedIndex == SearchCidadeScreen.routeName,
          icon: Icons.abc,
          rota: SearchCidadeScreen.routeName,
          title: "Cidade"),
      "sair": MenuItemWidget(
          onTap: () {
            showExitDialog(context, onPressed: () => _logout(context));
          },
          selected: selectedIndex == "sair",
          icon: Icons.abc,
          title: "Sair"),
    };

    return Drawer(
      child: ListView(
          children: drawerItems.entries
              .map((entry) => Padding(
                    padding: const EdgeInsets.all(0),
                    child: entry.value,
                  ))
              .toList()),
    );
  }
}
