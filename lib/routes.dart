import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/hotel_detail_page.dart';
import 'pages/booking_page.dart';

class Routes {
  static const splash       = '/';
  static const login        = '/login';
  static const register     = '/register';
  static const home         = '/home';
  static const hotelDetail  = '/hotel_detail';
  static const booking      = '/booking';

  static Map<String, WidgetBuilder> getAll() {
    return {
      splash      : (_) => const SplashPage(),
      login       : (_) => const LoginPage(),
      register    : (_) => const RegisterPage(),
      home        : (_) => const HomePage(),
      hotelDetail : (_) => const HotelDetailPage(),
      booking     : (_) => const BookingPage(),
    };
  }
}
