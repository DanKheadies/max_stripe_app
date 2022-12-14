import 'package:flutter/material.dart';

import 'package:max_stripe_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardFormScreen(),
                ),
              );
            },
            title: const Text('Go to the Card Form'),
            trailing: const Icon(
              Icons.chevron_right_rounded,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PanScreen(),
                ),
              );
            },
            title: const Text('Go to Pan Playground'),
            trailing: const Icon(
              Icons.fingerprint,
            ),
          ),
        ],
      ),
    );
  }
}
