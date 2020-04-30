import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
 
  CardSwiper({ @required this.peliculas });
  
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
       padding: EdgeInsets.only(top: 10.0),
       child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        
        itemBuilder: (BuildContext context,int index){

        peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';

        return Hero(
               tag: peliculas[index].uniqueId,
                  child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
            child:_imageTarjeta( context, peliculas[index])
            ),
        );
        
        },
        itemCount: peliculas.length,
        //pagination: new SwiperPagination(),
       // control: SwiperControl(),
      ),
    );
    
  }

  Widget _imageTarjeta(BuildContext context ,Pelicula pelicula){
        return GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('detalle',arguments: pelicula);
                },
                  child:  FadeInImage(
                            placeholder: AssetImage('assets/img/loading.gif') ,
                            image:NetworkImage(pelicula.getPosterImg()),
              fit: BoxFit.cover,
              ),
        );
  }
}