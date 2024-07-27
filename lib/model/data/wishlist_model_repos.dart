import '../models/single_product_model.dart';
import '../../utils/db/db_helper.dart';
import '../../widgets/products/product_tile.dart';

class WishlistModelRepos {
  Future<bool> addWishlist(SingleProduct prod, String imageLink) async {
    try {
      Map<String, dynamic> data = {
        'id': prod.id,
        'title': prod.title.toString(),
        'unit_price': prod.unitPrice.toString(),
        'discount_price': prod.discountPrice.toString(),
        'discount': prod.discount.toString(),
        'isShowBadge':
            (prod.discount == null || prod.discountPrice == null) ? 0 : 1,
        'imageLink': imageLink
      };
      int test =
          await DatabaseHelper().insert(DatabaseHelper.wishlisttablename, data);

      return true;
    } catch (e) {
      print("local database error: $e");
      return false;
    }
  }

  Future<bool> deleteFromWishlist(int id) async {
    try {
      //await DatabaseHelper().deletePost(id);
      await DatabaseHelper().deleteData(DatabaseHelper.wishlisttablename, id);
      return true;
    } catch (e) {
      print("local database error: $e");
      return false;
    }
  }

  Future<List<ProductItem>> getWishList() async {
    try {
      //return await DatabaseHelper().getPosts();
      var res =
          await DatabaseHelper().getData(DatabaseHelper.wishlisttablename);

      List<ProductItem>? tempList;
      if (res.isEmpty) return [];

      tempList = res
          .map((postMap) => ProductItem(
                id: postMap['id'] as int,
                title: postMap['title'].toString(),
                discount: postMap['discount'].toString(),
                discountPrice: postMap['discount_price'].toString(),
                unitPrice: postMap['unit_price'].toString(),
                link: postMap['imageLink'].toString(),
                isShowBadge: (int.parse(postMap['isShowBadge'].toString()) == 0)
                    ? false
                    : true,
              ))
          .toList();

      return tempList;
    } catch (e) {
      return [];
    }
  }
}
