import 'package:craftybay_ecommerce_application/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CtaftyBayLogo extends StatelessWidget {
  const CtaftyBayLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.craftyBayLogoSVG,
      width: 100,
    );
  }
}
