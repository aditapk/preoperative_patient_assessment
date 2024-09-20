import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.expandRate,
  });
  final IconData leading;
  final String title;
  final double expandRate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width * expandRate,
      child: Row(
        children: [
          const SizedBox(
            width: 25,
          ),
          Icon(
            leading,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                letterSpacing: 0.8,
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
