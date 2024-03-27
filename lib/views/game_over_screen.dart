import 'package:flappybird/constants/assets.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "game_over";
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRestart,
      child: Material(
        color: Colors.black26,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "S C O R E : ",
                    style: GoogleFonts.pixelifySans(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    game.bird.score.toString(),
                    style: GoogleFonts.rubikPixels(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(Assets.gameOver),
              const SizedBox(
                height: 12,
              ),
              Text(
                "R E S T A R T",
                style: GoogleFonts.pixelifySans(
                  color: Colors.white,
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove(id);
    game.resumeEngine();
  }
}
