import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_swiper_widget.dart';

class Homepage extends StatelessWidget {
  
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
        children: <Widget>[
          _swiperTarjetas(),
        ],
      ),
    );
  }

  Widget _swiperTarjetas() {
        return CardSwiper( peliculas:[1,2,3,4,5]);
  }

  
}