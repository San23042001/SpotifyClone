import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/get_it/service_locator.dart';
import 'package:spotify_clone/services/analytics_service.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final double size;
  final Function? function;
  const FavoriteButton(
      {required this.songEntity, this.function, super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
                onPressed: () async {
                  await context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.songId);
                  await sl<AnalyticsService>()
                      .logFavoriteSong(songEntity.title);
                  if (function != null) {
                    function!();
                  }
                },
                icon: Icon(
                  songEntity.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                ));
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () async {
                await context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);

                await sl<AnalyticsService>().logFavoriteSong(songEntity.title);
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                size: 25,
                color: AppColors.darkGrey,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
