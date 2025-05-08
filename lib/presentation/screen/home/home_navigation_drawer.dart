import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/authenticated.dart';
import 'package:flutter_controle_enderecos/presentation/screen/screens.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class HomeNavigationDrawer extends StatelessWidget {
  String selectedIndex;
  final Function(String item) onSelectItem;
  final Function() onExit;

  HomeNavigationDrawer(
      {super.key,
      required this.onSelectItem,
      required this.onExit,
      this.selectedIndex = ""});

  @override
  Widget build(BuildContext context) {
    return _drawer(context);
  }

  Widget _drawer(BuildContext context) {
    // Criando o mapa
    Map<String, Widget> drawerItems = {
      HomeScreen.routeName: const DrawerHeader(child: Text("Home")),
      SearchUsuarioScreen.routeName: _buildMenuItem(
          SearchUsuarioScreen.routeName, "Usuário", Icons.people),
      SearchClienteScreen.routeName:
          _buildMenuItem(SearchClienteScreen.routeName, "Cliente", Icons.abc),
      SearchEstadoScreen.routeName:
          _buildMenuItem(SearchEstadoScreen.routeName, "Estado", Icons.abc),
      SearchCidadeScreen.routeName:
          _buildMenuItem(SearchCidadeScreen.routeName, "Cidade", Icons.abc),
      "sair": MenuItemWidget(
          onTap: () async {
            Future.microtask(() {
              onExit();
            });
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

  MenuItemWidget _buildMenuItem(String route, String title, IconData icon) {
    return MenuItemWidget(
        selected: selectedIndex == route,
        onTap: () => onSelectItem(route),
        rota: route,
        icon: icon,
        title: title);
  }
}
