
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/service/service_locator.dart';
import 'package:shop_now/features/login/presentation/screens/login.dart';
import 'package:shop_now/features/on_boarding/on_boarding.dart';

const String baseApiUrl = 'https://student.valuxapps.com';
const String version = '/api';
const String loginEndPoint = '/login';
const String profileEndPoint = '/profile';
const String registerEndPoint = '/register';
const String homeEndPoint = '/home';
const String categoriesEndPoint = '/categories';
const String updateProfileEndPoint = '/update-profile';
const String searchEndPoint = '/products/search';
const String changeFavoritesEndPoint = '/favorites';
const String favoritesEndPoint = '/favorites';
const String logoutEndPoint = '/logout';
const String notificationsEndPoint = '/notifications';
String categoriesDetailsEndPoint(int categoriesId)=> '/categories/$categoriesId';

String productsDetailsEndPoint(int productsId)=>'/products/$productsId';



 String? token = '';

 class Constance{
  void singOut(context)async
  {
   sl<SharedPreferences>().remove('token').then((value)
   {
    if(value){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
    }
   });
  }
 }
