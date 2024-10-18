import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // const Color.fromARGB(176, 148, 206, 242),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Lottie.asset('assets/lotties/welcome.json',
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.topCenter),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
