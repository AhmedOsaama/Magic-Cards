// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:magic_cards/providers/management.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  final closeSettings;

  const Settings({Key? key, this.closeSettings}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context);
    return Container(
      width: 290,
      height: management.isEnglish ? 267 : 320,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 1,88, 171),
            Color.fromARGB(255, 2, 30, 116),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
          borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "SETTINGS",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 36),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                management.language == Language.rus ? 'Язык' : "Language",
                style: Theme.of(context).textTheme.headline1,
              ),
              FlatButton(
                onPressed: () {
                  management.switchLanguage();
                },
                child: management.language == Language.eng
                    ? Image.asset('images/eng.png')
                    : Image.asset(
                        'images/rus2.png',
                        width: 45,
                        height: 30,
                      ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                management.language == Language.rus ? 'Звук' : "Sound",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  management.switchSound();
                },
                child: management.sound == true
                    ? Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.volume_off,
                        color: Colors.white,
                      ),

              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              const url =
                  "https://pages.flycricket.io/magic-cards-2/privacy.html";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 236,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 1,88, 171),
                        Color.fromARGB(255, 2, 30, 116),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: management.language == Language.rus
                    ? Text("Политика конфиденциальности",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1)
                    : Text("Privacy Policy",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: widget.closeSettings,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 236,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 1,88, 171),
                        Color.fromARGB(255, 2, 30, 116),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: Text("Back to menu",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
