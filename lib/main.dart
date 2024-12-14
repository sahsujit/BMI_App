import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result ="";
  var bgColor = Colors.indigo.shade200;

  
  @override
  Widget build(BuildContext context) {
    
    
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.blue ,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // color: bgColor,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
             Color(0xfff6d365),Color(0xfffda085)
          ],
          center: Alignment.topLeft
          )

          // gradient: LinearGradient(colors: [
          //   Color(0xfff6d365),Color(0xfffda085)
          // ],
          // begin: FractionalOffset(0.1,1.0)
          // )
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700
                ),),
            
                SizedBox(height: 21,),
            
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight (in kgs)"),
                    prefixIcon: Icon(Icons.line_weight),
                    
                  ),
                  keyboardType: TextInputType.number,
                ),
            
                SizedBox(height: 11,),
            
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height (in feet)"),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
            
                SizedBox(height: 11,),
            
                 TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height (in inch)"),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
        
                SizedBox(height: 16,),
        
                ElevatedButton(onPressed: (){
        
                  var wtC = wtController.text.toString();
                  var ftC = ftController.text.toString();
                  var inch = inController.text.toString();
        
                
        
                  if(wtC != "" && ftC != "" && inch !="" ){
        
                  var iwt = int.parse(wtC);
                  var ift = int.parse(ftC);
                  var iInch = int.parse(inch);
        
                  var tInch = (ift*12) +iInch;
                  var tcm = tInch * 2.54 ;
        
                  var tm = tcm/100;
                  var bmi = iwt/(tm*tm);


                var msg ="";

                  if(bmi>25){
                    msg="You're OverWeight";
                    bgColor=Colors.orange.shade300;
                  }else if(bmi<18){
                    msg="You're UnderWeight";
                    bgColor=Colors.red.shade300;
                  }
                  else{
                    msg="You're Normal Weight";
                    bgColor=Colors.green.shade300;
                  }
        
                
        
                  setState(() {
                      result = "$msg , \n Your bmi is :${bmi.toStringAsFixed(2)}";
                  });
        
                  }
                  else{
                    setState(() {
                       result="Please fill all the required field";
                    });
                   
                  }
        
        
        
                }, child: Text("Calculate"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                ),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
