import 'package:flame/game.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/views/game_over_screen.dart';
import 'package:flappybird/views/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(

    GameWidget(

      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        "main_menu": (context, _) => MainMenuScreen(game: game),
        "game_over": (context, _) => GameOverScreen(game: game),
      },
      
    ),
  );
}
