import 'auth_provider.dart';

import 'brand_screen_provider.dart';
import 'cart_screen_provider.dart';
import 'category_screen_provider.dart';
import 'checkout_screen_provider.dart';
import 'product_details_provider.dart';
import 'product_overview_provider.dart';
import 'profile_screen_provider.dart';
import 'root_screen_provider.dart';
import 'wishlist_screen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rootPageProvider =
    ChangeNotifierProvider<RootScreenProvider>((ref) => RootScreenProvider());

final detailsPageProvider = ChangeNotifierProvider<ProductDetailsProvider>(
    (ref) => ProductDetailsProvider());
final categoryPageProvider = ChangeNotifierProvider<CategoryScreenProvider>(
    (ref) => CategoryScreenProvider());

final profilePageProvider = ChangeNotifierProvider<ProfileScreenProvider>(
    (ref) => ProfileScreenProvider());

final productOverviewPageProvider =
    ChangeNotifierProvider<ProductOverviewProvider>(
        (ref) => ProductOverviewProvider());
final cartPageProvider =
    ChangeNotifierProvider<CartScreenProvider>((ref) => CartScreenProvider());
final wishlistPageProvider = ChangeNotifierProvider<WishlistScreenProvider>(
    (ref) => WishlistScreenProvider());
final bandPageProvider =
    ChangeNotifierProvider<BrandScreenProvider>((ref) => BrandScreenProvider());
final checkoutPageProvider = ChangeNotifierProvider<CheckoutScreenProvider>(
    (ref) => CheckoutScreenProvider());
final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());
