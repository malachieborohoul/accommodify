import 'package:Accommodify/core/usecase/usecase.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/domain/repositories/accommodation_repository.dart';
import 'package:flutter/material.dart';

class AccommodGetAccommodations implements UsecaseWithoutParams<List<Accommodation>> {
  final AccommodationRepository AccommodifyRepository;

  AccommodGetAccommodations(this.AccommodifyRepository);
  @override
  ResultFuture<List<Accommodation>> call() async {
      debugPrint("💡From AccomGetAccommodations ");

        return await AccommodifyRepository.getAccommodations();

  }
}
