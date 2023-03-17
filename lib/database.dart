import 'package:flutter/material.dart';

class Song{
  final String name;
  final String singer;
  final String image;
  final int duration;
  final Color color;
  final String audioURL;

  Song(
      {
      required this.name,
      required this.singer,
      required this.image,
      required this.duration,
      required this.color,
      required this.audioURL,
      });
}

List<Song> mostpopular=[
  Song(
      name:"kill bill",
      image:"images/sza.jpg",
      singer:"SZA",
      duration:300,
      color:Colors.grey,
      audioURL: 'asset/killbill.mp3'
  ),

  Song(
      name:"after hours",
      image:"images/weeknd.jpg",
      singer:"The Weeknd",
      duration:300,
      color:Colors.grey,
      audioURL: 'asset/afterhours.mp3'),

  Song(
      name:"kesariya",
      image:"images/kesariya.jpeg",
      singer:"Taylor Swift",
      duration:300,
      color:Colors.grey,
      audioURL: 'asset/kesariya.mp3'),

  Song(
    name:"lucid dreams",
    image:"images/juicewrld.jpg",
    singer:"Juice Wrld",
    duration:300,
    color:Colors.grey,
      audioURL: 'asset/luciddreams.mp3'),

];

List<Song>newRelease = [
  Song(
    name:"cooped up",
    image:"images/coopedup.jpg",
    singer:"Post Malone",
    duration:300,
    color:Colors.grey,
      audioURL: 'asset/coopedup.mp3'),

  Song(
    name:"die for you",
    image:"images/dieforyou.jpg",
    singer:"The Weeknd",
    duration:300,
    color:Colors.grey,
      audioURL: 'asset/dieforyou.mp3'),

  Song(
    name:"apna bana le",
    image:"images/apna.jpeg",
    singer:"Arijit Singh",
    duration:300,
    color:Colors.grey,
      audioURL: 'asset/apnabnale.mp3'),

  Song(
    name:"ranjha",
    image:"images/ranjha.jpg",
    singer:"B Praak",
    duration:300,
    color:Colors.grey,
      audioURL: 'asset/ranjha.mp3'),
];