import 'package:api_rest/features/app/domain/response/response_generic.dart';
import 'package:api_rest/features/app/presentation/screen/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async {
          await context.read<HomeProvider>().findAllHero();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (provider.responseResult.responseStatus == ResponseStatus.error)
            Text(provider.responseResult.message),
          if (provider.responseResult.responseStatus == ResponseStatus.loading)
            const Center(child: CircularProgressIndicator())
          else
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                final heroEntity = provider.heroList[index];
                return ListTile(
                  title: Text(heroEntity.name),
                  subtitle: Text(heroEntity.appearance.race),
                  leading: Image.network(
                    heroEntity.images.lg,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: provider.heroList.length,
            ))
        ],
      ),
    );
  }
}
