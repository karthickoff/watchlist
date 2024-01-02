part of 'watchlist_bloc.dart';

sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWatchListData extends WatchlistEvent {}

class SortClickedEvent extends WatchlistEvent {
  final String data;
  const SortClickedEvent(this.data);
  @override
  List<Object> get props => [SortClickedEvent];
}

class WatchListHeaderClicked extends WatchlistEvent {
  final String data;
  const WatchListHeaderClicked(this.data);
  @override
  List<Object> get props => [WatchListHeaderClicked];
}
