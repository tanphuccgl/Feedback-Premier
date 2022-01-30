import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/pages/form_review_page.dart';
import 'package:review_premier_pearl/feature/review_offline/provider/locale_provider.dart';
import 'package:review_premier_pearl/l10n/l10n.dart';
import 'core/config/injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/config/injection_container.dart';
import 'core/utils/page_routers.dart';
import 'feature/review_offline/presentation/managers/post_review_offline_bloc.dart';
import 'feature/review_offline/presentation/pages/review_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'feature/review_offline/presentation/pages/thank_you_page.dart';

late Timer timer;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  HttpOverrides.global = MyHttpOverrides();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            BlocProvider(create: (_) => sl<PostReviewOfflineBloc>()),
          ],
          child: MaterialApp(
            title: 'Feedback Premier',
            locale: Provider.of<LocaleProvider>(context).locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              PageRoutes.reviewPage: (context) => const ReviewPage(
                    isHome: true,
                  ),
              PageRoutes.formReviewPage: (context) => const FormReviewPage(),
              PageRoutes.thankYouPage: (context) => const ThankYouPage(),
            },
            debugShowCheckedModeBanner: false,
            home: const ReviewPage(
              isHome: true,
            ),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
