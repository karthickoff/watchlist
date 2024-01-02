part of 'header_bloc.dart';

@immutable
sealed class HeaderEvent extends Equatable {
  const HeaderEvent();

  @override
  List<Object> get props => [];
}

class HeaderCliked extends HeaderEvent {
  final String data;
  const HeaderCliked(this.data);
  @override
  List<Object> get props => [HeaderCliked];
}
