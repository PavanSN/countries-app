import 'package:credit_saison/feature/home/logic/cubit/countries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_cubit/get_cubit.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final CountriesCubit _countriesCubit = GetCubit.put(CountriesCubit());

  @override
  void initState() {
    _countriesCubit.fetchCountries(region: Regions.all);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            TabList(
              listItems: Regions.getAllCountryNames(),
            ),
            SizedBox(
              height: 8,
            ),
            BlocBuilder<CountriesCubit, CountriesState>(
              bloc: _countriesCubit,
              builder: (context, state) {
                if (state is CountriesLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemBuilder: (context, index) {
                      final country = state.countryModel[index];
                      return CountryUi(
                        name: country.name.common,
                        officialName: country.name.official,
                        currency: country.currencies.name,
                        currencyCode: country.currencies.code,
                        flag: country.flags.png,
                      );
                    },
                    itemCount: state.countryModel.length,
                  );
                } else if (state is CountriesError) {
                  return Center(
                    child: Text(
                      state.message.toString(),
                    ),
                  );
                } else if (state is CountriesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CountryUi extends StatelessWidget {
  const CountryUi({
    super.key,
    required this.name,
    required this.officialName,
    required this.currency,
    required this.currencyCode,
    required this.flag,
  });

  final String name;
  final String officialName;
  final String currency;
  final String currencyCode;
  final String flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 1),
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('($name) $officialName'),
              Image.network(
                flag,
                height: 20,
              ),
            ],
          ),
          const Divider(),
          Text('($currency) $currencyCode'),
        ],
      ),
    );
  }
}

class TabList extends StatelessWidget {
  TabList({
    super.key,
    required this.listItems,
  });

  ValueNotifier selectedTab = ValueNotifier(0);

  List<String> listItems;

  final _countriesCubit = GetCubit.find<CountriesCubit>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTab,
      builder: (context, selectedTabVal, child) {
        return SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                _countriesCubit.fetchCountries(region: Regions.values[index]);
                selectedTab.value = index;
              },
              child: Container(
                color: selectedTabVal == index
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Text(
                    listItems[index],
                    style: TextStyle(
                        color: selectedTabVal == index
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: listItems.length,
          ),
        );
      },
    );
  }
}
