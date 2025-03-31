import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo123',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PayPal'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var request = BraintreeDropInRequest(
              tokenizationKey: 'sandbox_vt4mcjnq_ycrxjhcqczfxfpbj',
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: '10.00',
                displayName: 'leodone',
              ),
              cardEnabled: true,
            );
            BraintreeDropInResult? result = await BraintreeDropIn.start(
              request,
            );
            if (result != null) {
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);
            }
          },
          child: Text('Pay'),
        ),
      ),
    );
  }
}
