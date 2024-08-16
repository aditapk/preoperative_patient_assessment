import 'package:flutter/material.dart';

class SummaryConsultDialog extends StatelessWidget {
  const SummaryConsultDialog({
    super.key,
    this.content,
    this.onOK,
    this.height,
  });

  final Widget? content;
  final Function()? onOK;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: height ?? 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),

              // Confirm header
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.65,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Icon(
                      Icons.double_arrow,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Summary',
                      style: TextStyle(
                          letterSpacing: 0.8,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: Center(child: content),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              onPressed: onOK,
              child: const Text('OK'),
            ),
          )
        ],
      ),
    );
  }
}
