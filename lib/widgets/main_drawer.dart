import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildListTile({String title, IconData icon, Function tapHandler}) {
      return ListTile(
        onTap: tapHandler,
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          SizedBox(height: 20),
          _buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            tapHandler: () {
              Navigator.of(context).pushNamed(TabsScreen.routeName);
            },
          ),
          _buildListTile(
            title: 'Filters',
            icon: Icons.settings,
            tapHandler: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
