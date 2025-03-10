import 'package:flutter_bloc/flutter_bloc.dart';


abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class ProfileState {
  final String name;
  final String avatarUrl;
  final int wishListCount;
  final int historyCount;

  ProfileState({
    required this.name,
    required this.avatarUrl,
    required this.wishListCount,
    required this.historyCount,
  });
}


ProfileState initialProfile = ProfileState(
  name: "John Safwat",
  avatarUrl: "assets/images/vatarUr.png",
  wishListCount: 12,
  historyCount: 10,
);


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(initialProfile) {
    on<LoadProfile>((event, emit) {
      
      emit(state);
    });
  }
}
