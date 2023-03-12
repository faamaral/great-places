import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String googleApiKey = '${dotenv.env['API_KEY']}';

class LocationUtil {
  static String GenerateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=${latitude},${longitude}&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C${latitude},$longitude&key=$googleApiKey';
  }
}
