import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Circular Progress Indicator'),
          const SizedBox(height: 15),
          CircularProgressIndicator(
              color: colors.primary,
              strokeWidth: 2,
              backgroundColor: Colors.black12),
          const SizedBox(height: 30),
          const Text('Progress Indicator controlado (Linear & Circular)'),
          const SizedBox(height: 15),
          const _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (progress) {
          return (progress * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;        

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                    value: progressValue,
                    color: colors.primary,
                    strokeWidth: 8,
                    backgroundColor: Colors.black12),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                    value: progressValue,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(20),
                )),
              ],
            ),
          );
        });
  }
}
