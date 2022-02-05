import 'package:agence/commons/assets_app.dart';
import 'package:agence/commons/routes_app.dart';
import 'package:agence/modules/common/components/custom_drawer.dart';
import 'package:agence/modules/home/complements/tile_product.dart';
import 'package:agence/modules/home/domain/entities/product_entity.dart';
import 'package:agence/resources/get_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder<bool>(
          future:
              Future.delayed(const Duration(seconds: 2)).then((value) => true),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    ...List.generate(18, (index) {
                      final product = ProductEntitiy(
                          'Product1', 'Texto de descrição', AssetsApp.product);
                      return InkWell(
                        onTap: () async {
                          final position = await determinePosition();
                          if (position != null) {
                            Modular.to.pushNamed(RoutesApp.product, arguments: {
                              'position': position,
                              'product': product
                            });
                          }
                        },
                        child: TileProduct(
                          productEntity: product,
                        ),
                      );
                    }).toList()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
