import 'package:flutter_tts/flutter_tts.dart';
import 'package:audio_session/audio_session.dart';

class TextToSpeech{
  static Future<void> speak(String speakText)async{
    final FlutterTts tts = FlutterTts();
    await tts.stop();
    await tts.setLanguage('ja-JP');
    await tts.setSpeechRate(0.5);
    await tts.setVolume(1.0);
    await tts.setPitch(1.0);
    await tts.speak(speakText);

    AudioSession session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    await tts.speak(speakText);
    await session.configure(const AudioSessionConfiguration.music()); 
    }
}