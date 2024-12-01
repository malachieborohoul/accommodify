import 'package:Accommodify/core/error/exceptions.dart';
import 'package:Accommodify/core/error/failures.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/home/data/datasources/accommodation_local_datasource.dart';
import 'package:Accommodify/features/home/data/models/accommodation_model.dart';

import 'package:Accommodify/features/home/domain/repositories/accommodation_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';


import 'package:supabase_flutter/supabase_flutter.dart';

class AccommodationRepositoryImpl implements AccommodationRepository {
  final AccommodationLocalDataSource AccommodifyLocalDataSource;

  AccommodationRepositoryImpl(
    this.AccommodifyLocalDataSource,
  );


 

  @override
  ResultFuture<List<AccommodationModel>> getAccommodations()async {
            try {

      debugPrint("💡From AccommodationRepository getAccommodations");

     final response= await AccommodifyLocalDataSource.getAccommodations();

     

      return right(response);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

 


}
