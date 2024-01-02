part of 'header_bloc.dart';

// @immutable
sealed class HeaderState extends Equatable {
  const HeaderState();

  @override
  List<Object> get props => [];
}

class HeaderInitial extends HeaderState {}

class HeaderIntialState extends HeaderState {
  final String selectedHeader;
  const HeaderIntialState(this.selectedHeader);
  @override
  List<Object> get props => [selectedHeader];
}
