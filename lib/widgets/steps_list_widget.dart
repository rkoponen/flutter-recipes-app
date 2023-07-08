import 'package:flutter/material.dart';

class StepsListWidget extends StatelessWidget {
  final List<String> steps;
  const StepsListWidget({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: steps.length,
              itemBuilder: (BuildContext context, int index) {
                final step = steps[index];
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: <TextSpan>[
                          TextSpan(
                              text: "${index + 1}: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: step)
                        ])));
              },
            )));
  }
}
