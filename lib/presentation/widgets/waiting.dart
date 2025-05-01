import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Future<String?>? future;
  final Widget widgetBuilder;
  const HomePage(
      {super.key, required this.widgetBuilder, required this.future});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: FutureBuilder<String?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Enquanto carrega
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          return widgetBuilder;
          /*else if (snapshot.hasData && snapshot.data != null) {
            return Center(child: Text('Token: ${snapshot.data}'));
          } else {
            return const Center(child: Text('Nenhum token encontrado.'));
          }*/
        },
      ),
    );
  }
}
