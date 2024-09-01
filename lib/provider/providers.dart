import 'package:bajarbd/model/data/auth_repos.dart';
import 'package:bajarbd/model/data/bestsell_product_repos.dart';
import 'package:bajarbd/model/data/brand_scr_repos.dart';
import 'package:bajarbd/model/data/cart_model_repos.dart';
import 'package:bajarbd/model/data/cat_wise_repos.dart';
import 'package:bajarbd/model/data/category_scr_repos.dart';
import 'package:bajarbd/model/data/checkout_page_repos.dart';
import 'package:bajarbd/model/data/cod_repos.dart';
import 'package:bajarbd/model/data/customer_details_repos.dart';
import 'package:bajarbd/model/data/featured_product_repos.dart';
import 'package:bajarbd/model/data/home_latest_product_repos.dart';
import 'package:bajarbd/model/data/hotdeal_product_repos.dart';
import 'package:bajarbd/model/data/online_pay_repos.dart';
import 'package:bajarbd/model/data/order_history_repos.dart';
import 'package:bajarbd/model/data/order_track_repos.dart';
import 'package:bajarbd/model/data/search_repos.dart';
import 'package:bajarbd/model/data/settings_repos.dart';
import 'package:bajarbd/model/data/shipping_address_repos.dart';
import 'package:bajarbd/model/data/single_product_repos.dart';
import 'package:bajarbd/model/data/slider_model_repos.dart';
import 'package:bajarbd/model/data/ssl_cred_repos.dart';
import 'package:bajarbd/model/data/wishlist_model_repos.dart';
import 'package:bajarbd/provider/category_wise_provider.dart';
import 'package:bajarbd/provider/order_history_provider.dart';
import 'package:bajarbd/provider/order_track_provider.dart';
import 'package:bajarbd/provider/search_provider.dart';
import 'package:bajarbd/provider/settings_provider.dart';

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

//---all repos initialization//
final authRepos = Provider<AuthRepos>((ref) => AuthRepos());
final bestSellRepos =
    Provider<BestSellProductRepos>((ref) => BestSellProductRepos());
final brandScreenRepos = Provider<BrandScrRepos>((ref) => BrandScrRepos());
final cartModelRepos = Provider<CartModelRepos>((ref) => CartModelRepos());
final catWiseRepos = Provider<CatWiseRepos>((ref) => CatWiseRepos());
final categoryScreenRepos =
    Provider<CategoryScrRepos>((ref) => CategoryScrRepos());
final checkOutPageRepos =
    Provider<CheckoutPageRepos>((ref) => CheckoutPageRepos());
final codRepos = Provider<CodRepos>((ref) => CodRepos());
final customerDetailsRepos =
    Provider<CustomerDetailsRepos>((ref) => CustomerDetailsRepos());
final featuredProductRepos =
    Provider<FeaturedProductRepos>((ref) => FeaturedProductRepos());
final homeLatestProductRepos =
    Provider<HomeLatestProductRepos>((ref) => HomeLatestProductRepos());
final hotDealProductRepos =
    Provider<HotDealProductRepos>((ref) => HotDealProductRepos());
final onlinePayRepos = Provider<OnlinePayRepos>((ref) => OnlinePayRepos());
final orderHistoryRepos =
    Provider<OrderHistoryRepos>((ref) => OrderHistoryRepos());
final orderTrackRepos = Provider<OrderTrackRespos>((ref) => OrderTrackRespos());
final searchRepos = Provider<SearchRepos>((ref) => SearchRepos());
final settingsRepos = Provider<SettingsRepos>((ref) => SettingsRepos());
final shippingAddressRepos =
    Provider<ShippingAddressRespos>((ref) => ShippingAddressRespos());
final singleProductRepos =
    Provider<SingleProductRepos>((ref) => SingleProductRepos());
final sliderModelRepos =
    Provider<SliderModelRepos>((ref) => SliderModelRepos());
final sslCredRepos = Provider<SSLCredRepos>((ref) => SSLCredRepos());
final wishlistModelRepos =
    Provider<WishlistModelRepos>((ref) => WishlistModelRepos());
// repos end

final rootPageProvider =
    ChangeNotifierProvider<RootScreenProvider>((ref) => RootScreenProvider());

