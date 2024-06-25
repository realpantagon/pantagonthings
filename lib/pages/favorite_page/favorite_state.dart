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
  final double totalNet;

  FavoriteLoaded(this.records, this.totalCount, this.totalNet);

  @override
  List<Object> get props => [records, totalCount, totalNet];
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
