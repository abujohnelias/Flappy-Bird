import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/constants/assets.dart';
import 'package:flappybird/game/configration.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/game/pipe_position.dart';
import 'package:flutter/material.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  final _random = Random();
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final space = 111 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = space + _random.nextDouble() * (heightMinusGround - space);
    addAll(
      [
        Pipe(
          height: centerY - (space / 2),
          pipeposition: Pipeposition.top,
        ),
        Pipe(
          height: heightMinusGround - (centerY + (space / 2)),
          pipeposition: Pipeposition.bottom,
        ),
      ],
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}
