import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/domain/usecases/accommodation_get_accommodations.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'accommodation_event.dart';
part 'accommodation_state.dart';


class AccommodationBloc extends Bloc<AccommodationEvent, AccommodationState> {
  final AccommodGetAccommodations _accommodationGetAccommodations;
 

  // final SignInWithGoogle _signInWithGoogle;
  AccommodationBloc({
    required AccommodGetAccommodations accommodationGetAccommodations,
   
  })  : 
        _accommodationGetAccommodations = accommodationGetAccommodations,
        
        super(AccommodationInitial()) {
    on<AccommodationEvent>((_, emit) => emit(AccommodationLoading()));

    on<AccommodationGetAccommodations>(_onAccommodationGetAccommodation);
   
  }

  void _onAccommodationGetAccommodation(
      AccommodationGetAccommodations event, Emitter<AccommodationState> emit) async {
    final res = await _accommodationGetAccommodations();
   

    res.fold(
        (l) => emit(AccommodationFailure(l.message)), (r)async {

         emit(AccommodationSuccess(r));
        });
  }

 


}



