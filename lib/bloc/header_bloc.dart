import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mywatchlist/repo/repositories.dart';

// import 'package:mywatchlist/repo/repositories.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mywatchlist/model/header_model.dart';
part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  late WatchListRepository watchListRepo;
  HeaderBloc() : super(HeaderInitial()) {
    on<HeaderEvent>((event, emit) {
      // Future<List<WatchListData>> watchListData = watchListRepo.getData();
      debugPrint("Header Bloc");
      debugPrint(event.toString());
      if (event is HeaderCliked) {
        debugPrint(event.data);
        var selectedHeader = event.data;
        emit(HeaderIntialState(selectedHeader));
      } else {
        var curr = '1';
        emit(HeaderIntialState(curr));
      }

      // if (event is LoadWatchListData) {
      // emit(const WatchListLoadingState());
      // if (watchListData) {
      //   emit(WatchListLoadedState(watchListData));
      // } else {
      //   emit(const WatchListError('error '));
      // }
      // }
    });
  }
}
