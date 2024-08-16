import 'package:flutter/material.dart';

class ConfirmationTextDialog extends StatefulWidget {
  const ConfirmationTextDialog(
      {super.key, required this.content, this.onCancel, this.onOK});

  final Widget? content;
  final Function()? onOK;
  final Function()? onCancel;
  @override
  State<ConfirmationTextDialog> createState() => _ConfirmationTextDialogState();
}

class _ConfirmationTextDialogState extends State<ConfirmationTextDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 130,
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
                    'Confirmation',
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
            SizedBox(
              height: 60,
              child: Center(
                child: widget.content,
              ),
            ),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade700),
            onPressed: widget.onCancel,
            child: const Text('Cancel'),
          ),
        ),
        SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
            onPressed: widget.onOK,
            child: const Text('OK'),
          ),
        )
      ],
    );
  }
}
