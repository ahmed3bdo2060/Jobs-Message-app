import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/auth/create_account/create_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/create_account/second_page/create_account_second_view.dart';
import 'auth/create_account/third_page/create_account_Third_view.dart';
import 'auth/login/login_view.dart';
import 'auth/resset_password/resset_password_view.dart';
import 'core/componnet/app_theme.dart';
import 'core/logic/cash_helper.dart';
import 'core/logic/helper_methods.dart';
import 'home_screens/home-screen.dart';
import 'home_screens/pages/apply-job/apply/bio_data.dart';
import 'home_screens/pages/apply-job/apply/success_page.dart';
import 'home_screens/pages/apply-job/apply/type_of_work.dart';
import 'home_screens/pages/apply-job/apply/upload_port.dart';
import 'home_screens/pages/apply-job/apply_job.dart';
import 'home_screens/pages/home_page/home.dart';
import 'home_screens/pages/messages/messages.dart';
import 'home_screens/pages/notification/notification.dart';
import 'home_screens/pages/notification/notification_empty.dart';
import 'home_screens/pages/saved/save_job.dart';
import 'home_screens/pages/seaech/search_page.dart';
import 'home_screens/pages/seaech/search_result/search_results.dart';
import 'service_locator.dart';
import 'test/test.dart';
import 'test/test1.dart';
import 'test/test2.dart';
import 'test/test_message.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(options:
    FirebaseOptions( apiKey: "AIzaSyDD4VcYkYEN819q1pCQL6cwj9PqAcwyoAo",
        authDomain: "message-app-5241c.firebaseapp.com",
        projectId: "message-app-5241c",
        storageBucket: "message-app-5241c.appspot.com",
        messagingSenderId: "820896572383",
        appId: "1:820896572383:web:cc57f02c845b9c00641a6a"));
  }else{
    await Firebase.initializeApp();
  }


  final customCacheManager = CacheManager(Config("cacheKey",
      stalePeriod: Duration(days: 20), maxNrOfCacheObjects: 200));
  SharedPreferences prefss = await SharedPreferences.getInstance();
  await CashHelper.init();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: "assets/translation",
      supportedLocales: [
        Locale("en"),
        Locale("en"),
      ],
      fallbackLocale: Locale("en"),
      startLocale: Locale("en"),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: TestViewMessage(),
        builder: (context, child) => MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme:AppTheme.light,
            title: "JOBSQUE",
            routes: {
              TestView.screenRoute:(context) => TestView(),
              TestView1.signIn:(context) => TestView1(),
              TestView2.register:(context) => TestView2(),
              TestViewMessage.message:(context) => TestViewMessage(),
            },
            initialRoute:TestViewMessage.message,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // home: child
        ),
      ),
    );
  }
}
