import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Username=TextEditingController();
  final Password=TextEditingController();
  final focusNode=FocusNode();

  var orientation;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent
      ),
        home: gridorientation(),
    );
  }


}

class gridorientation extends StatefulWidget {
  // gridorientation(this.orientation);
  @override
  _gridorientationState createState() => _gridorientationState();
}

class _gridorientationState extends State<gridorientation> {
  final Username=TextEditingController();

  final Password=TextEditingController();

  final focusNode=FocusNode();

  bool orientation;

  var screenheight;

  @override
  Widget build(BuildContext context) {
    orientation=MediaQuery.of(context).orientation==Orientation.portrait?true:false;
    screenheight=MediaQuery.of(context).size.height;

    return orientation?Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Beautiful UI"),
      ),
      body: Container(
        height: screenheight,
        color: Colors.green,
        margin: EdgeInsets.all(10),
        child: maincontent(),
      ),
    ):Scaffold(
        body:SafeArea(child:
          Container(
            height: screenheight,

            color: Colors.green,
            // padding: EdgeInsets.all(10),
          // margin: EdgeInsets.all(10),
            child: maincontent(),
    )));
  }
}

class maincontent extends StatefulWidget {
  @override
  _maincontentState createState() => _maincontentState();
}

class _maincontentState extends State<maincontent> with SingleTickerProviderStateMixin{
  final Username=TextEditingController();
  final Password=TextEditingController();
  bool orientation;
  FocusNode _focusNode=new FocusNode();
  Animation _animation;
  AnimationController _animationController;
  double textanimeheight ;

  @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this ,duration: Duration(seconds: 3));
    _animation=Tween(begin: 300,end:20).animate(_animationController)
    ..addListener(() {
      setState(() {});
    });

    textanimeheight=_animation.value;



    _focusNode.addListener(() {
      if(_focusNode.hasFocus){
        _animationController.forward();
      }
      else _animationController.reverse();
    });
  }




  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(

      builder: (context,orientation){
        return GridView.count(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          // crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: orientation==Orientation.portrait?1:2,
          childAspectRatio: 5/1,
          children: [
            Container(
              height:textanimeheight,
              padding: EdgeInsets.all(10),
              child: TextField(
                focusNode: _focusNode,
                controller: Username,
                decoration: InputDecoration(
                  hintText: 'UserName',
                  // hintStyle: TextStyle(color: Colors.greenAccent),
                ),
              ),
            ),
            // SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: Password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(onPressed: (){},
                child: Text("Login"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(onPressed: (){},
                child: Text("Sign Up"),
              ),
            )
          ],

        );
      },
    );
  }
}


class column extends StatelessWidget {
  final Username=TextEditingController();
  final Password=TextEditingController();
  final focusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            // focusNode: FocusNode,
            controller: Username,
            decoration: InputDecoration(
              hintText: 'UserName',
              // hintStyle: TextStyle(color: Colors.greenAccent),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: Password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
        ]
    );
  }
}

