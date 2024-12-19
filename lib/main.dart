import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
import 'package:leanf_dojo/info_panel.dart';
import 'package:leanf_dojo/library_panel.dart';
// import 'package:leanf_dojo/models/theorem.dart';
import 'package:leanf_dojo/prompt_panel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
// import 'package:desktop_webview_window/desktop_webview_window.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (runWebViewTitleBarWidget()) {
  //   return;
  // }
  runApp(const LeanfApp());
}

class LeanfApp extends StatelessWidget {
  const LeanfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DojoClient(),
      child: MaterialApp(
        title: "Leanf",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: "Leanf Example"),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _widePage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ResizableContainer(
            direction: Axis.horizontal,
            divider: ResizableDivider(
              color: Theme.of(context).colorScheme.surfaceDim,
              thickness: 2,
              // padding: 2,
            ),
            children: [
              ResizableChild(
                  size: const ResizableSize.ratio(5 / 8),
                  minSize: MediaQuery.of(context).size.height / 5,
                  child: ResizableContainer(
                      direction: Axis.vertical,
                      divider: ResizableDivider(
                        color: Theme.of(context).colorScheme.surfaceDim,
                        thickness: 2,
                        // padding: 2,
                      ),
                      children: [
                        ResizableChild(
                            size: const ResizableSize.ratio(3 / 5),
                            minSize: MediaQuery.of(context).size.height / 5,
                            child: const InfoPanel()),
                        ResizableChild(
                            minSize: MediaQuery.of(context).size.height / 5,
                            child: const PromptPanel()),
                      ])),
              ResizableChild(
                  minSize: MediaQuery.of(context).size.width / 5,
                  child: const LibraryPanel()),
            ]));
  }

  Widget _narrowPage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu_book),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            }),
          ],
        ),
        endDrawer: const Drawer(
          child: LibraryPanel(),
        ),
        body: ResizableContainer(
            direction: Axis.vertical,
            divider: ResizableDivider(
              color: Theme.of(context).colorScheme.surfaceDim,
              thickness: 2,
              // padding: 2,
            ),
            children: [
              ResizableChild(
                  size: const ResizableSize.ratio(3 / 5),
                  minSize: MediaQuery.of(context).size.height / 5,
                  child: const InfoPanel()),
              ResizableChild(
                  minSize: MediaQuery.of(context).size.height / 5,
                  child: const PromptPanel()),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width > 600 ||
        screenSize.height / screenSize.width > 5 / 3) {
      return _widePage(context);
    } else {
      return _narrowPage(context);
    }
  }
}
