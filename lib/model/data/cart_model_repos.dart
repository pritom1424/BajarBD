import '../../utils/db/db_helper.dart';
import '../models/cart_model.dart';

class CartModelRepos {
  Future<bool> addCart(CartModel cart) async {
    try {
      Map<String, dynamic> data = {
        'id': cart.id,
        'title': cart.title.toString(),
        'price': cart.price.toString(),
        'amount': cart.amount.toString(),
        'total': cart.total.toString(),
        'imageLink': cart.imageLink,
      };
      await DatabaseHelper().insert(DatabaseHelper.carttableName, data);
      return true;
    } catch (e) {
      print("local database error: $e");
      return false;
    }
  }

  Future<bool> deleteCart(int id) async {
    try {
      //await DatabaseHelper().deletePost(id);
      await DatabaseHelper().deleteData(DatabaseHelper.carttableName, id);
      return true;
    } catch (e) {
      print("local database error: $e");
      return false;
    }
  }

  Future<List<CartModel>> getCarts() async {
    try {
      //return await DatabaseHelper().getPosts();
      var res = await DatabaseHelper().getData(DatabaseHelper.carttableName);
      List<CartModel>? tempList;
      if (res.isEmpty) return [];

      tempList = res
          .map((postMap) => CartModel(
                id: postMap['id'] as int,
                title: postMap['title'].toString(),
                price: double.parse(postMap['price'].toString()),
                amount: int.parse(postMap['amount'].toString()),
                total: double.parse(postMap['total'].toString()),
                imageLink: postMap['imageLink'].toString(),
              ))
          .toList();
      return tempList;
    } catch (e) {
      return [];
    }
  }

  Future<bool> updateCart(int id, String amount, String totalAmount) async {
    try {
      final data = {'amount': amount, 'total': totalAmount};
      await DatabaseHelper()
          .updateTable(DatabaseHelper.carttableName, data, id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
