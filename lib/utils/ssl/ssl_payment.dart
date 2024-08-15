import 'package:uuid/uuid.dart';

Uuid _uuid = Uuid();

class SslCredential {
  /*  final String _storeId;
  final String _storePass;

  SslCredential._internal(this._storeId, this._storePass);

  static final SslCredential _instance =
      SslCredential._internal("parth6677b37b24f74", "parth6677b37b24f74@ssl");

/*parth6677b37b24f74  parth6677b37b24f74@ssl 10.0 BDT adasdsasd cloth*/

// Getter to access the single instance of the class
  static SslCredential get instance => _instance;

  String get storeId => _storeId;
  String get storePass => _storePass; */

  String getTransId() {
    String id = _uuid.v4().substring(0, 22);
    return id.split('-').join();
  }
}
