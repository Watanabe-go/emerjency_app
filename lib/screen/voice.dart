import 'package:flutter/material.dart';
import 'package:emergency_app/ui_core/text_to_speech.dart';
import '../main.dart';

class VoicePage extends StatefulWidget {
  const VoicePage({super.key});

  @override
  State<VoicePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  final TextEditingController _controller_Voice = TextEditingController(text: box.get('voice',defaultValue: ''));

  @override

  Widget build(BuildContext context) {
    final maxwidth = MediaQuery.of(context).size.width;
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 155, 204, 244),
      appBar: AppBar(
        title: Text('読み上げページ'),
      ),
      body: Center(
        child: Column(children: [
          Container(
            width: maxwidth * 0.7,
            height: 100,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '読み上げてほしい文をセット',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  )
              ),
              controller: _controller_Voice,
            ),
          ),
          ElevatedButton(
            onPressed:()async{
              TextToSpeech.speak(_controller_Voice.text);
            }, 
            child: Text('読み上げる'),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TopPage(),
                    ),
                  );
            }, 
            child: Text('戻る'),
          )
        ],)
        ),
    );
  }
}

