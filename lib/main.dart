import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomBottomBar(),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _getNavBar(context),
    );
  }
}

_getNavBar(context){
  return Stack(children: <Widget>[
    Positioned(
      bottom: 0,
      child: ClipPath(
        clipper: NavBarClipper(),
        child: Container(height: 60.0, 
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.teal.shade900,
            ]
        )),),
      )
      
    ),
    Positioned(
      bottom: 45.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildNativeItem(Icons.brightness_3, false),
          SizedBox(width: 1),
          _buildNativeItem(Icons.landscape, true),
          SizedBox(width: 1),
          _buildNativeItem(Icons.wb_sunny, false),
          SizedBox(width: 1),
        ]
      ),
    ),
    Positioned(
      bottom: 10,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Sleep', style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight:FontWeight.w800)),
          SizedBox(width: 1,),
          Text('Relax', style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight:FontWeight.w800)),
          SizedBox(width: 1,),
          Text('Be happy', style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight:FontWeight.w800)),
          SizedBox(width: 1,),
        ],)
    )
  ]
  );
}
_buildNativeItem(IconData icon, bool active){
  return CircleAvatar(
    radius: 30,
    backgroundColor: Colors.teal.shade900,
    child: CircleAvatar(
      radius: 25,
      backgroundColor:active? Colors.white.withOpacity(0.9) : Colors.transparent,
      child: Icon(icon, color: active? Colors.purple: Colors.yellow.withOpacity(0.9)),
    ),
  );
}

class NavBarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw/13, 0, sw/13, 2*sh/5, 2*sw/13, 2*sh/5,);
    path.cubicTo(3*sw/13, 2*sh/5, 3*sw/13, 0, 4*sw/13, 0);
    path.cubicTo(5*sw/13, 0, 5*sw/13, 2*sh/5, 6*sw/13, 2*sh/5);
    path.cubicTo(7*sw/13, 2*sh/5, 7*sw/13, 0, 8*sw/13, 0);
    path.cubicTo(9*sw/13, 0, 9*sw/13, 2*sh/5, 10*sw/13, 2*sh/5);
    path.cubicTo(13*sw/13, 2*sh/5, 13*sw/13, 0, 12*sw/13, 0);
    path.cubicTo(15*sw/13, 0, 15*sw/13, 2*sh/5, 14*sw/13, 2*sh/5);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}