import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class ProductNameWithStepper extends StatelessWidget {
  const ProductNameWithStepper({
    super.key, required this.productName,
  });
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
              productName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5),
            )),
        CustomStepper(
            lowerLimit: 1,
            upperLimit: 10,
            stepValue: 1,
            value: 1,
            onChange: (newValue) {
              print(newValue);
            })
      ],
    );
  }
}