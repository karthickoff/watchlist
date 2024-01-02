part of 'watchlist_bloc.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

final class WatchlistInitial extends WatchlistState {}

class WatchListLoadingState extends WatchlistState {
  const WatchListLoadingState();
  @override
  List<Object> get props => [];
}

class WatchListLoadedState extends WatchlistState {
  final List<WatchListData> watchListData;
  final List<dynamic> watchListData1;

  final String sortType;
  const WatchListLoadedState(
      this.watchListData, this.sortType, this.watchListData1);
  @override
  List<Object> get props => [watchListData, sortType, watchListData1];
}

class WatchListError extends WatchlistState {
  final String error;
  const WatchListError(this.error);
  @override
  List<Object> get props => [error];
}

class WatchListChangeState extends WatchlistState {}

class WatchListSortState extends WatchlistState {
  final String sortType;
  final List<WatchListData> watchListData;
  final List<WatchListData> watchListData1;

  const WatchListSortState(
      this.sortType, this.watchListData, this.watchListData1);
  @override
  List<Object> get props => [sortType, watchListData, watchListData1];
}

class WatchListHeaderState extends WatchlistState {
  final String selectedHeader;
  const WatchListHeaderState(this.selectedHeader);
  @override
  List<Object> get props => [selectedHeader];
}
