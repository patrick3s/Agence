import 'package:agence/commons/theme/theme_manager.dart';
import 'package:agence/modules/home/domain/entities/product_entity.dart';

import 'package:flutter/material.dart';

class TileProduct extends StatelessWidget {
  final ProductEntitiy productEntity;
  const TileProduct({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = theme.themeMode == ThemeMode.dark;
    return ClipRRect(
      child: SizedBox(
        child: Column(
          children: [
            Image.asset(
              productEntity.image,
              height: size.width * .3,
              width: size.width * .3,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset.zero,
                        blurRadius: 10,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.solid,
                        color: isDark == true ? Colors.white10 : Colors.black12)
                  ]),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: isDark == true ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(productEntity.name),
                    Text(productEntity.description)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
