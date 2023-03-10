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
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text(
            'Nenhum Local Cadastrado!',
          ),
        ),
        builder: (context, greatePlaces, child) => greatePlaces.itemsCount == 0
            ? child!
            : ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(greatePlaces.itemByIndex(index).image),
                  ),
                  title: Text(greatePlaces.itemByIndex(index).title),
                  onTap: () {},
                ),
                itemCount: greatePlaces.itemsCount,
              ),
      ),
    );
  }
}
