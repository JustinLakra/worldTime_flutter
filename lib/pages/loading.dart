import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  //const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void setupWorldTime() async {
    WorldTime ob = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await ob.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : ob.location,
      'flag': ob.flag,
      'time': ob.time,
      'isDayTime' : ob.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child:  SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
