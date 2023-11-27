import 'package:flutter/material.dart';
import 'package:project_sihotel/core/session_manager.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profilepage';

  int hexColor(String color) {
    String newColor = '0xff$color';
    newColor = newColor.replaceAll('#', '');
    int finalColor = int.parse(newColor);
    return finalColor;
  }

  @override
  Widget build(BuildContext context) {
    final sessionManager = SessionManager();

    final firstName = sessionManager.getActiveFirstName();
    final email = sessionManager.getActiveEmail();
    final lastName = sessionManager.getActiveLastName();
    final userAvatar = sessionManager.getActiveUserAvatar();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundImage:
                        NetworkImage('$userAvatar'),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '$firstName',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Text(
                            'First Name:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '$firstName',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Last Name:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '$lastName',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
