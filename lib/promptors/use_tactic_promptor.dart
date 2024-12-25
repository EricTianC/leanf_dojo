import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
// import 'package:leanf_dojo/promptors/use_tactic_promptor.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

class UseTacticPromptor extends Promptor {
  UseTacticPromptor({required super.workspace});

  @override
  bool check() => (workspace.selectedGoalId != null);

  @override
  Widget widget() {
    return const UseTacticWidget();
  }
}

class UseTacticWidget extends StatelessWidget {
  const UseTacticWidget({
    super.key,
    // required this.context,
    // required this.useTacticController,
  });

  // final BuildContext context;
  // final TextEditingController useTacticController;

  @override
  Widget build(BuildContext context) {
    TextEditingController useTacticController = TextEditingController();
    return PromptCard(
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
                      color: Theme.of(context).colorScheme.secondaryFixedDim),
                  hintText: 'exact?',
                ),
                controller: useTacticController,
                onSubmitted: (value) {
                  context.read<Workspace>().runGoalTactic(
                      state: context.read<Workspace>().currentGoalState!,
                      goalId: context.read<Workspace>().selectedGoalId!,
                      tactic: useTacticController.text); // TODO: 语法检查和异常捕获
                },
              ),
            )
          ],
        ),
        onTap: () {
          context.read<Workspace>().runGoalTactic(
              state: context.read<Workspace>().currentGoalState!,
              goalId: context.read<Workspace>().selectedGoalId!,
              tactic: useTacticController.text);
        });
  }
}
