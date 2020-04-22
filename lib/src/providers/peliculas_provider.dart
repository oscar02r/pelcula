
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';


class PeliculasProvider{
   String _apikey    = '7ccaf089b4b6f00be4cbdd7c168060c9';
   String _url       = 'api.themoviedb.org';
   String _language  = 'es-ES';

   Future <List<Pelicula>> getEnCines() async{
         final url = Uri.https(_url,'3/movie/now_playing',{
           'laguage' : _language,
           'api_key' : _apikey 

         } );
        
        final resp = await http.get(url);
        final decodedData = json.decode(resp.body);
        final peliculas = new Peliculas.fromJsonList(decodedData['results']);
       
         return peliculas.items;
   }

}