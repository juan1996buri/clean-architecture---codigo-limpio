import 'package:api_rest/features/app/data/datasources/hero_repository_impl.dart';
import 'package:api_rest/features/app/presentation/screen/home/home_provider.dart';
import 'package:api_rest/features/app/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HeroRepositoryImpl(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            context.read<HeroRepositoryImpl>(),
          )..findAllHero(),
        )
      ],
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}
