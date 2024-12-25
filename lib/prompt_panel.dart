import 'package:flutter/material.dart';
import 'package:leanf_dojo/promptors/new_goal_promptor.dart';
import 'package:leanf_dojo/promptors/promptor.dart';
import 'package:leanf_dojo/promptors/use_tactic_promptor.dart';
// import 'package:leanf_dojo/dojo_client.dart';
import 'package:leanf_dojo/workplace_provider.dart';
// import 'package:leanf_dojo/models/pantograph.dart';
import 'package:provider/provider.dart';
// import 'package:leanf_dojo/models/theorem.dart';

class PromptPanel extends StatefulWidget {
  const PromptPanel({
    super.key,
  });

  @override
  State<PromptPanel> createState() => _PromptPanelState();
}

class _PromptPanelState extends State<PromptPanel> {
  @override
  Widget build(BuildContext context) {
    Workspace workspace = context.watch<Workspace>();
    List<Promptor> promptors = [
      // ResetPromptor(workspace: workspace),
      NewGoalPromptor(workspace: workspace),
      UseTacticPromptor(workspace: workspace)
    ];
    List<Widget> cards = [];

    for (var promptor in promptors) {
      if (promptor.check()) {
        cards.add(promptor.widget());
      }
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Wrap(spacing: 20, runSpacing: 20, children: cards),
      ),
    );
  }
}
