import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

void showSnackBar(BuildContext context, String text){

  SnackBar snackBar=SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontSize: 30),
    ),
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
          ),
        ),
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      color:  Colors.black12,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'This News App is inspired by the principle of free'
                ' Journalism. You can select ',
            style: const TextStyle(
              color:  Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children:[
              TextSpan(
                text: 'Local',
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap=()=> showSnackBar(context, "Local"),
              ),
              TextSpan(
                text: ' to ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap=()=> showSnackBar(context, ' to '),
              ),
              TextSpan(
                text: 'Global,',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap=()=> showSnackBar(context, 'Global,',),
              ),
              const TextSpan(
                text: ' news, and not only that, you can take part as a'
                    ' Citizen Journalist to publish your story.',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
