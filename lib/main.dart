import 'package:emergency_app/screen/memo_page.dart';
import 'package:emergency_app/screen/set_page.dart';
import 'package:emergency_app/screen/voice.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:emergency_app/ui_core/shake.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';

late Box box;

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox('box1');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((_){
    runApp(
      const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({super.key,});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  void openCall(phone_number) async{
    //phone_number = '117';
    final Uri callLaunchUri = Uri(
      scheme: 'tel',
      path: phone_number,
    );

    canLaunchUrl(callLaunchUri).then((value) {
      if(value){
        launchUrl(callLaunchUri).then((value) {
          print('launchUrl result: $value');
        });
      }else{
        print('cannot call');
      }
    });
  }

  @override
  void initState(){
    ShakeDevice.detector.startListening();
    super.initState();
  }

  @override
  void dispose(){
    ShakeDevice.detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxwidth = MediaQuery.of(context).size.width;
    final maxheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 176, 217, 236),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                  height: maxheight * 0.27,
                  width: maxwidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          'お願いがあります!', 
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          '私は病気でうまく話せません',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          '代わりに電話をかけてもらえませんか？',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          '私がここで困っていると伝えてほしいです',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ]),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: maxheight * 0.07,
                      width: maxheight * 0.07,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(2,2),
                            blurRadius: 10.0,
                          )
                        ],
                        color: Colors.red,
                      ),
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SOS',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 30,
                            )
                        ]),
                      ),
                    ),
                ),
            ]),
              Container(
                height: maxheight * 0.26,
                width: maxwidth * 0.7,
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: maxheight * 0.066,
                        width: maxwidth * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Text (
                          box.get('family_name',defaultValue: '家族名'),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: maxheight * 0.031,
                      ),
                      InkWell(
                        onTap: (){
                          openCall(box.get('family_num'));
                        },
                        child: Container(
                          height: maxheight * 0.066,
                          width: maxheight * 0.066,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.phone,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: maxheight * 0.066,
                        width: maxwidth * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Text(
                          box.get('hospital_name',defaultValue: '病院名'),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: maxheight * 0.031,
                      ),
                      InkWell(
                        onTap: () {
                          openCall(box.get('hospital_num'));
                        },
                        child: Container(
                          height: maxheight * 0.066,
                          width: maxheight * 0.066,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.phone,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: maxheight * 0.066,
                        width: maxwidth * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Text(
                          box.get('emerjency_name',defaultValue: '緊急連絡先'),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: maxheight * 0.031,
                      ),
                      InkWell(
                        onTap: () {
                          openCall(box.get('emerjency_num'));
                        },
                        child: Container(
                          height: maxheight * 0.066,
                          width: maxheight * 0.066,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.phone,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                height: maxheight * 0.27,
                width: maxwidth * 0.95,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        '私は、${box.get('name',defaultValue: ':ここに名前:')}です', 
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        '${box.get('sick_name',defaultValue: ':ここに病名:')}、という病気です',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        '${box.get('sick_shojo',defaultValue: ':ここに症状:')}、という症状があります',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                  ]),
              ),
            ]),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.yellow,
        height: maxheight * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Icon(
            Icons.emoji_people,
            size: 50,
          ),
          FittedBox(
            child: Text(
              'お願いします。',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemoScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: maxheight * 0.067,
              width: maxwidth * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Row(children: [
                Icon(Icons.history_edu),
                Text(
                  'メモ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SetPage(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
                        height: maxheight * 0.067,
                        width: maxwidth * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
              child: Row(children: [
                Icon(Icons.settings),
                Text(
                  '設定',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]),
            ),
          )
        ],),
      ),
    );
  }
}