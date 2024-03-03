import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/business_logic/cubit/characters_cubit.dart';
import 'package:movie/constants/strings.dart';
import 'package:movie/data/repository/character_repo.dart';
import 'package:movie/data/web_services/character_webservise.dart';
import 'package:movie/presentation/screens/character_details.dart';
import 'package:movie/presentation/screens/characterscreen.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepo = CharacterRepo(characterWebService: CharacterWebService());
    charactersCubit = CharactersCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(characterRepo),
                  child: const CharacterScreen(),
                ));

      case characterDetail:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());
    }
  }
}
