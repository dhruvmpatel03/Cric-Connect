import 'package:flutter/material.dart';

// Small logo + app name, for the top header
class AppBarBrand extends StatelessWidget {
  const AppBarBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/logo_icon.png',
            width: 34,
            height: 34,
            semanticLabel: 'Cric-Connect logo',
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'CRIC-CONNECT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

// Large full logo, for the login and sign-up pages
class BrandLogo extends StatelessWidget {
  final double size;
  const BrandLogo({super.key, this.size = 140});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.18),
      child: Image.asset(
        'assets/images/logo_full.png',
        width: size,
        height: size,
        semanticLabel: 'Cric-Connect logo',
      ),
    );
  }
}