import 'package:flutter/material.dart';
import '../components/drawer_list_tile.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lcplky.org/wp-content/uploads/2017/02/paintingclasschicken-214x300.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Chicken Pratt',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'chicken_p@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DrawerListTile(
            label: 'My Profile',
            icon: Icons.person,
            onPress: null,
          ),
          DrawerListTile(
            label: 'My Claims',
            icon: Icons.category,
            onPress: null,
          ),
          DrawerListTile(
            label: 'Notification',
            icon: Icons.message,
            onPress: null,
          ),
          DrawerListTile(
            label: 'Settings',
            icon: Icons.settings,
            onPress: null,
          ),
          Divider(
            thickness: 0.9,
            indent: 30.0,
            endIndent: 30.0,
          ),
          DrawerListTile(
            label: 'FAQ',
            icon: Icons.question_answer,
            onPress: null,
          ),
          DrawerListTile(
            label: 'Logout',
            icon: Icons.arrow_back,
            onPress: null,
          ),
        ],
      ),
    );
  }
}


