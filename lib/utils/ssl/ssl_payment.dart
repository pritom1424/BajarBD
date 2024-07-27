class SslCredential{
  final String _storeId;
  final String _storePass;
  final double _totalAmount;
  final String _ipn;
  final String _currency;
  final String _transactionId;
  final String _productCategory ;

  SslCredential._internal(this._storeId, this._storePass, this._totalAmount, this._ipn, this._currency, this._transactionId, this._productCategory);

  static final SslCredential _instance = SslCredential._internal("parth6677b37b24f74", "parth6677b37b24f74@ssl", 10.0, "", "BDT", "adasdsasd", "cloth"); 

/*parth6677b37b24f74  parth6677b37b24f74@ssl 10.0 BDT adasdsasd cloth*/

// Getter to access the single instance of the class
  static SslCredential get instance => _instance;

  String get storeId => _storeId;
  String get storePass => _storePass;
  double get totalAmount => _totalAmount;
  String get ipn => _ipn;
  String get currency => _currency;
  String get transactionId=>_transactionId;
  String get productCategory=>_productCategory;

}