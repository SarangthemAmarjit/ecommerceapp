// 🐦 Flutter imports:
import 'package:ecommerceapp/core/app_config/app_config.dart';
import 'package:ecommerceapp/core/generated/l10n.dart';
import 'package:ecommerceapp/core/static/_static_strings.dart';
import 'package:ecommerceapp/core/theme/_app_theme.dart';
import 'package:ecommerceapp/providers/_ecommerce_product_list_provider.dart';
import 'package:ecommerceapp/providers/_language_provider.dart' show AppLanguageProvider;
import 'package:ecommerceapp/providers/_theme_provider.dart';
import 'package:ecommerceapp/routes/app_bindings.dart';
import 'package:ecommerceapp/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// 📦 Package imports:

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_strategy/url_strategy.dart';

// 🌎 Project imports:


Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  ResponsiveGridBreakpoints.value = ResponsiveGridBreakpoints(
    sm: 576,
    md: 1240,
    lg: double.infinity,
  );

  final _app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppThemeProvider()),
      ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
      ChangeNotifierProvider(create: (_) => ECommerceMockProductsNotifier()),
    ],
    child: const AcnooApp(),
  );
  runApp(_app);
}

class AcnooApp extends StatelessWidget {
  const AcnooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, AppLanguageProvider>(
      builder: (context, appTheme, appLang, child) {
        return rf.ResponsiveBreakpoints.builder(
          breakpoints: [
            rf.Breakpoint(
              start: BreakpointName.XS.start,
              end: BreakpointName.XS.end,
              name: BreakpointName.XS.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.SM.start,
              end: BreakpointName.SM.end,
              name: BreakpointName.SM.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.MD.start,
              end: BreakpointName.MD.end,
              name: BreakpointName.MD.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.LG.start,
              end: BreakpointName.LG.end,
              name: BreakpointName.LG.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.XL.start,
              end: BreakpointName.XL.end,
              name: BreakpointName.XL.name,
            ),
          ],
          child: GetMaterialApp(
            title: AppConfig.appName,
          
      debugShowCheckedModeBanner: false,
        theme: AcnooAppTheme.kLightTheme(),
            darkTheme: AcnooAppTheme.kDarkTheme(),
            themeMode: appTheme.themeMode,
      initialBinding: AppBindings(),
      getPages: AppPages.pages,
         

            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(rf.ResponsiveValue<double>(
                  context,
                  conditionalValues: [],
                  defaultValue: 1.0,
                ).value),
              ),
              child: Directionality(
                textDirection: appLang.isRTL
                    ? TextDirection.rtl
                    : Directionality.of(context),
                child: Stack(
                  children: [
                    Positioned.fill(child: child!),
                    if (kDebugMode)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Material(
                          child: Text("${MediaQuery.sizeOf(context)}"),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Language & Locale
            locale: appLang.currentLocale,
      
           localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

            // Navigation Configuration
          
      
          ),
        );
      },
    );
  }
}
