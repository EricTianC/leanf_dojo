import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:provider/provider.dart';
// import 'package:leanf_dojo/models/theorem.dart';

String welcome_message = """
Welcome!
""";

class InfoPanel extends StatefulWidget {
  const InfoPanel({
    super.key,
  });

  @override
  State<InfoPanel> createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<DojoClient>().goalState?.goals.isEmpty ?? true) {
      return const Stack(
        children: [
          Center(
            child: Text(
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'XWWenkai',
                    fontWeight: FontWeight.w200),
                '暂无待证目标'),
          )
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: context
              .watch<DojoClient>()
              .goalState!
              .goals
              .map(goalCard)
              .toList(),
        ),
      ),
    );
  }

  ConstrainedBox goalCard(Goal goal) {
    return ConstrainedBox(
        constraints:
            const BoxConstraints(minHeight: 200, maxWidth: 500, minWidth: 80),
        child: Card(
            elevation: 2.0,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...goal.variables
                          .map((variable) => Text.rich(TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'JuliaMono',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade700,
                                    ),
                                    text: variable.name),
                                TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'JuliaMono',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  text: ': ${variable.t}',
                                ),
                                TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'JuliaMono',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  text: (variable.v != null)
                                      ? '= ${variable.v}'
                                      : '',
                                )
                              ]))),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixedVariant,
                                  fontFamily: 'JuliaMono',
                                  fontWeight:
                                      FontWeight.w600), // added fontWeight
                              text: '⊢ '),
                          TextSpan(
                            text: goal.target,
                            style: const TextStyle(fontFamily: 'SourceCode'),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Text(
                    goal.name ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            )));
  }
}
