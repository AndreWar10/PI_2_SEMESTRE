import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OFCO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey key1 = GlobalKey();
  final GlobalKey key2 = GlobalKey();
  final GlobalKey key3 = GlobalKey();
  final GlobalKey key4 = GlobalKey();
  final GlobalKey key5 = GlobalKey();

  late final List listSections;

  late GlobalKey selectedSectionKey;

  void clickOnSection(int key) {
    setState(() {
      selectedSectionKey = listSections[key];
    });
    scroll();
  }

  @override
  void initState() {
    listSections = [key1, key2, key3, key4, key5];
    selectedSectionKey = key1;
    super.initState();
  }

  void scroll() {
    Scrollable.ensureVisible(
      selectedSectionKey.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionMenu(
              key: key1,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MenuItem(
                        text: 'Início',
                        index: 0,
                        scroll: (i) => clickOnSection(i),
                      ),
                      MenuItem(
                        text: 'Características',
                        index: 1,
                        scroll: (i) => clickOnSection(i),
                      ),
                      MenuItem(
                        text: 'Campeonatos',
                        index: 2,
                        scroll: (i) => clickOnSection(i),
                      ),
                      MenuItem(
                        text: 'Planos',
                        index: 3,
                        scroll: (i) => clickOnSection(i),
                      ),
                      MenuItem(
                        text: 'Fale Conosco',
                        index: 4,
                        scroll: (i) => clickOnSection(i),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SectionMenu(
              key: key2,
              color: Colors.purple,
              child: const SizedBox(),
            ),
            SectionMenu(
              key: key3,
              color: Colors.yellow,
              child: const SizedBox(),
            ),
            SectionMenu(
              key: key4,
              color: Colors.red,
              child: const SizedBox(),
            ),
            SectionMenu(
              key: key5,
              color: Colors.grey,
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.text,
    required this.index,
    required this.scroll,
  });

  final String text;
  final int index;
  final Function scroll;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

Color color = Colors.white;

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) => setState(() {
          color = const Color.fromARGB(255, 90, 255, 148);
        }),
        onExit: (event) => setState(() {
          color = Colors.white;
        }),
        child: GestureDetector(
          onTap: () {
            widget.scroll(widget.index);
          },
          child: Text(
            widget.text,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class SectionMenu extends StatelessWidget {
  const SectionMenu({super.key, required this.child, required this.color});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Container(
      color: color,
      height: mq.height,
      width: double.infinity,
      child: child,
    );
  }
}
