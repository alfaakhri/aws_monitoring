import 'package:aws_monitoring/domain/routes/routes.gr.dart';
import 'package:aws_monitoring/domain/usecase/aws_store.dart';
import 'package:aws_monitoring/domain/usecase/providers/user_provider.dart';
import 'package:aws_monitoring/domain/usecase/user_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(
    Injector(
      inject: [
        Inject(() => UserStore()),
        Inject(() => AwsStore()),
      ],
      builder: (context) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: GoogleFonts.openSans().fontFamily,
            textTheme: TextTheme(
                headline: TextStyle(fontSize: 24),
                title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                subhead: TextStyle(fontSize: 16),
                body2: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                body1: TextStyle(fontSize: 14),
                subtitle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                caption: TextStyle(fontSize: 12),
                overline: TextStyle(fontSize: 10))),
        initialRoute: Routes.rootPage,
        navigatorKey: Routes.navigatorKey,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
