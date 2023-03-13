import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_detail_screen.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_colors.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // To load the .env file contents into dotenv.
  // NOTE: fileName defaults to .env and can be omitted in this case.
  // Ensure that the filename corresponds to the path in step 1 and 2.
  // await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
          )
              .copyWith(primary: AppColors.primary, secondary: AppColors.secondary),
        ),
        home: const PlacesListScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.PLACE_FORM:(context) => const PlaceFormScreen(),
          AppRoutes.PLACE_DETAIL:(context) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
