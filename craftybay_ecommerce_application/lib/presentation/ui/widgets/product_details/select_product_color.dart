import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class SelectProductColor extends StatefulWidget {
  const SelectProductColor({super.key});

  @override
  State<SelectProductColor> createState() => _SelectProductColorState();
}

class _SelectProductColorState extends State<SelectProductColor> {
  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];

  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Color'),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  _selectedColorIndex = index;
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: colors[index],
                  child: _selectedColorIndex == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        ),
      ],
    );
  }
}
