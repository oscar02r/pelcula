import 'package:flutter/material.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class Homepage extends StatelessWidget {
  
  final peliculasProvider = new PeliculasProvider();  
  
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(title: Text('Home page'),
      backgroundColor: Colors.indigoAccent,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
           onPressed: null)
      ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _swiperTarjetas(),
          _footer(context)
        ],
      )
    );
  }

  Widget _swiperTarjetas() {
      
     return   FutureBuilder(
          future: peliculasProvider.getEnCines(),
          builder: (BuildContext context, AsyncSnapshot <List> snapshot) {
            
            if (snapshot.hasData) {
              
            return CardSwiper( 
              peliculas: snapshot.data
            );

            }else{
              return Container(
                     height: 400.0,
                child: Center(
                  child: CircularProgressIndicator()),
              );
            }
          },
        );
      
         
  }

 Widget _footer(BuildContext context) {

        return Container(
          width: double.infinity,
          child:Column(
            children: <Widget>[
              Text('Populares', style:Theme.of(context).textTheme.subhead),

              FutureBuilder(
                future: peliculasProvider.getPolular(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //snapshot.data?.forEach( (p) => print(p.title) );
                  return Text('sata');
                },
              ),
            ],
          )
        );
 }

}