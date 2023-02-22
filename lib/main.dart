
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init_structure/Data/Repo/class_repo.dart';

import 'Logic/Bloc/forget_password_bloc/forget_password_bloc.dart';
import 'Logic/Bloc/signup_login_bloc/signup_login_bloc.dart';
import 'routs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appGenerateRoute = AppRoute();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpLogInBloc(ClassRepo()),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appGenerateRoute.onGenerateRoute,
        initialRoute:
        "/",
            // FirebaseAuth.instance.currentUser == null ? "/" : "/HomeScreen",
      ),
    );
  }
}
