import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/utils/db_util.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (e) => Place(
            id: e['id'],
            title: e['title'],
            location: PlaceLocation(latitude: -11111, longitude: -1111111),
            image: File(e['image']),
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Place> get items => [..._items];

  int get itemsCount => _items.length;

  Place itemByIndex(int index) => _items[index];

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(latitude: -111111, longitude: -111111),
    );
    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
    notifyListeners();
  }
}