final detailsPageProvider =
    ChangeNotifierProvider<ProductDetailsProvider>((ref) {
  final singleProdRepos = ref.read(singleProductRepos);
  return ProductDetailsProvider(singleProductRepos: singleProdRepos);
});
final categoryPageProvider =
    ChangeNotifierProvider<CategoryScreenProvider>((ref) {
  final catScrRepos = ref.read(categoryScreenRepos);
  return CategoryScreenProvider(catscrRepos: catScrRepos);
});

final profilePageProvider = ChangeNotifierProvider<ProfileScreenProvider>(
    (ref) => ProfileScreenProvider());

final productOverviewPageProvider =
    ChangeNotifierProvider<ProductOverviewProvider>((ref) {
  final hLatestProductRepos = ref.read(homeLatestProductRepos);
  final sModelRepos = ref.read(sliderModelRepos);
  final fProductRepos = ref.read(featuredProductRepos);
  final hDealProductRepos = ref.read(hotDealProductRepos);
  final bSellProductRepos = ref.read(bestSellRepos);

  return ProductOverviewProvider(
      homeLatestProductRepos: hLatestProductRepos,
      sliderModelRepos: sModelRepos,
      featuredProductRepos: fProductRepos,
      hotDealProductRepos: hDealProductRepos,
      bestSellProductRepos: bSellProductRepos);
});

final cartPageProvider = ChangeNotifierProvider<CartScreenProvider>((ref) {
  final cModelRepos = ref.read(cartModelRepos);
  return CartScreenProvider(cartModelRepos: cModelRepos);
});

final wishlistPageProvider =
    ChangeNotifierProvider<WishlistScreenProvider>((ref) {
  final wlistModelRepos = ref.read(wishlistModelRepos);
  return WishlistScreenProvider(wishlistModelRepos: wlistModelRepos);
});

final bandPageProvider = ChangeNotifierProvider<BrandScreenProvider>((ref) {
  final brandscrRepos = ref.read(brandScreenRepos);
  return BrandScreenProvider(bandscrRepos: brandscrRepos);
});

final checkoutPageProvider =
    ChangeNotifierProvider<CheckoutScreenProvider>((ref) {
  final checkout_repos = ref.read(checkOutPageRepos);
  final shipping_add_repos = ref.read(shippingAddressRepos);
  final customer_details_repo = ref.read(customerDetailsRepos);
  final cRepos = ref.read(codRepos);
  final oPayRepos = ref.read(onlinePayRepos);
  final sCredRepos = ref.read(sslCredRepos);

  return CheckoutScreenProvider(
      checkout_repos: checkout_repos,
      shipping_add_repos: shipping_add_repos,
      customer_details_repo: customer_details_repo,
      codRepos: cRepos,
      onlinePayRepos: oPayRepos,
      sslCredRepos: sCredRepos);
});

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  final aRepos = ref.read(authRepos);
  return AuthProvider(authRepos: aRepos);
});

final catWiseProvider = ChangeNotifierProvider<CatWiseProvider>((ref) {
  final cWiseRepos = ref.read(catWiseRepos);
  final sModelRepos = ref.read(sliderModelRepos);
  return CatWiseProvider(
      catWiseRepos: cWiseRepos, sliderModelRepos: sModelRepos);
});

final settingsProvider = ChangeNotifierProvider<SettingsProvider>((ref) {
  final sRepos = ref.read(settingsRepos);
  return SettingsProvider(settingsRepos: sRepos);
});

final orderHistoryProvider =
    ChangeNotifierProvider<OrderHistoryProvider>((ref) {
  final oHistoryRepos = ref.read(orderHistoryRepos);
  return OrderHistoryProvider(orderHistoryRepos: oHistoryRepos);
});

final orderTrackProvider = ChangeNotifierProvider<OrderTrackProvider>((ref) {
  final oTrackRepos = ref.read(orderTrackRepos);
  return OrderTrackProvider(orderTrackRepos: oTrackRepos);
});

final searchProvider = ChangeNotifierProvider<SearchProvider>((ref) {
  final sRepos = ref.read(searchRepos);
  return SearchProvider(searchRepos: sRepos);
});
