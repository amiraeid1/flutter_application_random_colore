import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: Myapp()));
}

final color = StateProvider((ref) {
  return Color.fromRGBO(255,255,255,1);
});

class Myapp extends ConsumerWidget {
  const Myapp({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: ref.watch(color),
          child: Center(
              child: InkWell(
                  child: const Text("hey there"),
                  onTap: () {
                    ref.watch(color.notifier).update((state) {
                      return
                      Color.fromRGBO(Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256), 1);
                    });
                  })),
        ),
      ),
    );
  }
}
