import 'package:bajarbd/model/models/online_pay_model.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';

import '../model/models/cod_model.dart';
import '../model/models/shipping_address_model.dart';
import '../model/models/shipping_charge_model.dart';
import 'order_success_page.dart';
import '../utils/Colors/appcolors.dart';
import '../utils/db/user_credential.dart';
import '../widgets/checkout/ship_address_form.dart';
import '../widgets/loader_widget.dart';
import '../model/models/cart_model.dart';
import '../provider/providers.dart';
import '../utils/Appvars/appvars.dart';
import '../utils/ssl/ssl_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> carts;
  final double totalCost;
  final WidgetRef rootref;

  const CheckoutPage({
    super.key,
    required this.carts,
    required this.totalCost,
    required this.rootref,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double discount = 0.0, shipping = 0.0;
  ShippingAddressModel? sModel;
  String? chargeName;
  void _handleRadioValueChange(
      String? value, WidgetRef rf, ShippingChargeModel? shippingChargeModel) {
    rf.watch(checkoutPageProvider).setCurrentShipping(value);
    chargeName = rf.read(checkoutPageProvider).selectedShippingCharge;
    rf.read(checkoutPageProvider).setShipping(shippingChargeModel);

    shipping =
        double.tryParse(rf.read(checkoutPageProvider).shipCharge!.amount) ??
            0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Complete Your Purchase!",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            widget.carts.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: Appvars.screenSize.height * 0.05,
                                    child: Image.network(
                                      widget.carts[index].imageLink,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: Appvars.screenSize.width * 0.5,
                                        child: Text(
                                          widget.carts[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3),
                                        child: Text(
                                            "(${widget.carts[index].price} X ${widget.carts[index].amount})"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            widget.carts.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.carts[index].total} Tk',
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                    Consumer(
                      builder: (ctx, refPrice, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'Sub Total:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'Shipping Charge:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'Discount Charge:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'Total:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  '${widget.totalCost.toString()} Tk',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  '${refPrice.watch(checkoutPageProvider).shipCharge?.amount.toString() ?? "0.0"} Tk',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  '${discount.toString()} Tk',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  '${(widget.totalCost + discount + shipping).toString()} Tk',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Handle discount code
                },
                child: const Text(
                  'Have a discount code? Click to enter it.',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              Consumer(builder: (context, refBill, ch) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Billing Info',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder(
                            future: refBill
                                .read(checkoutPageProvider)
                                .getCustomerInfo(),
                            builder: (context, snapBill) {
                              if (snapBill.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: LoaderWidget(),
                                );
                              }
                              if (!snapBill.hasData) {
                                return Text("No Billing info available");
                              }
                              return Container(
                                child: Column(
                                  children: [
                                    Text(
                                      snapBill.data!.firstName +
                                          " " +
                                          snapBill.data!.lastName,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    if (snapBill.data!.phone != null)
                                      Text(
                                        snapBill.data!.phone!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      )
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              Consumer(builder: (ctx, refAddressRead, ch) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!refAddressRead.read(checkoutPageProvider).isEdit)
                      FutureBuilder(
                          future: refAddressRead
                              .read(checkoutPageProvider)
                              .getShippingAddress(UserCredential.userId!),
                          builder: (ctx, snapGetAddreees) {
                            if (snapGetAddreees.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox.shrink();
                            }
                            if (!snapGetAddreees.hasData) {
                              refAddressRead
                                  .read(checkoutPageProvider)
                                  .setEdit(true);

                              return ShippingAddressForm(
                                  refCheck: refAddressRead);
                            }

                            sModel = snapGetAddreees.data!;
                            return Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(child: SizedBox()),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Shipping Info',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                              onPressed: () {
                                                refAddressRead
                                                    .watch(checkoutPageProvider)
                                                    .setEdit(true);
                                              },
                                              icon: Icon(Icons.edit)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${snapGetAddreees.data!.addressLineOne}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${snapGetAddreees.data!.postOffice},${snapGetAddreees.data!.thana}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      "${snapGetAddreees.data!.district}-${snapGetAddreees.data!.postalCode}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    if (refAddressRead.read(checkoutPageProvider).isEdit)
                      ShippingAddressForm(
                        refCheck: refAddressRead,
                        houseFlat: sModel?.addressLineOne,
                        postOFFICE: sModel?.postOffice,
                        thanaName: sModel?.thana,
                        postalCodeName: sModel?.postalCode,
                        districtName: sModel?.district,
                      )
                  ],
                );
              }),
              SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (ctxCharge, refCharge, _) => Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          "Shipping Charge",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      FutureBuilder(
                          future: refCharge
                              .read(checkoutPageProvider)
                              .getShippingData(),
                          builder: (ctx, snapShip) => (!snapShip.hasData)
                              ? const SizedBox.shrink()
                              : Row(
                                  children: List.generate(
                                    snapShip.data!.length,
                                    (index) => Expanded(
                                      child: RadioListTile<String>(
                                          title: FittedBox(
                                            child: Text(
                                              snapShip.data![index]
                                                  .shippingChargeName,
                                              maxLines: 1,
                                            ),
                                          ),
                                          value: snapShip
                                              .data![index].shippingChargeName,
                                          groupValue: chargeName,
                                          onChanged: (val) {
                                            _handleRadioValueChange(
                                                val,
                                                refCharge,
                                                snapShip.data![index]);
                                          }),
                                    ),
                                  ),
                                )

                          /*  [
                                  Expanded(
                                    child: RadioListTile<String>(
                                        title:  Text(snapShip.data![index]
                                                  .shippingChargeName),
                                        value: 'email',
                                        groupValue: contactMethod,
                                        onChanged: _handleRadioValueChange),
                                  ),
                                  Expanded(
                                    child: RadioListTile<String>(
                                        title: const Text('Phone'),
                                        value: 'phone',
                                        groupValue: contactMethod,
                                        onChanged: _handleRadioValueChange),
                                  ),
                                ], */
                          ),

                      /*  DropdownButtonHideUnderline(
                        child: Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: Appvars.customInputboxDecoration,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: FutureBuilder(
                              future: refCharge
                                  .read(checkoutPageProvider)
                                  .getShippingData(),
                              builder: (ctx, shipSnap) => (!shipSnap.hasData)
                                  ? const SizedBox.shrink()
                                  : DropdownButton(
                                      dropdownColor: Colors.white,
                                      padding: const EdgeInsets.all(0),
                                      hint: const Text(
                                        "Choose Shipping",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                      value: refCharge
                                          .read(checkoutPageProvider)
                                          .shipCharge
                                          ?.shippingChargeName,
                                      items: List.generate(
                                          shipSnap.data!.length,
                                          (index) => DropdownMenuItem(
                                              value: shipSnap.data![index]
                                                  .shippingChargeName,
                                              child: Text(
                                                shipSnap.data![index]
                                                    .shippingChargeName
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ))),
                                      onChanged: (val) {
                                        if (val == null) {
                                          return;
                                        }
                                        final mod = shipSnap.data!.firstWhere(
                                            (itm) =>
                                                itm.shippingChargeName == val);
                                        refCharge
                                            .watch(checkoutPageProvider)
                                            .setShipping(mod);

                                        shipping = double.tryParse(refCharge
                                                .read(checkoutPageProvider)
                                                .shipCharge!
                                                .amount) ??
                                            0.0;
                                      }),
                            ),
                          ),
                        ),
                      ), */
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Consumer(builder: (context, refPay, ch) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          var sslCred = SslCredential.instance;
                          var customTransId = sslCred.getTransId();

                          var sslCommerz = Sslcommerz(
                            initializer: SSLCommerzInitialization(
                              store_id: sslCred.storeId,
                              store_passwd: sslCred.storePass,
                              total_amount:
                                  widget.totalCost + discount + shipping,
                              currency: SSLCurrencyType.BDT,
                              tran_id: customTransId,
                              product_category: "",
                              sdkType: SSLCSdkType.TESTBOX,
                            ),
                          );

                          try {
                            if (chargeName == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Please select your shipping charge!")));
                              refPay
                                  .watch(checkoutPageProvider)
                                  .setCurrentShipping(null);
                              return null;
                            }
                            if (refPay.read(checkoutPageProvider).isEdit) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Please fill up shipping address!")));
                              refPay.watch(checkoutPageProvider).setRebuild();
                              return null;
                            }
                            if (chargeName == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Please select your shipping charge!")));
                              refPay
                                  .watch(checkoutPageProvider)
                                  .setCurrentShipping(null);
                              return null;
                            }
                            final payAmount =
                                widget.totalCost + discount + shipping;
                            List<CartOnline> carts = List.generate(
                                widget.carts.length,
                                (index) => CartOnline(
                                    name: widget.carts[index].title,
                                    qty: widget.carts[index].amount,
                                    price: widget.carts[index].price,
                                    subtotal: widget.carts[index].total,
                                    image: widget.carts[index].imageLink
                                        .split('/')
                                        .last));
                            OnlinePayModel cModel = OnlinePayModel(
                                shipping_charge: shipping.toString(),
                                userId: UserCredential.userId!,
                                payableAmount: payAmount,
                                carts: carts,
                                transaction_id: customTransId);
                            print("custom transaction id $customTransId");
                            final res = await refPay
                                .read(checkoutPageProvider)
                                .postOnlinePayOrder(cModel);

                            print("Result online: $res");
                            var result = await sslCommerz.payNow();

                            if (result is PlatformException) {
                              /* print(
                                  "apiConnect: ${result.aPIConnect},'amount' ${result.amount},'bankTransId': ${result.bankTranId},baseFair: ${result.baseFair},cardBrand ${result.cardBrand} cardIssuer ${result.cardIssuer} cardIssuerCountry ${result.cardIssuerCountry} cardIssueCC ${result.cardIssuerCountryCode} 'cardno' ${result.cardNo} 'cardType' ${result.cardType} 'currencyAmount': ${result.currencyAmount} currency rate : ${result.currencyRate} curr type: ${result.currencyType} 'session key': ${result.sessionkey} status: ${result.status} storeAmount: ${result.storeAmount} trans date: ${result.tranDate} trans id:  ${result.tranId} val id: ${result.valId} val on ${result.validatedOn}"); */
                              print("Platform Error: ${result.status}");
                              print("resultJson:${result.toJson()}");
                            } else {
                              if (result.status == "VALID") {
                                print("valid custom ${customTransId}");
                                final resSuccess = await refPay
                                    .read(checkoutPageProvider)
                                    .onlinePaySuccess(
                                        customTransId,
                                        result.bankTranId!,
                                        result.cardBrand ?? "not defined");
                                for (int i = 0; i < widget.carts.length; i++) {
                                  await refPay
                                      .read(cartPageProvider)
                                      .deleteCart(widget.carts[i].id);
                                }
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => OrderSuccess(
                                            ref: widget.rootref,
                                            successMessage:
                                                "Online payment successful!")));
                              } else {
                                if (result.status == "FAILED") {
                                  await refPay
                                      .read(checkoutPageProvider)
                                      .onlinePayFail(customTransId);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Online Payment Failed!")));
                                  refPay
                                      .watch(checkoutPageProvider)
                                      .setRebuild();
                                } else {
                                  await refPay
                                      .read(checkoutPageProvider)
                                      .onlinePayFail(customTransId);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Online Payment Canceled!")));
                                  refPay
                                      .watch(checkoutPageProvider)
                                      .setRebuild();
                                }
                              }
                              print("Payment Result: $result");
                            }
                          } catch (e) {
                            print("SSLError: $e");
                          }
                          // Handle credit card payment
                        },
                        icon: const Icon(Icons.credit_card),
                        label: Text(
                          'Online Payment',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.appThemeColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (chargeName == null) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Please select your shipping charge!")));
                            refPay
                                .watch(checkoutPageProvider)
                                .setCurrentShipping(null);
                            return null;
                          }
                          if (refPay.read(checkoutPageProvider).isEdit) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Please fill up shipping address!")));
                            refPay.watch(checkoutPageProvider).setRebuild();
                            return null;
                          }
                          final payAmount =
                              widget.totalCost + discount + shipping;

                          List<Cart> carts = List.generate(
                                  widget.carts.length,
                                  (index) => Cart(
                                      name: widget.carts[index].title,
                                      qty: widget.carts[index].amount,
                                      price: widget.carts[index].price,
                                      subtotal: widget.carts[index].total,
                                      image: widget.carts[index].imageLink
                                          .split('/')
                                          .last)) /* CartModel(
                                  id: widget.carts[index].id,
                                  title: widget.carts[index].title,
                                  price: widget.carts[index].price,
                                  amount: widget.carts[index].amount,
                                  total: widget.carts[index].total,
                                  imageLink: widget.carts[index].imageLink)) */
                              ;

                          CodModel cModel = CodModel(
                              shipping_charge: shipping.toString(),
                              userId: UserCredential.userId!,
                              paymentMethod: "COD",
                              payableAmount: payAmount,
                              carts: carts);
                          final res = await refPay
                              .read(checkoutPageProvider)
                              .postOrder(cModel);

                          /*    await ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(res))); */
                          if (res['isSuccess'] == true) {
                            for (int i = 0; i < widget.carts.length; i++) {
                              await refPay
                                  .read(cartPageProvider)
                                  .deleteCart(widget.carts[i].id);
                            }
                            // refPay.watch(checkoutPageProvider).setRebuild();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => OrderSuccess(
                                        ref: widget.rootref,
                                        successMessage: res['message'])));
                          } else {
                            await ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(res['message'])));
                            refPay.watch(checkoutPageProvider).setRebuild();
                          }
                          // Handle PayPal payment
                        },
                        icon: const Icon(Icons.account_balance_wallet),
                        label: Text(
                          'Cash on Delivary',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.appThemeSecondaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
