import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class ToggleWatchlistView extends ProfileEvent {} // NEW EVENT

class ProfileState {
  final String name;
  final String avatarUrl;
  final int wishListCount;
  final int historyCount;
  final bool showWatchlist; // NEW STATE

  ProfileState({
    required this.name,
    required this.avatarUrl,
    required this.wishListCount,
    required this.historyCount,
    this.showWatchlist = false, // DEFAULT FALSE
  });

  ProfileState copyWith({bool? showWatchlist}) {
    return ProfileState(
      name: name,
      avatarUrl: avatarUrl,
      wishListCount: wishListCount,
      historyCount: historyCount,
      showWatchlist: showWatchlist ?? this.showWatchlist,
    );
  }
}

ProfileState initialProfile = ProfileState(
  name: "John Safwat",
  avatarUrl: "assets/images/avatar1.png",
  wishListCount: 12,
  historyCount: 10,
);

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(initialProfile) {
    on<LoadProfile>((event, emit) {
      emit(state);
    });

    on<ToggleWatchlistView>((event, emit) {
      emit(state.copyWith(showWatchlist: !state.showWatchlist));
    });
  }
}
