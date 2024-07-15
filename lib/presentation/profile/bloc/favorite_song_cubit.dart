import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/get_favorite_song.dart';
import 'package:spotify_clone/get_it/service_locator.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_song_state.dart';

class FavoriteSongCubit extends Cubit<FavoriteSongState> {
  FavoriteSongCubit() : super(FavoriteSongLoading());

  List<SongEntity> favoriteSongs = [];
  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongUseCase>().call();

    result.fold((l) {
      emit(FavoriteSongsFailure());
    }, (r) {
      favoriteSongs = r;
      emit(FavoriteSongLoaded(favoriteSongs: favoriteSongs));
    });
  }

  void removeSongs(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongLoaded(favoriteSongs: favoriteSongs));
  }
}
