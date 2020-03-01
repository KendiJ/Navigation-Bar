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
            Colors.teal,
            Colors.teal.shade900,
            ]
        )),),
      )
      
    ),

  ]);
}

class NavBarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw/12, 0, sw/12, 2*sh/5, 2*sw/12, 2*sh/5,);
    path.cubicTo(3*sw/12, 2*sh/5, 3*sw/12, 0, 4*sw/12, 0);

    
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}