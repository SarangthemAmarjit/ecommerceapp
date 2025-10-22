import 'package:ecommerceapp/pages/login/controller/networkcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ServerErrorPage extends StatelessWidget {
  const ServerErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    final NetworkController netcon = Get.put(NetworkController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off, color: Colors.redAccent, size: 80),
              const SizedBox(height: 24),
              const Text(
                'Oops! Something went wrong.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'We are unable to connect to the server right now. Please try again later.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
      
              OutlinedButton(
                onPressed: () {
                  netcon.setServerStatus(false);
                  // admin.getalldatas();
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text(
                  "Retry",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
