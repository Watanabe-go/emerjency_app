import 'package:shake/shake.dart';
import 'package:emergency_app/ui_core/text_to_speech.dart';

class ShakeDevice{
  static ShakeDetector detector = ShakeDetector.waitForStart(
    onPhoneShake: (){
      TextToSpeech.speak("助けが必要です。お手伝いいただけませんか");
    },
    minimumShakeCount: 2,
    shakeSlopTimeMS: 500,
    shakeCountResetTime: 3000,
    shakeThresholdGravity: 2.7,
    );
}