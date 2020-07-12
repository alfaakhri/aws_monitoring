import 'package:auto_route/auto_route_annotations.dart';
import 'package:aws_monitoring/presentation/master_page/login_page.dart';
import 'package:aws_monitoring/presentation/master_page/nav_bottom_page.dart';
import 'package:aws_monitoring/presentation/master_page/registration_page.dart';
import 'package:aws_monitoring/presentation/master_page/root_page.dart';
import 'package:aws_monitoring/presentation/page/home/me_page.dart';
import 'package:aws_monitoring/presentation/widgets/splash_page.dart';

//Class routes berfungsi untuk menghubungkan widget dengan widget yang lain atau 
//biasa kita sebut untuk membantu pindah halaman ke halaman yang kita mau
//flutter pub run build_runner watch --delete-conflicting-outputs <<---- jika ingin melakukan update routes
//cukup copy paste di terminal yang ada di visual studio code

@autoRouter
class $Routes {
  @initial
  RootPage rootPage;
  SplashPage splashPage;
  LoginPage loginPage;
  RegistrationPage registrationPage;
  NavBottomPage navBottomPage;
  MePage mePage;
}