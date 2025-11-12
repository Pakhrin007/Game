import 'package:banana/screens/leaderBoard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/colors.dart';
import '../core/routes.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // ✅ Sign out from Firebase
      Navigator.pushReplacementNamed(context, AppRoutes.login); // Go to Login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged out successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: VStack(
        [
          50.heightBox,

          // Profile Avatar
          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ).centered(),

          20.heightBox,
          "Profile".text.xl2.bold.color(AppColors.primaryColor).makeCentered(),

          30.heightBox,

          // Home Tile
          ListTile(
            leading: Icon(Icons.home, color: AppColors.primaryColor),
            title: "Home".text.make(),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),

          // Leaderboard Tile
          ListTile(
            leading: Icon(Icons.leaderboard, color: AppColors.primaryColor),
            title: "Leaderboard".text.make(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LeaderboardWidget()),
              );
            },
          ),

          // Logout Tile
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: "Logout".text.color(Colors.red).make(),
            onTap: () => _logout(context), // ✅ Call logout function
          ),
        ],
        crossAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
