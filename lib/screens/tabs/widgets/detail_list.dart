import 'package:flutter/material.dart';

class DetailList extends StatefulWidget {
  const DetailList({
    super.key,
    required this.detail,
  });
  final List<String> detail;

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  final List<Color> tableColor = [
    Colors.grey.shade100,
    Colors.grey.shade300,
  ];

  @override
  Widget build(BuildContext context) {
    return widget.detail.isNotEmpty
        ? Column(
            children: widget.detail.map((e) {
              int index = widget.detail.indexOf(e);
              return Container(
                color: tableColor[index % 2],
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: Text(
                    widget.detail[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        : Container(
            color: tableColor[0],
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                'Not selected',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
