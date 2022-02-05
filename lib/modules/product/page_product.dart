import 'package:agence/commons/assets_app.dart';
import 'package:agence/commons/theme/theme_manager.dart';
import 'package:agence/modules/home/domain/entities/product_entity.dart';
import 'package:agence/modules/product/components/finish_buy_modal.dart';
import 'package:agence/modules/product/components/map_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PageProduct extends StatefulWidget {
  final Position position;
  final ProductEntitiy product;
  const PageProduct({Key? key, required this.position, required this.product})
      : super(key: key);

  @override
  _PageProductState createState() => _PageProductState();
}

class _PageProductState extends State<PageProduct> {
  @override
  Widget build(BuildContext context) {
    final isDark = theme.themeMode == ThemeMode.dark;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: MapView(
                    height: size.height / 3,
                    position: widget.position,
                    width: size.width),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: isDark ? Colors.white : Colors.black)),
              child: Row(
                children: [
                  Image.asset(
                    AssetsApp.product,
                    height: size.width * .2,
                    width: size.width * .2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.product.description),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton(
                onPressed: () async {
                  final value = await finishBuyModal(context);
                  if (value == true) {
                    Navigator.of(context).pop(value);
                  }
                },
                child: const Text("Realizar compra"))
          ],
        ),
      ),
    );
  }
}
