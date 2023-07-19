import 'package:flutter/material.dart';

void main() {
  runApp(User(
    name: 'Marcos',
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example using InheritedWidgets (:'),
      ),
      body: Center(
        child: Text(
          'Flutter developer! user ${User.of(context)?.name}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

class User extends InheritedWidget {
  User({
    required this.name,
    required Widget child,
  }) : super(child: child);

  final String name;

  static User? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<User>();
  }

  @override
  bool updateShouldNotify(User old) {
    return name != old.name;
  }
}
