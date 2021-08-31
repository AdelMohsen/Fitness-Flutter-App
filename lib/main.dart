import 'package:fitness_app/Dio_helper/dio.dart';
import 'package:fitness_app/bloc/main_bloc.dart';
import 'package:fitness_app/bloc/ob_server.dart';
import 'package:fitness_app/constans/strings.dart';
import 'package:fitness_app/constans/theme.dart';
import 'package:fitness_app/onboarding_screen/onboarding.dart';
import 'package:fitness_app/screens/main_layout.dart';
import 'package:fitness_app/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: mainColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  await Shared.init();
  doneOnBoarding = Shared.getBoolean(key: 'endOnBoarding');
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FitnessBloc()..getFitnessData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: doneOnBoarding == true ? MainScreen() : OnBoardingScreen(),
      ),
    );
  }
}
