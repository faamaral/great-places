import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<GreatPlaces>(
              child: const Center(
                child: Text(
                  'Nenhum Local Cadastrado!',
                ),
              ),
              builder: (context, greatePlaces, child) {
                if (greatePlaces.itemsCount == 0) {
                  return child!;
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(greatePlaces.itemByIndex(index).image),
                        ),
                        title: Text(greatePlaces.itemByIndex(index).title),
                        subtitle: Text(
                            greatePlaces.itemByIndex(index).location.address),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.PLACE_DETAIL,
                            arguments: greatePlaces.itemByIndex(index)
                          );
                        },
                      );
                    },
                    itemCount: greatePlaces.itemsCount,
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
