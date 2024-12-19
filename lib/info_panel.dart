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
          children: [
            goalCard(Goal(
                name: 'id',
                target: 'forall (p q: Prop), Or p q -> Or q p',
                variables: [],
                sibling_dep: [],
                is_conversion: false)),
          ],
        ),
      ),
    );
  }

  ConstrainedBox goalCard(Goal goal) {
    return ConstrainedBox(
        constraints:
            const BoxConstraints(minHeight: 200, maxWidth: 500, minWidth: 80),
        child: Card(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryFixedVariant,
                          fontFamily: 'JuliaMono',
                          fontWeight: FontWeight.w600), // added fontWeight
                      text: '⊢ '),
                  TextSpan(
                    text: goal.target,
                    style: const TextStyle(fontFamily: 'SourceCode'),
                  )
                ]),
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
