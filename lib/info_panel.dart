import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:leanf_dojo/workplace_provider.dart';
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
    if (context.watch<Workspace>().currentGoalState?.goals.isEmpty ?? true) {
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
          // children: context
          //     .watch<Workspace>()
          //     .currentGoalState!
          //     .goals
          //     .map(goalCard)
          children: context
              .watch<Workspace>()
              .currentGoalState!
              .goals
              .indexed
              .map<Widget>((entry) => GoalCard(
                    goal: entry.$2,
                    goalId: entry.$1,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    // required this.context,
    required this.goal,
    required this.goalId,
    // required this.workspace,
  });

  // final BuildContext context;
  final Goal goal;
  final int goalId;
  // final Workspace workspace;

  @override
  Widget build(BuildContext context) {
    Workspace workspace = context.watch<Workspace>();
    return ConstrainedBox(
        constraints:
            const BoxConstraints(minHeight: 200, maxWidth: 500, minWidth: 80),
        child: GestureDetector(
          onTap: () {
            if (goalId == workspace.selectedGoalId) {
              workspace.selectedGoalId = null;
            } else {
              workspace.selectedGoalId = goalId;
            }
          },
          child: Card(
              elevation: goalId == workspace.selectedGoalId ? 6 : 2,
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
              )),
        ));
  }
}
