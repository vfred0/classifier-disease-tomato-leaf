import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Button extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const Button(this.title, this.icon, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 24)),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        onPressed: onClick,
        child: Row(
          children: [Icon(icon), const Gap(12), Text(title)],
        ),
      ),
    );
  }
}
