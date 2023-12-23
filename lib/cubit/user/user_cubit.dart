import 'package:bloc/bloc.dart';
import 'package:suitmedia_test/models/user.dart';
import 'package:suitmedia_test/services/user_services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final UserServices userServices = UserServices();

  void fetchUserData(int page, bool isRefresh) async {
    emit(FetchUserLoading());
    try {
      await userServices.fetchUser(page, isRefresh);
      allUser.isNotEmpty ? emit(FetchUserSuccess()) : emit(FetchUserNoData());
    } catch (eror) {
      emit(FetchUserEror(eror.toString()));
    }
  }

  void fetchMoreUserData(int page, bool isRefresh) async {
    emit(FetchMoreUserLoading());
    try {
      await userServices.fetchUser(page, isRefresh);
      emit(FetchMoreUserSuccess());
    } catch (eror) {
      emit(FetchUserEror(eror.toString()));
    }
  }

  void updateSelectedUser(String name) {
    emit(UpdateSelectedName(name));
  }
}
