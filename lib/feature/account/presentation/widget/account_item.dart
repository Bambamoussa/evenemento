import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String label;
  final Widget icon;
  const AccountItem({
    required this.label,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 50,
        child: ListTile(
          leading: icon,
          title: Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
