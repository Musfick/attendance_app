import 'package:attendance_app/features/stores/data/model/store.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/utils/extensition.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class SingleStoreScreen extends StatelessWidget {
  final Store store;

  const SingleStoreScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Details"),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset("assets/images/map_bg.png"),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  elevation: 2.0,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(1.0),
                  child: RippleAnimation(
                      repeat: true,
                      color: colorScheme.primary,
                      minRadius: 40,
                      ripplesCount: 3,
                      child: Icon(
                        FluentIcons.circle_24_filled,
                        color: colorScheme.primary,
                      )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("${store.name?.toCapitalized()}",
                    style: textTheme.titleLarge),
                const SizedBox(
                  height: 16,
                ),
                Text("${store.address?.toCapitalized()}",
                    textAlign: TextAlign.center, style: textTheme.bodyLarge),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
