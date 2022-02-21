// ignore_for_file: prefer_final_fields

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


enum Language { rus, eng }

class Management with ChangeNotifier {
  bool sound;
  Language language;
  int score;
  Map<String,int> typePairsNum = {
    'melon': 0,
    'orange': 0,
    'lemon': 0,
    'leaf': 0,
    'apple': 0,
    'grapes': 0,
    'star_type': 0,
    'seven': 0,
  };              //number of cards for each tile type


  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.PLAYING;
  AudioCache audioCache = AudioCache();
  Map<String,String> audioPaths = {
    'game over': 'sounds/game over.mp3',
    'pair of cards': 'sounds/pair of cards.mp3',
  };

  Management(
      {this.language = Language.eng,
        this.sound = true,
        this.score = 0,
      });



  void initializeAudio(){
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      playerState = s;
      notifyListeners();
    });
  }

  void playMusic(String audioPath) async {
    // await audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    // await audioCache.loop(audioPath);
    if(sound == true){
    pauseMusic();
    await audioCache.play(audioPath);
    }
  }

  void pauseMusic() async{
    await audioPlayer.pause();
  }

  void switchSound(){
    sound = !sound;
    notifyListeners();
  }


  bool get isEnglish{
    return language == Language.eng;
  }

  void switchLanguage(){
    if(language == Language.eng){
      language = Language.rus;
    }else{
      language = Language.eng;
    }
    notifyListeners();
  }
}
