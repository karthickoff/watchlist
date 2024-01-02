import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywatchlist/bloc/watchlist_bloc.dart';
import 'package:mywatchlist/constants/app_constant.dart';

class HeaderContainer extends StatelessWidget {
  HeaderContainer({required this.currentHeader, super.key});
  final data = headerData;
  String currentHeader = '1';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchlistBloc, WatchlistState>(
      listener: (context, state) {
        if (state is WatchListHeaderState) {
          currentHeader = state.selectedHeader;
        }
      },
      builder: (context, state) {
        debugPrint("before Header state");

        if (state is WatchListHeaderState ||
            state is WatchListLoadedState ||
            state is WatchListSortState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    debugPrint('ON TAP HEADER1');

                    context
                        .read<WatchlistBloc>()
                        .add(const WatchListHeaderClicked('1'));
                  },
                  child: Text(
                    'header1',
                    style: TextStyle(
                      color: currentHeader == '1' ? Colors.amber : Colors.black,
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    debugPrint('ON TAP HEADER1');
                    context
                        .read<WatchlistBloc>()
                        .add(const WatchListHeaderClicked('2'));
                  },
                  child: Text('header2',
                      style: TextStyle(
                          color: currentHeader == '2'
                              ? Colors.amber
                              : Colors.black))),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () async {
                    debugPrint('ON TAP HEADER3');
                    context
                        .read<WatchlistBloc>()
                        .add(const WatchListHeaderClicked('3'));
                  },
                  child: Text('header3',
                      style: TextStyle(
                          color: currentHeader == '3'
                              ? Colors.amber
                              : Colors.black))),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    debugPrint('ON TAP HEADER4');
                    context
                        .read<WatchlistBloc>()
                        .add(const WatchListHeaderClicked('4'));
                  },
                  child: Text('header4',
                      style: TextStyle(
                          color: currentHeader == '4'
                              ? Colors.amber
                              : Colors.black))),
              const SizedBox(
                width: 20,
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
