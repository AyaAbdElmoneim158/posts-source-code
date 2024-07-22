import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Fake Store",
        style: TextStyle(color: Color(0xFF802c6e), fontWeight: FontWeight.bold),
      ),
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(57);
}
