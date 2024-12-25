import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
// import 'package:leanf_dojo/promptors/reset_promptor.dart';
import 'package:leanf_dojo/workplace_provider.dart';
import 'package:provider/provider.dart';

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
