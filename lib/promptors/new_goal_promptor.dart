import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:leanf_dojo/promptors/new_goal_promptor.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

class NewGoalPromptor extends Promptor {
  NewGoalPromptor({required super.workspace});

  @override
  bool check() => (workspace.currentGoalState == null ||
      workspace.currentGoalState!.is_solved == true);

  @override
  Widget widget() {
    return const NewGoalWidget();
  }
}

class NewGoalWidget extends StatelessWidget {
  const NewGoalWidget({
    super.key,
    // required this.newGoalController,
  });

  // final TextEditingController newGoalController;

  @override
  Widget build(BuildContext context) {
    TextEditingController newGoalController = TextEditingController();
    return PromptCard(
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
                      color: Theme.of(context).colorScheme.secondaryFixedDim),
                  hintText: 'forall (p q: Prop), Or p q -> Or q p',
                ),
                controller: newGoalController,
                onSubmitted: (value) {
                  context.read<Workspace>().runGoalStart(
                      prop: newGoalController.text.trim().isNotEmpty
                          ? newGoalController.text
                          : 'forall (p q: Prop), Or p q -> Or q p'); // TODO: 语法检查和异常捕获
                },
              ),
            )
          ],
        ),
        onTap: () {
          context.read<Workspace>().runGoalStart(
              prop: newGoalController.text.trim().isNotEmpty
                  ? newGoalController.text
                  : 'forall (p q: Prop), Or p q -> Or q p'); // TODO: 语法检查和异常捕获
        });
  }
}
