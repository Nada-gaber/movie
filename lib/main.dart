import 'package:flutter/material.dart';
import 'package:movie/presentation/widgets/app_route.dart';

void main() {
  runApp(BreakingBad(
    appRouter: AppRouter(),
  ));
}

class BreakingBad extends StatelessWidget {
  final AppRouter appRouter;

  const BreakingBad({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking Bad',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
