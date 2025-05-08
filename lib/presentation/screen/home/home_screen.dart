import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/authenticated.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home/home_navigation_bar.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home/home_navigation_drawer.dart';
import 'package:flutter_controle_enderecos/presentation/screen/login/login_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_user/search_usuario_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/app_scaffold.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/dasboard_card.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/dialog_widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<_HomeScreenState> _widgetKey = GlobalKey<_HomeScreenState>();

  String _selectedDrawerItem = SearchUsuarioScreen.routeName;
  int _currentIndexNavigationBar = 0;

  void _onSelectItem(String index) {
    setState(() {
      _selectedDrawerItem = index;
    });
  }

  void _onTapNavigationBar(int index) {
    setState(() {
      _currentIndexNavigationBar = index;
    });
  }

  Future<void> _logout(BuildContext context) async {
    Authenticated authenticated = Authenticated();
    await authenticated.deleteToken();

    if (!mounted) return;
    Navigator.pop(context);
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppScaffold(
      scaffoldKey: _scaffoldKey,
      title: "Home",
      drawer: HomeNavigationDrawer(
        key: _widgetKey,
        selectedIndex: _selectedDrawerItem,
        onSelectItem: _onSelectItem,
        onExit: () {
          showExitDialog(context, onPressed: () => _logout(context));
        },
      ),
      bottomNavigationBar: HomeNavigationBar(
        currentIndex: _currentIndexNavigationBar,
        onTap: (index) => _onTapNavigationBar,
      ),
      body: const HomeBodyScreen(),
    ));
  }
}

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Resumo", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              DashboardCard(title: "Total", value: "120", icon: Icons.home),
              DashboardCard(title: "Com erro", value: "5", icon: Icons.warning),
              DashboardCard(
                  title: "Residenciais", value: "80", icon: Icons.house),
              DashboardCard(
                  title: "Comerciais", value: "40", icon: Icons.apartment),
            ],
          ),
          const SizedBox(height: 20),
          Text("Tipos de Endereço",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 200, child: TipoEnderecoChart()),
        ])));
  }

  List<String> features = ["Restaurantes", "Bebidas", "Mercados", "Farmácias"];

  Widget _buildGridView() {
    return Expanded(
        child: GridView.builder(
      gridDelegate: _createDelegateGrid(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: _createGridTile(features[index]),
        );
      },
    ));
  }

  GridTile _createGridTile(String title) {
    return GridTile(
        header: GridTileBar(
            title: Text(title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Image.asset("assets/placeholder.png"),
              ),
            ],
          ),
        ));
  }

  SliverGridDelegate _createDelegateGrid() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8);
  }
}

class TipoEnderecoChart extends StatelessWidget {
  const TipoEnderecoChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
              value: 60, color: Colors.blue, title: "Residencial"),
          PieChartSectionData(
              value: 40, color: Colors.orange, title: "Comercial"),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 60,
      ),
    );
  }
}
