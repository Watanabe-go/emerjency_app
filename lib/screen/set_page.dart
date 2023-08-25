import 'package:emergency_app/widgets/decision_button.dart';
import 'package:emergency_app/widgets/tab.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:emergency_app/main.dart';
import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key,});
  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  final TextEditingController _controller_familyName = TextEditingController(text: box.get('family_name',defaultValue: ''));
  final TextEditingController _controller_familyNum = TextEditingController(text: box.get('family_num',defaultValue: ''));
  final TextEditingController _controller_hospitalName = TextEditingController(text: box.get('hospital_name',defaultValue: ''));
  final TextEditingController _controller_hospitalNum = TextEditingController(text: box.get('hospital_num',defaultValue: ''));
  final TextEditingController _controller_emerjencyName = TextEditingController(text: box.get('emerjency_name',defaultValue: ''));
  final TextEditingController _controller_emerjencyNum = TextEditingController(text: box.get('emerjency_num',defaultValue: ''));
  final TextEditingController _controller_name = TextEditingController(text: box.get('name',defaultValue: ''));
  final TextEditingController _controller_sickName = TextEditingController(text: box.get('sick_name',defaultValue: ''));
  final TextEditingController _controller_sickShojo = TextEditingController(text: box.get('sick_shojo',defaultValue: ''));
  
  @override
  Widget build(BuildContext context) {
    final maxwidth = MediaQuery.of(context).size.width;
    final maxheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: maxheight * 0.03,
              ),
              TabSet(
                maxwidth: maxwidth,
                maxheight: maxheight,
                iconPath: Icons.settings,
                text_set: '各種設定',
                ),
              SizedBox(
                height: maxheight * 0.03,
              ),
              TabSet(
                maxwidth: maxwidth,
                maxheight: maxheight,
                iconPath: Icons.phonelink_setup,
                text_set: '電話番号設定'
                ),
              Container(
                height: maxheight * 0.55,
                width: maxwidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: '家族名入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_familyName,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await box.put('family_name', _controller_familyName.text);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('${_controller_familyName.text}、で確定しました。'),
                                  );
                              });
                              FocusScope.of(context).unfocus();
                          },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: maxheight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: '家族の電話番号入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_familyNum,
                            ),
                          ),
                          InkWell(
                            onTap: ()async {
                              await box.put('family_num', _controller_familyNum.text);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_familyNum.text}  ,で確定しました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                    ]),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: '病院・施設名入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_hospitalName,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await box.put('hospital_name',_controller_hospitalName.text); 
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_hospitalName.text}、で確定されました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: maxheight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: '病院・施設の電話番号入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_hospitalNum,
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              await box.put('hospital_num',_controller_hospitalNum.text);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_hospitalNum.text}、で確定されました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                    ]),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: '緊急連絡先入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_emerjencyName,
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              await box.put('emerjency_name', _controller_emerjencyName.text);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_emerjencyName.text}、で確定されました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: maxheight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: '緊急連絡先の電話番号入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_emerjencyNum,
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              await box.put('emerjency_num',_controller_emerjencyNum.text);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_emerjencyNum.text}、で確定されました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: maxheight * 0.03,
              ),
              TabSet(
                maxwidth: maxwidth, 
                maxheight: maxheight,
                iconPath: Icons.face_6, 
                text_set: '名前設定'
                ),
              Container(
                height: maxheight * 0.12,
                width: maxwidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: maxwidth * 0.65,
                      height: maxheight * 0.07,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '名前入力',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        controller: _controller_name,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await box.put('name',_controller_name.text);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('名前が${_controller_name.text}、で確定しました。'),
                              );
                            });
                            FocusScope.of(context).unfocus();
                      },
                      child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: maxheight * 0.03,
              ),
              TabSet(
                maxwidth: maxwidth, 
                maxheight: maxheight,
                iconPath: Icons.medical_services, 
                text_set: '病名及び症状設定'
                ),
              Container(
                height: maxheight * 0.18,
                width: maxwidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: '病名入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_sickName,
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              await box.put('sick_name',_controller_sickName.text);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_sickName.text}、で確定されました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: maxwidth * 0.65,
                            height: maxheight * 0.07,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: '症状入力',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              controller: _controller_sickShojo,
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              await box.put('sick_shojo', _controller_sickShojo.text);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('${_controller_sickShojo.text}、で確定されました。'),
                                    );
                                  });
                                  FocusScope.of(context).unfocus();
                            },
                            child: DecisionButton(
                              maxheight: maxheight,
                              maxwidth: maxwidth,
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: maxheight * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TopPage(),
                    ),
                  );
                },
                child: Container(
                  height: maxheight * 0.08,
                  width: maxwidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '戻る',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 70,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: maxheight * 0.03,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
