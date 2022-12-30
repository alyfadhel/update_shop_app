import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/home_layout.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/core/observer/observer.dart';
import 'package:shop_now/core/resources/theme_manager.dart';
import 'package:shop_now/core/service/service_locator.dart';
import 'package:shop_now/features/login/presentation/screens/login.dart';
import 'package:shop_now/features/on_boarding/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  token = sl<SharedPreferences>().getString('token');
  debugPrint(token);
  bool? onBoarding = sl<SharedPreferences>().getBool('onBoarding');
  debugPrint(onBoarding.toString());
  Widget widget;
  if(onBoarding!=null){
    if(token!=null){
      widget = const HomeLayout();
    }else{
      widget = const LoginScreen();
    }
  }else{
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()..getHome()..getCategories()..getFavorites()..getProfile()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationLightTheme(),
        home: startWidget,
      ),
    );
  }
}

