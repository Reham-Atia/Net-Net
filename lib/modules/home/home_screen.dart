import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin
{
  AnimationController _animationContainer;
  String _url = 'http://www.netatnet-eg.com/netatnetsystem/portal/login.php';

  @override
  void initState() {
    super.initState();
    _animationContainer = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 50),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() { setState(() {});});
  }

  @override
  Widget build(BuildContext context)
  {
    double scale = 1+ _animationContainer.value;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/net&net.png'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTapDown: OnTapDown,
                onTapUp: OnTapUp,
                onTapCancel: OnTapCancel,
                child: Transform.scale(
                  scale: scale,
                  child: InkWell(
                    onTap: _launchURL,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0,),
                      ),
                      child: Text(
                        'Click Here',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  OnTapDown(TapDownDetails details){
    _animationContainer.forward();
  }
  OnTapUp(TapUpDetails details){
    _animationContainer.reverse();
  }
  OnTapCancel(){
    _animationContainer.reverse();
  }
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
