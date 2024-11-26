import 'package:accommodation/core/error/exceptions.dart';
import 'package:accommodation/core/error/failures.dart';
import 'package:accommodation/core/utils/typedef.dart';

import 'package:accommodation/features/home/data/datasources/accommodation_local_datasource.dart';
import 'package:accommodation/features/home/data/models/accommodation_model.dart';
import 'package:accommodation/features/home/domain/repositories/accommodation_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';


import 'package:supabase_flutter/supabase_flutter.dart';

class AccommodationRepositoryImpl implements AccommodationRepository {
  final AccommodationLocalDataSource accommodationLocalDataSource;

  AccommodationRepositoryImpl(
    this.accommodationLocalDataSource,
  );


 

  @override
  ResultFuture<List<AccommodationModel>> getAccommodations()async {
            try {

      debugPrint("💡From AccommodationRepository getAccommodations");

     final response= await accommodationLocalDataSource.getAccommodations();

     

      return right(response);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

 


}
