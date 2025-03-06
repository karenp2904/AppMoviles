import 'package:articulos_examen/services/auth_provider.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  void _signOut(BuildContext context) async {
    final AuthProvider _auth = AuthProvider();
    _auth.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _signOut(context),
      icon: Icon(Icons.logout, color: Colors.black), // Texto
      label: Text(
        "",
        style: TextStyle(
          color: Colors.black, // Texto
          fontSize: 12,
        ),
      ),
    );
  }
}
