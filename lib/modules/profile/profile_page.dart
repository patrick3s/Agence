import 'package:agence/commons/preferences.dart';
import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/common/components/custom_drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const Center(
            child: Icon(
              Icons.person,
              size: 300,
            ),
          ),
          FutureBuilder<UserEntity?>(
              future: StorageHelper.fecthUser(),
              builder: (ctx, snap) {
                if (!snap.hasData) return Container();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Provedor de autenticação: ${snap.data?.provider}"),
                    Text("Logado desde: ${snap.data?.lastLogged}")
                  ],
                );
              })
        ],
      ),
    );
  }
}
