import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/constants/assets.dart';
import 'package:flappybird/game/configration.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  @override
  final double height;
  final Pipeposition pipeposition;

  Pipe({
    required this.height,
    required this.pipeposition,
  });

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRoated);
    size = Vector2(50, height);

    switch (pipeposition) {
      case Pipeposition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case Pipeposition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
