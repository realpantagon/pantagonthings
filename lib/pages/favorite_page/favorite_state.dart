// favorite_state.dart
import 'package:equatable/equatable.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<AirtableRecord> records;
  final int totalCount;
  final double total;

  FavoriteLoaded(this.records, this.totalCount, this.total);

  @override
  List<Object> get props => [records, totalCount, total];
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
