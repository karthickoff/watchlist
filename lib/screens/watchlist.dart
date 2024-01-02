import 'package:flutter/material.dart';
import 'package:mywatchlist/components/datalist.dart';
import 'package:mywatchlist/components/headerlist.dart';
import 'package:mywatchlist/components/sorting.dart';

class WatchListHome extends StatelessWidget {
  const WatchListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('watchList'),
      ),
      body: Column(
        children: [
          HeaderContainer(currentHeader: '1'),
          const SizedBox(
            height: 20,
          ),
          const SortingWidget(),
          const SizedBox(
            height: 20,
          ),
          const WatchListDataView(),
        ],
      ),
    );
  }
}
