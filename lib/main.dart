import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=> HomeScreen(),
      },
    );
  }
}






class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Custom BottomNavigationBar"),
        ),
        bottomNavigationBar: _bottomNavBar(context));
  }
}

Widget _bottomNavBar(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: NavBarClipper(),
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: _boxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),
                Text("Favorite",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),
                Text("Search",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 45,
        width: MediaQuery.of(context).size.width,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home),
              SizedBox(width: 0,),
              _buildNavItem(Icons.favorite),
              SizedBox(width: 0,),
              _buildNavItem(Icons.search),
            ]
        ),
      )
    ],
  );
}

_boxDecoration(){
  return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromARGB(255, 182,212,231) , Color.fromARGB(255, 19,113,178)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )
  );
}

_buildNavItem(IconData icon){
  return CircleAvatar(
    radius: 30,
    backgroundColor: Color.fromARGB(255, 19,113,178),
    child: CircleAvatar(
      radius: 28,
      backgroundColor: Color.fromARGB(255, 182,212,231),
      child: Icon(icon,color: Colors.blue.shade800,size: 35,),
    ),
  );
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);

    path.cubicTo(5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);

    path.cubicTo(9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, 12 * sw / 12, 0);

    path.cubicTo(13 * sw / 12, 0, 13 * sw / 12, 2* sh /5, 14 * sw / 12, 2* sh / 5);
    path.cubicTo(15 * sw / 12, 2 * sh / 5, 12 * sw / 12, 0,sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
