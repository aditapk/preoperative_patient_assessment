import 'package:flutter/material.dart';

class CardConditionDisplay extends StatelessWidget {
  const CardConditionDisplay({
    super.key,
    required this.title,
    required this.data,
    this.child,
  });

  final String title;
  final List<String> data;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          width: double.maxFinite,
          height: 40,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: data.map(
            (e) {
              int index = data.indexOf(e);
              return Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                color: index % 2 == 0
                    ? Colors.grey.shade100
                    : Colors.grey.shade200,
                width: double.maxFinite,
                child: Text(e),
              );
            },
          ).toList(),
        ),
        child ?? Container(),
      ],
    );
  }
}
