//This file will be deleted in future
//But now it should just work

import 'package:flutter/material.dart';

class DataItem {
  final Text title;
  final Text description;
  final Image initIcon;
  final String link;
  DataItem(this.title, this.description, this.initIcon, this.link);
}

List<DataItem> radioAPI = [
  DataItem(
    Text('J-Pop Sakura'),
    Text(
      '懐かしい 配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/tjq25grgtzfg.jpeg',
      scale: 200,
      ),
      'http://bluford.torontocast.com:8519/;'
  ),
  DataItem(
    Text('J-Pop Powerplay'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/3lstl6zfgcbx.png',
      scale: 200
    ),
    'http://agnes.torontocast.com:8102/;'
  ),
  DataItem(
    Text('湘南ビーチFM'),
    Text(
      '(Shonan Beach FM) 配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/Yve4FR2sFn.png',
      scale: 200
    ),
    'http://163.44.158.107:8000/by_the_sea'
  ),
  DataItem(
    Text('レディオ湘南FM'),
    Text(
      '(Radio Shonan) 配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/mQX3QXdcpA.jpg',
      scale: 200,
    ),
    'https://musicbird.leanstream.co/JCB101-MP3'
  ),
  DataItem(
    Text('Japan Hits - Asia DREAM Radio'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/zfu8ctxmscmq.jpg',
      scale: 200,
    ),
    'http://bluford.torontocast.com:8526/;'
  ),
  DataItem(
    Text('Jazz Sakura - asia DREAM radio'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/nxrsacawm2ey.png',
      scale: 200,
    ),
    'http://184.75.223.178:8087/;.mp3'
  ),
  DataItem(
    Text('Vocaloid Radio'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/Q4KsEUWN5J.jpg',
      scale: 200
    ),
    'http://curiosity.shoutca.st:8019/128'
  ),
  DataItem(
    Text('J-Pop Project Radio'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/5slkqvvdhajd.png',
      scale: 200
    ),
    'http://agnes.torontocast.com:8083/stream'
  ),
  DataItem(
    Text('J-Rock Powerplay'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/jsndecatjnre.png',
      scale: 200,
    ),
    'http://cristina.torontocast.com:8057/;.mp3'
  ),
  DataItem(
    Text('J-Pop Powerplay Kawaii'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/bytgkfy7xy4q.jpg',
      scale: 200
    ),
    'http://sky1.torontocast.com:9029/;'
  ),
  DataItem(
    Text('J-Pop 春 Sakura'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/ku7pgjfbk7ms.png',
      scale: 200
    ),
    'https://daniel.torontocast.com:2630/;'
  ),
  DataItem(
    Text('FMうるま (FM Uruma)'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/sFcMxhmByx.jpg',
      scale: 200
    ),
    'http://www.simulradio.info/asx/uruma.asx'
  ),
  DataItem(
    Text('Japan-a-Radio 日本流行音樂與動畫卡通歌曲'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/UqbBDkDwhA.png',
      scale: 200
    ),
    'http://audio.misproductions.com/japan48kaacp;'
  ),
  DataItem(
    Text('J-Idols Project Radio'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/u72bquebkvwj.png',
      scale: 200
    ),
    'http://agnes.torontocast.com:8011/stream'
  ),
  DataItem(
    Text('Radio MOMO (レディオモモ)'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/qptkvZ5YeX.gif',
      scale: 200
    ),
    'https://musicbird.leanstream.co/JCB079-MP3'
  ),
  DataItem(
    Text('Super Tokio Radio'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/radios-150px/r8uhzyznrxlc.jpg',
      scale: 200
    ),
    'https://streamer.radio.co/s83eb8ff39/listen'
  ),
  DataItem(
    Text('Ghost Anime Radio'),
    Text(
      'Animeradio.su',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/xb2GGJUGXE.png',
      scale: 200
    ),
    'http://animeradio.su:8000/;'
  ),
  DataItem(
    Text('Ghost Anime Radio'),
    Text(
      'Animeradio.su',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/xb2GGJUGXE.png',
      scale: 200
    ),
    'http://animeradio.su:8000/;'
  ),
  DataItem(
    Text('エフエム宝塚83.5 (FM Takarazuka)'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/k8Xemnx6dn.jpg',
      scale: 200
    ),
    'https://musicbird.leanstream.co/JCB071-MP3'
  ),
  DataItem(
    Text('富山シティエフエム (Toyama City FM)'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/uWmTEUtzSP.jpg',
      scale: 200
    ),
    'https://musicbird.leanstream.co/JCB057-MP3'
  ),
  DataItem(
    Text('エフエムふくやま Radio Bingo'),
    Text(
      '配信中',
      style: TextStyle(fontStyle: FontStyle.italic)
    ),
    Image.network(
      'https://static.mytuner.mobi/media/tvos_radios/A4mWGDSpRQ.png',
      scale: 200
    ),
    'https://musicbird.leanstream.co/JCB078-MP3'
  ),
];