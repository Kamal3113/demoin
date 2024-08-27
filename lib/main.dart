import 'package:demoapp/pages/initial/binding/splash_binding.dart';
import 'package:demoapp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var tempDir;

GetStorage storage = GetStorage();

class GlobalVariable {
  static final GlobalKey<ScaffoldMessengerState> navState =
      GlobalKey<ScaffoldMessengerState>();

  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
}

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (context, widget) => GetMaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          initialBinding: SplashBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          scaffoldMessengerKey: GlobalVariable.navState,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          defaultTransition: Transition.cupertino,
        ),
      ),
    );
  }
}
