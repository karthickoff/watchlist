import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mywatchlist/bloc/header_bloc.dart';
import 'package:mywatchlist/model/header_model.dart';
import 'package:mywatchlist/repo/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mywatchlist/model/header_model.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchListRepository watchListRepo;
  var sortType1 = 'name-asc';
  final HeaderBloc headerBLoc = HeaderBloc();
  var currHeader = '1';

  WatchlistBloc(headerBLoc, this.watchListRepo) : super(WatchlistInitial()) {
    on<LoadWatchListData>((event, emit) async {
      // emit
      debugPrint("inside LoadWatchListData");
      try {
        final watchListData = await watchListRepo.getData();
        List<WatchListData> retrievedList = [];
        var sortType = "name-asc";
        emit(WatchListLoadedState(
            watchListData.sublist(0, 11), sortType, retrievedList));
      } catch (e) {
        emit(WatchListError(e.toString()));
      }
    });
    on<SortClickedEvent>((event, emit) async {
      sortType1 = event.data;
      List<WatchListData> storedList1 = [];
      var intialSubType = handleRange(currHeader);
      List<WatchListData> retrievedList = await handleAPIData();
      emit(WatchListSortState(event.data, storedList1,
          retrievedList.sublist(intialSubType, intialSubType + 11)));
    });
    on<WatchListHeaderClicked>((event, emit) async {
      currHeader = event.data;
      emit(WatchListHeaderState(event.data));
      List<WatchListData> retrievedList = await handleAPIData();
      var intialSubType = handleRange(currHeader);
      emit(WatchListSortState('name-asc', const [],
          retrievedList.sublist(intialSubType, intialSubType + 11)));
    });
  }
}

int handleRange(String currHeader) {
  var intialSubType = 0;
  if (currHeader == '2') {
    intialSubType = 10;
  }
  if (currHeader == '3') {
    intialSubType = 20;
  }
  if (currHeader == '4') {
    intialSubType = 30;
  }
  return intialSubType;
}

handleAPIData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedData = prefs.getString('yourKey');
  List<WatchListData> retrievedList = [];

  if (storedData != null) {
    List<dynamic> decoded = jsonDecode(storedData);
    retrievedList = decoded.map((obj) => WatchListData.fromJson(obj)).toList();
  }
  return retrievedList;
}
