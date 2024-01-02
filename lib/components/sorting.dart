import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywatchlist/bloc/watchlist_bloc.dart';

class SortingWidget extends StatelessWidget {
  const SortingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
            onTap: () {
              _settingModalBottomSheet(context);
            },
            child: const Icon(Icons.settings))
      ],
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return BlocConsumer<WatchlistBloc, WatchlistState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Wrap(
              children: <Widget>[
                const ListTile(
                  title: Text('Sort By'),
                ),
                ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Name'),
                    trailing: Expanded(
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<WatchlistBloc>()
                                  .add(const SortClickedEvent('name-asc'));
                              Navigator.pop(context);
                            },
                            tooltip: 'Increment Sort',
                            icon: Icon(
                              Icons.arrow_upward_rounded,
                              color: state is WatchListSortState
                                  ? (state.sortType == 'name-asc'
                                      ? Colors.red
                                      : Colors.black)
                                  : Colors.black,
                            )),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<WatchlistBloc>()
                                  .add(const SortClickedEvent('name-desc'));
                              Navigator.pop(context);
                            },
                            tooltip: 'Decrement Sort',
                            icon: Icon(
                              Icons.arrow_downward_rounded,
                              color: state is WatchListSortState
                                  ? (state.sortType == 'name-desc'
                                      ? Colors.red
                                      : Colors.black)
                                  : Colors.black,
                            )),
                      ]),
                    ),
                    onTap: () => {}),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Contacts'),
                  trailing: Expanded(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<WatchlistBloc>()
                                .add(const SortClickedEvent('contact-asc'));
                            Navigator.pop(context);
                          },
                          tooltip: 'Increment Sort',
                          icon: Icon(
                            Icons.arrow_upward_rounded,
                            color: state is WatchListSortState
                                ? (state.sortType == 'contact-asc'
                                    ? Colors.red
                                    : Colors.black)
                                : Colors.black,
                          )),
                      IconButton(
                          onPressed: () {
                            context
                                .read<WatchlistBloc>()
                                .add(const SortClickedEvent('contact-desc'));
                            Navigator.pop(context);
                          },
                          tooltip: 'Decrement Sort',
                          icon: Icon(
                            Icons.arrow_downward_rounded,
                            color: state is WatchListSortState
                                ? (state.sortType == 'contact-desc'
                                    ? Colors.red
                                    : Colors.black)
                                : Colors.black,
                          )),
                    ]),
                  ),
                  onTap: () => {},
                ),
              ],
            );
          },
        );
      });
}
