import 'package:flutter/material.dart';
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
