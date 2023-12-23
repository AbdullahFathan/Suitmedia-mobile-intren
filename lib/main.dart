import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/cubit/user/user_cubit.dart';
import 'package:suitmedia_test/screens/first_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: whiteColor,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}
