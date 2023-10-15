import 'package:craftybay_ecommerce_application/presentation/ui/utility/assets_path.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreenAppbarTitle extends StatefulWidget {
  const HomeScreenAppbarTitle({super.key});

  @override
  State<HomeScreenAppbarTitle> createState() => _HomeScreenAppbarTitleState();
}

class _HomeScreenAppbarTitleState extends State<HomeScreenAppbarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AssetsPath.craftyBayNavLogoSVG,
        ),
        const Spacer(),
        CircularIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: Icons.notifications_none,
          onTap: () {},
        ),
        CircularIconButton(
          icon: Get.isDarkMode ? Icons.sunny : Icons.nightlight,
          onTap: () {
            if (Get.isDarkMode) {
              Get.changeThemeMode(ThemeMode.light);
            } else {
              Get.changeThemeMode(ThemeMode.dark);
            }
            setState(() {});
          },
        ),
      ],
    );
  }
}
