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
  const CheckoutPage({super.key, required this.carts, required this.totalCost});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();
  final fulladdressController = TextEditingController();
  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    fulladdressController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double discount = 0.0, shipping = 0.0;

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
                    Column(
                        children: List.generate(
                      widget.carts.length,
                      (ind) => ListTile(
                        title: Text(
                          widget.carts[ind].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                            "(${widget.carts[ind].price} X ${widget.carts[ind].amount})"),
                        trailing: Text(
                          '${widget.carts[ind].total} Tk',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    )),
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
              const Text('Payment Method', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        var sslCred = SslCredential.instance;

                        var sslCommerz = Sslcommerz(
                          initializer: SSLCommerzInitialization(
                            ipn_url: sslCred.ipn,
                            store_id: sslCred.storeId,
                            store_passwd: sslCred.storePass,
                            total_amount: sslCred.totalAmount,
                            currency: sslCred.currency,
                            tran_id: sslCred.transactionId,
                            product_category: sslCred.productCategory,
                            sdkType: SSLCSdkType.TESTBOX,
                          ),
                        );

                        try {
                          var result = await sslCommerz.payNow();
                          if (result is PlatformException) {
                            print("Platform Error: ${result.status}");
                          } else {
                            print("Payment Result: $result");
                          }
                        } catch (e) {
                          print("Error: $e");
                        }
                        // Handle credit card payment
                      },
                      icon: const Icon(Icons.credit_card),
                      label: const Text('Online Payment'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle PayPal payment
                      },
                      icon: const Icon(Icons.account_balance_wallet),
                      label: const Text('Cash on Delivary'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Personal Info', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              TextField(
                controller: fullNameController,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
                //autofocus: false,
                enabled: true,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  hintText: 'Full Name',
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: mobileController,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
                //autofocus: false,
                keyboardType: TextInputType.phone,
                enabled: true,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              Consumer(
                builder: (ctxCharge, refCharge, _) => Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Shipping Charge",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DropdownButtonHideUnderline(
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
                      ),
                    ],
                  ),
                ),
              ),
              TextField(
                controller: fulladdressController,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
                //autofocus: false,
                maxLines: 1,
                enabled: true,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                  hintText: 'Full Address',
                  labelText: 'Full Address',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
