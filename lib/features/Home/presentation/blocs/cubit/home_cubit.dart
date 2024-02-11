import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/features/Home/domain/entities/classes_entity.dart';
import 'package:moton/features/Home/domain/use_cases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.fetchHomeUsecase) : super(HomeInitial());

  final FetchHomeUsecase fetchHomeUsecase;
  
  Future<void> fetchSemsters() async {
    emit(HomeLoding());
    var result = await fetchHomeUsecase.excute();

    result.fold((failure) {
      emit(HomeFailure(failure.message));
    }, (semsters) {
      emit(Homesuccess(semsters));
    });
  }
}
