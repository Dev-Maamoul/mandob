import 'package:bloc/bloc.dart';
import 'package:company_project/layer_data/driver_data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  DriversCubit() : super(DriversInitial());
  final getIt = GetIt.I.get<DriversData>();

  loadDrivers() async {
    try {
      emit(LoadingState());
      await getIt.loadData();
      emit(SuccessState());
    } catch (error) {
      throw FormatException("-----d----");
    }
  }

  Future<void> uploadFile({required List<int> fileData}) async {
    try {
      emit(LoadingUploadedState());
      await getIt.uploadDriver(fileData: fileData);

      emit(SuccessUploadedState());
    } on FormatException catch (error) {
      emit(ErrorUploadedState(text: error.message));
    } catch (error) {
      emit(ErrorUploadedState(text: error.toString()));
    }
  }
}
