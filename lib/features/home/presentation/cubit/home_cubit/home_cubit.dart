import 'package:bloc/bloc.dart';
import 'package:eduzone/features/home/data/repo/home_repo.dart';
import 'package:eduzone/features/home/persentation/cubit/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo):super(InitialHomeState());


  Future<void>getCourses()async{
    emit(LoadingHomeState());
  final res = await  homeRepo.getCourses();
  res.fold((error){
    emit(ErrorHomeState(error));
  }, (success){
    emit(SuccessHomeState(success));
  });

}
  }



