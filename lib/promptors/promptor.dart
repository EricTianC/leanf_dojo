/// Prompt 提示器的抽象类
/// Prompter 应有接收 Workspace 返回 Widget 的能力
library;

import 'package:flutter/material.dart';
import 'package:leanf_dojo/workplace_provider.dart';
// import 'package:provider/provider.dart';

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
