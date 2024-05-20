import 'package:auto_control_panel/providers/tarefa_provider.dart';
import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:auto_control_panel/screens/about_screen.dart';
import 'package:auto_control_panel/screens/details_screen.dart';
import 'package:auto_control_panel/screens/form_screen.dart';
import 'package:auto_control_panel/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = AuthProvider();
    authProvider.signUp('bruno@infopack.com.br', '654321');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TarefaProvider>(
            create: (context) => TarefaProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
      ],
      //create: (context) => AbastProvider(),
      child: MaterialApp(
        title: 'Auto Control Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor:Colors.yellow[50],
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
        routes: {
          //Registando as possíveis rotas,
          //Routes.SIGNUP: (context) => SignupScreen(),
          Routes.HOME: (context) => HomeScreen(),
          Routes.ABOUT: (context) => AboutScreen(),
          Routes.DETAILS:  (context) => DetailsScreen(),
          Routes.FORM: (context) => FormScreen(),
        },
      ),
    );
  }
}
