import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: SelectionArea(
            child: Text(context.watch<DojoClient>().goalState?.toString() ??
                welcome_message)),
      ),
    );
  }
}
