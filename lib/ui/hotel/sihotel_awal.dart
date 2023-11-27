import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_sihotel/core/bloc/app_setting_bloc.dart';
import 'package:project_sihotel/core/session_manager.dart';
import 'package:project_sihotel/ui/hotel/sihotel_data.dart';
import 'package:project_sihotel/ui/profile/profile_page.dart';
import 'package:project_sihotel/ui/user/login/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  final sessionManager = SessionManager();
  Future<void> _logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // Add code to call your logout API here to invalidate the token on the server-side

    sessionManager.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'SIHOTEL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/image/hotelwalpaper.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Informasi Hotel'),
            onTap: () {
              Navigator.pushNamed(context, SihotelData.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              _logout(context);
              context.read<AppSettingBloc>()..add(SettingAppEvent());
            },
          ),
        ],
      ),
    );
  }
}
