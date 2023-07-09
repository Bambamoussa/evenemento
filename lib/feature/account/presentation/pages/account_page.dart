import 'package:evenemento/core/constants/app_images.dart';
import 'package:evenemento/feature/account/presentation/widget/account_item.dart';
import 'package:evenemento/feature/account/presentation/widget/user_avatar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon compte")),
      body: ListView(
        children: [
          const SizedBox(height: 24.0),
          const UserAvatar(image: AppImages.accountImage),
          const SizedBox(height: 24.0),
          const Divider(
            height: 0,
            thickness: 2,
            color: Colors.grey,
          ),
          Container(
            color: Colors.black,
            child: const Column(
              children: [
                AccountItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: "Information personnelle",
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                  height: 0,
                ),
                AccountItem(
                  icon: Icon(Icons.edit),
                  label: "Modifier son profile",
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                  height: 0,
                ),
                AccountItem(
                  icon: Icon(Icons.logout),
                  label: "Se déconnecter",
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                  height: 0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
