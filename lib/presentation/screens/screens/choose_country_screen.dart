import 'package:flutter/material.dart';
import 'package:get_started_app/get_it.dart';
import 'package:get_started_app/presentation/data/services/network_service.dart';
import 'package:get_started_app/presentation/models/country_model.dart';
import 'package:get_started_app/presentation/widgets/choose_text_widget.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  late final Future<List<CountryModel>> fullCountryList = getIt<NetworkService>().fetchCountry();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryModel>>(
      future: fullCountryList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        return CountyList(countries: snapshot.data!);
      },
    );
  }

  void fetchCountryList() async {}
}

class CountyList extends StatefulWidget {
  const CountyList({
    Key? key,
    required this.countries,
  }) : super(key: key);

  final List<CountryModel> countries;

  @override
  State<CountyList> createState() => _CountyListState();
}

class _CountyListState extends State<CountyList> {
  late List<CountryModel> filteredCountries = widget.countries;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ChooseTextWidget(),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
            onChanged: (search) => setState(() {
              filteredCountries = search.isEmpty
                  ? widget.countries
                  : widget.countries.where((c) {
                      final hasMatchName = c.region.toLowerCase().contains(search.toLowerCase());
                      final hasMatchNumber = c.phoneCode.contains(search);
                      return hasMatchName || hasMatchNumber;
                    }).toList();
            }),
          ),
        ),
        Expanded(
          // TODO: Вынести в отдельный виджет
          child: ListView.builder(
            itemCount: filteredCountries.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () => Navigator.of(context).pop(filteredCountries[i]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      Text(filteredCountries[i].flag),
                      const SizedBox(width: 16),
                      Text(
                        filteredCountries[i].phoneCode,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        filteredCountries[i].region,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
