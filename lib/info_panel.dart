import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
import 'package:provider/provider.dart';
// import 'package:leanf_dojo/models/theorem.dart';

String welcome_message = """
Welcome!
""";

class InfoPanel extends StatefulWidget {
  const InfoPanel({
    super.key,
  });

  @override
  State<InfoPanel> createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            SizedBox(
                height: 200,
                width: 160,
                child: Card(
                    child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('forall (p q: Prop), Or p q -> Or q p'),
                )))
          ],
        ),
      ),
    );
  }
}
