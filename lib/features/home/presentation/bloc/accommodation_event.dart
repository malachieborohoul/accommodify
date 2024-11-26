part of 'accommodation_bloc.dart';

sealed class AccommodationEvent extends Equatable {
  const AccommodationEvent();

  @override
  List<Object> get props => [];
}



final class AccommodationGetAccommodations extends AccommodationEvent {
  const AccommodationGetAccommodations();

}