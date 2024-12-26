import 'package:flutter/material.dart';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

class CasesPromptor extends Promptor {
  CasesPromptor({required super.workspace});

  Variable? catchedVar;

  @override
  bool check() {
    if (workspace.selectedGoal == null) return false;

    for (var variable in workspace.selectedGoal!.variables) {
      if (variable.t.contains(RegExp('Or|\\/|∨'))) {
        catchedVar = variable;
        return true;
      }
    }
    return false;
  }

  @override
  Widget widget() => CasesWidget(
        catchedVar: catchedVar!,
      );
}

class CasesWidget extends StatelessWidget {
  const CasesWidget({super.key, required this.catchedVar});

  final Variable catchedVar;

  @override
  Widget build(BuildContext context) {
    // Workspace workspace = context.read<Workspace>();
    TextEditingController controller = TextEditingController();
    return PromptCard(
        child: Row(
          children: [
            const Text(
                style: TextStyle(fontFamily: 'XWWenkai', fontSize: 16), '对命题'),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryFixedDim),
                  hintText: catchedVar.name,
                ),
                controller: controller,
                onSubmitted: (value) {
                  context.read<Workspace>().runGoalTactic(
                      state: context.read<Workspace>().currentGoalState!,
                      goalId: context.read<Workspace>().selectedGoalId!,
                      tactic:
                          'cases ${controller.text.trim().isNotEmpty ? controller.text : (catchedVar.name ?? 'h')}'); // TODO: 语法检查和异常捕获
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
                style: TextStyle(fontFamily: 'XWWenkai', fontSize: 16), '分类讨论')
          ],
        ),
        onTap: () {
          context.read<Workspace>().runGoalTactic(
              state: context.read<Workspace>().currentGoalState!,
              goalId: context.read<Workspace>().selectedGoalId!,
              tactic:
                  'cases ${controller.text.trim().isNotEmpty ? controller.text : (catchedVar.name ?? 'h')}');
        });
  }
}
