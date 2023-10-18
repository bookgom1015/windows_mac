import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/pages/main_page.dart';
import 'package:windows_mac/widgets/models/control_manager_model.dart';
import 'package:windows_mac/widgets/models/start_menu_model.dart';

void main() {
  runApp(const WindowsMacApp());
}

class WindowsMacApp extends StatelessWidget {
  const WindowsMacApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Windows Mac',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => StartMenuModel()),
          ChangeNotifierProvider(create: (context) => ControlManagerModel()),
        ], 
        child: const MainPage()),
    );
  }
}
