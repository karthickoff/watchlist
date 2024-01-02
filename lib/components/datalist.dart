import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywatchlist/bloc/header_bloc.dart';
import 'package:mywatchlist/bloc/watchlist_bloc.dart';
import 'package:mywatchlist/model/header_model.dart';
// import 'package:mywatchlist/repo/repositories.dart';

class WatchListDataView extends StatelessWidget {
  const WatchListDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
      BlocListener<HeaderBloc, HeaderState>(
        listener: (context, state) => {},
      );
      if (state is WatchListLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is WatchListError) {
        return Text(state.error);
      }
      if (state is WatchListLoadedState || state is WatchListSortState) {
        List<WatchListData> data = [];

        if (state is WatchListLoadedState) {
          data = state.watchListData;
          var sortType = state.sortType;
          debugPrint("inside watchList Loaded state");
          debugPrint(state.watchListData.toString());
          debugPrint(sortType);
          data = handleSorting(data, sortType);
        }
        if (state is WatchListSortState) {
          debugPrint('inside watchList Sort State ++ ');
          debugPrint(state.watchListData.toString());
          debugPrint('inside watchList Sort State -- ');
          debugPrint(state.watchListData1.toString());
          data = state.watchListData1.isEmpty
              ? state.watchListData
              : state.watchListData1;
          var sortType = state.sortType;
          debugPrint(sortType);
          data = handleSorting(data, sortType);
        }

        return Expanded(
          child: data.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (conext, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Card(
                          child: ListTile(
                        title: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${data[index].name}"),
                            Text("${data[index].Contacts}")
                          ],
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "${data[index].url}",
                          ),
                          radius: 80,
                        ),
                      )),
                    );
                  })
              : const Text('loading'),
        );
      }
      if (state is WatchlistInitial) {
        return const CircularProgressIndicator();
      }
      return const Placeholder(
        child: Text('hi'),
      );
    });
  }
}

handleSorting(List<WatchListData> data, String sortType) {
  switch (sortType) {
    case 'name-desc':
      data.sort((a, b) => b.name!.compareTo(a.name!));
      return data;
    case 'name-asc':
      data.sort((a, b) => a.name!.compareTo(b.name!));
      return data;
    case 'contact-asc':
      data.sort((a, b) => a.Contacts!.compareTo(b.Contacts!));
      return data;
    case 'contact-desc':
      data.sort((a, b) => b.Contacts!.compareTo(a.Contacts!));
      return data;

    default:
      return data;
  }
}
