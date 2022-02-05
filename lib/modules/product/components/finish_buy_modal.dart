import 'package:agence/commons/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<T?> finishBuyModal<T>(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (ctx) {
        return const _Content();
      });
}

class _Content extends StatefulWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  __ContentState createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Atenção',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const Text('Você realmente deseja compra esse item ?',
                    style: TextStyle(color: Colors.black)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.brown),
                              onPressed: () {
                                Modular.to.popUntil(
                                    (ModalRoute.withName(RoutesApp.home)));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 3),
                                        content: Text(
                                          'Obrigado por realizar sua compra conosco.',
                                          style: TextStyle(color: Colors.white),
                                        )));
                              },
                              child: const Text('Sim'))),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.brown),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar')))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
