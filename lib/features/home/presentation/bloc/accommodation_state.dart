part of 'accommodation_bloc.dart';

sealed class AccommodationState extends Equatable {
  const AccommodationState();
  
  @override
  List<Object> get props => [];
}

final class AccommodationInitial extends AccommodationState {}
final class AccommodationLoading extends AccommodationState {}
final class AccommodationSuccess extends AccommodationState {
  final List<Accommodation> accommodations;

  const AccommodationSuccess(this.accommodations);
}


final class AccommodationFailure extends AccommodationState {
  final String message;
  final String errorCode;

   const AccommodationFailure([this.message = 'An unexpected error occurred', this.errorCode = ""]);
}