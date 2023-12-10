import 'package:flutter/material.dart';

class CardInfoFeature extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function()? onTap;
  const CardInfoFeature(this.name, this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEBE6E6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(name),
            leading: Icon(icon),
          ),
        ),
      ),
    );
  }
}
