import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/video.dart';


const CHAVE_YTB_API = "AIzaSyCo5fTPR3qwxMNgiu64s_UhlfMqePzpm84";
const ID_CANAL = "UCdm1fwk5iqteE0MVOBUuE8Q";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {


  Future<List<Video>> pesquisar(String pesquisa) async{

  http.Response response = await http.get(
    URL_BASE + "search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$CHAVE_YTB_API"
        "&q=$pesquisa"
        //"&channelId=$ID_CANAL"

  );

  if (response.statusCode == 200){

    Map<String, dynamic> dados = json.decode(response.body);

    List<Video> videos = dados["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
    ).toList();

    return videos;

    print(response.body);

  }else {

  }


  }
}