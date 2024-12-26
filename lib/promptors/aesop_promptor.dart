import 'package:flutter/material.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

class AesopPromptor extends Promptor {
  AesopPromptor({required super.workspace});

  @override
  bool check() => workspace.selectedGoal?.toString().contains('Prop') ?? false;

  @override
  Widget widget() => const AesopWidget();
}

class AesopWidget extends StatelessWidget {
  const AesopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Workspace workspace = context.read<Workspace>();
    return PromptCard(
        child: const Text(
            style: TextStyle(fontFamily: 'XWWenkai'), 'Aesop (直接解决部分简单逻辑问题)'),
        onTap: () {
          workspace.runGoalTactic(
              state: workspace.currentGoalState!,
              goalId: workspace.selectedGoalId!,
              tactic: "aesop");
        });
  }
}
