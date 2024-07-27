import '../../screens/cart_screen.dart';
import '../../screens/products_overview_scr.dart';
import '../../screens/products_wishlist.dart';
import '../../screens/profile_page.dart';
import '../Colors/appcolors.dart';
import 'package:flutter/material.dart';

class AppComponent {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static ThemeData get theme {
    return ThemeData(
        primaryColor: Appcolors.appThemeColor,
        primarySwatch: createMaterialColor(Appcolors.appThemeColor),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: createMaterialColor(Appcolors.appThemeColor))
            .copyWith(secondary: Appcolors.appThemeSecondaryColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
            displayLarge: TextStyle(color: Appcolors.appThemeColor),
            bodyLarge: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            titleSmall: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            labelMedium: TextStyle(color: Colors.black, fontSize: 15)),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Color(0xFFEE7843),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFEE7843),
          textTheme: ButtonTextTheme.primary,
        ),
        dialogTheme: const DialogTheme(backgroundColor: Colors.white),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFEE7843),
        ),
        scaffoldBackgroundColor: Appcolors.offwhite,
        drawerTheme: DrawerThemeData(backgroundColor: Colors.white));
  }

  Widget sliderIndicators(
    imagesLength,
    currentIndex, [
    Color? enableColor,
    Color? disableColor,
    double? size,
  ]) {
    final list = List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: size ?? 10,
        height: size ?? 10,
        decoration: BoxDecoration(
            color: (currentIndex == index)
                ? enableColor ?? Colors.black
                : disableColor ?? Colors.white24,
            shape: BoxShape.circle),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  List<Widget?> navViews() {
    return [
      const ProductsOverviewScr(),
      const CartScreen(),
      const ProductsWishlist(),
      const ProfilePage()
    ];
  }
}
