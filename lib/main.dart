import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Myapp(),
    debugShowCheckedModeBanner: false,
  )
);

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLAMES_CALCULATOR"),backgroundColor: Colors.pinkAccent,
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _yourname = TextEditingController();
  final TextEditingController _crushname = TextEditingController();



  var _flames = "";


  @override
  Widget build(BuildContext context) {

    String name = _yourname.text.toLowerCase();
    String crush = _crushname.text.toLowerCase();
    String solumate = _crushname.text;
    int s1= _yourname.text.length;
    int s2= _crushname.text.length;
    int common = 0;
    int remain = 0;
    int total = s1+s2;

    void flames(){

      var match = ['s','e','f','e','f','m','e','a','e','l','m','a','a','f','m','f','a','f','c','e','f','e','f','e','e','m','s','a','s','a','m','f','m','f','a','l','l','s','l','s','l','e','s'];
      for(int i=0;i<s1;i++)
      {
        for(int j=0;j<s2;j++)
        {
            if(name.codeUnitAt(i) == crush.codeUnitAt(j))
            {
              common = common + 2;
              break;
            }
        }
      }
      remain = total - common;
      setState(() {
        if(remain==0)
          {
            _flames="No match Between you and $solumate";
          }
        if(match[remain-1]=='f')
        {
          _flames = "$solumate will be your FRIEND";
        }
        if(match[remain-1]=='l')
        {
          _flames = "$solumate will be your LOVER";
        }
        if(match[remain-1]=='a')
        {
          _flames = "$solumate will be AFFICTION with you";
        }
        if(match[remain-1]=='m')
        {
          _flames = "$solumate will MARRY you";
        }
        if(match[remain-1]=='e')
        {
          _flames = "$solumate will be your ENEMY";
        }
        if(match[remain-1]=='s')
        {
          _flames = "$solumate will be your SISTER";
        }
      });
      print(_flames);
      print(remain);
      print(match[remain-1]);
    }


    return MaterialApp(
      home: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 150, 200, 20),
            child: TextField(
              controller: _yourname,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3,color: Colors.pinkAccent)
                ),
                labelText: "your name",
                labelStyle: TextStyle(color: Colors.pink),
                hintText: "Enter Your Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 20, 200, 90),
            child: TextField(
              controller: _crushname,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3,color: Colors.pinkAccent),
                ),
                labelText: "Crush name",
                labelStyle: TextStyle(color: Colors.pink),
                hintText: "Enter Your Crush Name",
              ),
            ),
          ),
          OutlinedButton(
              onPressed: flames,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text("Matching",style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text(_flames,style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.red,
              fontSize: 40,
            ),),
          ),
        ],
      ),
    );
  }

}

