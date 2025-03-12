import 'package:bloc/bloc.dart';
// import 'package:company_project/layer_data/driver_data.dart';
import 'package:company_project/layer_data/profile_data.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _getIt = GetIt.I.get<ProfileData>();
  // final _getItDriver = GetIt.I.get<DriversData>();

  HomeCubit() : super(HomeInitial());

  Future<void> getProfile() async {
    try {
      emit(LoadingState());
      await _getIt.loadedProfile();

      emit(SuccessState());
    } on FormatException catch (error) {
      emit(ErrorState(text: error.message));
    } catch (error) {
      emit(ErrorState(text: error.toString()));
    }
  }

  Future<void> refresh() async {
    try {
      emit(LoadingState());
      await _getIt.loadedProfile(loadOnline: true);

      emit(SuccessState());
    } on FormatException catch (error) {
      emit(ErrorState(text: error.message));
    } catch (error) {
      emit(ErrorState(text: error.toString()));
    }
  }
}
