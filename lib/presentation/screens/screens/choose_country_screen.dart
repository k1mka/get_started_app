import 'package:flutter/material.dart';
import 'package:get_started_app/get_it.dart';
import 'package:get_started_app/presentation/data/services/network_service.dart';
import 'package:get_started_app/presentation/models/country_model.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryModel>>(
      future: getIt<NetworkService>().fetchCountry(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Text(snapshot.data![i].flag),
              title: Text(
                snapshot.data![i].phoneCode,
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                snapshot.data![i].region,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        );
      },
    );
  }
}
