import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(repository);
      },
      child: MaterialApp(
          initialRoute: RouteGenerator.homePage,
          onGenerateRoute: RouteGenerator.generateRoute,

          localizationsDelegates: [
            const AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale.fromSubtags(languageCode: "en"),
            Locale.fromSubtags(languageCode: "it"),
          ],
          onGenerateTitle: (context) => context.localize("title"),
          debugShowCheckedModeBanner: false,
      )
    );
  }
}
