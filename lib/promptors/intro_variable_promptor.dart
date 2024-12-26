import 'package:flutter/material.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

class IntroVariablePromptor extends Promptor {
  IntroVariablePromptor({required super.workspace});

  @override
  bool check() =>
      (workspace.selectedGoal?.target.startsWith(RegExp('forall|∀')) ?? false);

  @override
  Widget widget() => const IntroVariableWidget();
}

class IntroVariableWidget extends StatelessWidget {
  const IntroVariableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Workspace workspace = context.read<Workspace>();
    TextEditingController controller = TextEditingController();
    return PromptCard(
        child: Row(
          children: [
            const Text(
                style: TextStyle(fontFamily: 'XWWenkai', fontSize: 16), '引入变量'),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryFixedDim),
                  hintText: 'p',
                ),
                controller: controller,
                onSubmitted: (value) {
                  context.read<Workspace>().runGoalTactic(
                      state: context.read<Workspace>().currentGoalState!,
                      goalId: context.read<Workspace>().selectedGoalId!,
                      tactic: 'intro ${controller.text}'); // TODO: 语法检查和异常捕获
                },
              ),
            )
          ],
        ),
        onTap: () {
          context.read<Workspace>().runGoalTactic(
              state: context.read<Workspace>().currentGoalState!,
              goalId: context.read<Workspace>().selectedGoalId!,
              tactic: 'intro ${controller.text}');
        });
  }
}
