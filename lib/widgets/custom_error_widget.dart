import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onClick;
  const CustomErrorWidget({Key? key, required this.message, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(FluentIcons.plug_disconnected_28_filled, size: 40,),
        const SizedBox(
          height: 16,
        ),
        Text(message, style: textTheme.titleMedium,),
        const SizedBox(
          height: 16,
        ),
        OutlinedButton(onPressed: onClick, child: const Text("Retry"))
      ],
    );
  }
}
