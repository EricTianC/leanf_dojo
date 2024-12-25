/// Prompt 提示器的抽象类
/// Prompter 应有接收 Workspace 返回 Widget 的能力
library;

import 'package:flutter/material.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

abstract class Promptor {
  Workspace workspace;

  bool check();
  Widget widget();

  Promptor({required this.workspace});
}

class PromptCard extends StatelessWidget {
  const PromptCard({
    super.key,
    // required this.context,
    required this.child,
    required this.onTap,
  });

  // final BuildContext context;
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

class ResetPromptor extends Promptor {
  ResetPromptor({required super.workspace});

  @override
  bool check() => true;
  @override
  Widget widget() {
    return const ResetWidget();
  }
}

class ResetWidget extends StatelessWidget {
  const ResetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PromptCard(
        child: const Text(style: TextStyle(fontFamily: 'XWWenkai'), '重置'),
        onTap: () {
          context.read<Workspace>().currentGoalState = null;
        });
  }
}

class UseTacticPromptor extends Promptor {
  UseTacticPromptor({required super.workspace});

  @override
  bool check() => (workspace.selectedGoalId != null);

  @override
  Widget widget() {
    return UseTacticWidget();
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
                      goalId: 0,
                      tactic: useTacticController.text); // TODO: 语法检查和异常捕获
                },
              ),
            )
          ],
        ),
        onTap: () {
          context.read<Workspace>().runGoalTactic(
              state: context.read<Workspace>().currentGoalState!,
              goalId: 0,
              tactic: useTacticController.text);
        });
  }
}
