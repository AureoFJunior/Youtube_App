import 'package:flutter/material.dart';
import 'package:youtube/model/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import '../API.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  listarVideos(String pesquisa) {

    Future<List<Video>> videos;

    Api api = new Api();

    return api.pesquisar(pesquisa);

  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: listarVideos(widget.pesquisa),
      // ignore: missing_return
      builder: (context, snapshot){

        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData){
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){

                  List<Video> videos = snapshot.data;
                  Video video = videos[index];


                  return GestureDetector(
                    onTap: (){FlutterYoutube.playYoutubeVideoById(apiKey: CHAVE_YTB_API, videoId: video.id, autoPlay: true, fullScreen: true);},
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage( video.imagem )
                              )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 3,color: Colors.red,),
              );
            }
            else {
              return Center(
                child: Text("Não achamo nada, menó!"),
              );
            }
            break;
        }

      },
    );
  }
}
