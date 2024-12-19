import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
// import 'package:leanf_dojo/models/pantograph.dart';
import 'package:provider/provider.dart';
// import 'package:leanf_dojo/models/theorem.dart';

String welcome_message = """
Welcome!
""";

class PromptPanel extends StatefulWidget {
  const PromptPanel({
    super.key,
  });

  @override
  State<PromptPanel> createState() => _PromptPanelState();
}

class _PromptPanelState extends State<PromptPanel> {
  List<Widget> promptList(DojoClient dojoClient) {
    if (dojoClient.goalState == null || dojoClient.goalState!.is_solved) {
      // 当未开始定理证明时
      TextEditingController newGoalController = TextEditingController();
      return [
        PromptCard(
            context: context,
            child: Row(
              children: [
                const Text(
                    style: TextStyle(fontFamily: 'XWWenkai', fontSize: 16),
                    '开始一个新定理'),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.secondaryFixedDim),
                      hintText: 'forall (p q: Prop), Or p q -> Or q p',
                    ),
                    controller: newGoalController,
                    onSubmitted: (value) {
                      dojoClient.goalStart(
                          prop: newGoalController.text); // TODO: 语法检查和异常捕获
                    },
                  ),
                )
              ],
            ),
            onTap: () {
              dojoClient.goalStart(
                  prop: newGoalController.text); // TODO: 语法检查和异常捕获
            }),
      ];
    } else {
      // 已有命题时
      TextEditingController useTacticController = TextEditingController();
      return [
        PromptCard(
            context: context,
            child: const Text(style: TextStyle(fontFamily: 'XWWenkai'), '重置'),
            onTap: () {
              dojoClient.resetGoal();
            }),
        PromptCard(
            context: context,
            child: Row(
              children: [
                const Text(
                    style: TextStyle(fontFamily: 'XWWenkai', fontSize: 16),
                    '使用策略:'),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.secondaryFixedDim),
                      hintText: 'exact?',
                    ),
                    controller: useTacticController,
                    onSubmitted: (value) {
                      dojoClient.goalTactic(
                          session: dojoClient.session!,
                          goalId: 0,
                          tactic: useTacticController.text); // TODO: 语法检查和异常捕获
                    },
                  ),
                )
              ],
            ),
            onTap: () {
              dojoClient.goalTactic(
                  session: dojoClient.session!,
                  goalId: 0,
                  tactic: useTacticController.text);
            })
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: promptList(context.watch<DojoClient>()),
        ),
      ),
    );
  }
}

class PromptCard extends StatelessWidget {
  const PromptCard({
    super.key,
    required this.context,
    required this.child,
    required this.onTap,
  });

  final BuildContext context;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5.0),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.secondaryContainer,
                width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
