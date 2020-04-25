import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';


class PeliculasProvider{
  
   String _apikey    = '7ccaf089b4b6f00be4cbdd7c168060c9';
   String _url       = 'api.themoviedb.org';
   String _language  = 'es-ES';
   
   int _popularesPage = 0;

   List<Pelicula> _populares = new List();

   final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();
   bool _cargando = false;
   
  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get populdaresStream => _popularesStreamController.stream;

  void disposeStreiterableams(){
    _popularesStreamController?.close();
  } 
   
   Future<List<Pelicula>> _procesarRespuesta( Uri url) async {

        final resp = await http.get(url);
        final decodedData = json.decode(resp.body);
        final peliculas = new Peliculas.fromJsonList(decodedData['results']);
       
         return peliculas.items;
   }

   Future <List<Pelicula>> getEnCines() async{
         final url = Uri.https(_url,'3/movie/now_playing',{
           'laguage' : _language,
           'api_key' : _apikey 

         } );
        
        return await _procesarRespuesta(url);
   }

   Future<List<Pelicula>> getPolular() async {
     if(_cargando) return [];
     _cargando = true;
     _popularesPage++;

     final url = Uri.https(_url, '3/movie/popular', {
       'api_key'  : _apikey,
       'language' : _language,
       'page'     : _popularesPage.toString()
     });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink( _populares );
    _cargando = false;
    return resp;
   }

}