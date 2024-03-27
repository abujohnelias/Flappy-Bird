import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';
import 'package:flappybird/components/ground.dart';
import 'package:flappybird/components/pipe_group.dart';
import 'package:flappybird/game/configration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();
  late Bird bird;
  bool isHit = false;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  Future<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
        bird = Bird(),
        PipeGroup(),
        score = buildScore()
      ],
    );

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = "S C O R E : ${bird.score}";
  }

  TextComponent<TextRenderer> buildScore() {
    return TextComponent(
      text: "S C O R E : 0",
      position: Vector2(size.x / 2, size.y / 2 * .2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "PixelifySans",
        ),
      ),
    );
  }
}
