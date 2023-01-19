import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
	  title: const Text('Popover Floating Menu')
	),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Button(),
          ),
        ),
      ),
    );
  }
}

// centered button that triggers the popover
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () { 
                showPopover(
                context: context,
                bodyBuilder: (context) => const BuildPopover(),
                onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.bottom,
                width: 300,
                height: 200,
                arrowHeight: 15,
                arrowWidth: 30,
                );
            },
            child: Text('Click Me'),
        ),
      ],
    );
  }
}

class BuildPopover extends StatelessWidget {
  const BuildPopover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Container(
              margin: const EdgeInsets.only(top:10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      fixedSize: const Size.fromHeight(50),
                  ),
                  onPressed:() {
                    Navigator.of(context)
                    ..pop()
                    ..push(
                        MaterialPageRoute<SecondRoute>(
                        builder: (context) => SecondRoute(),
                        ),
                    );
                  }, 
                  child: const Text('First button')
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade200,
                      fixedSize: const Size.fromHeight(50),
                  ),
                  onPressed:() {}, 
                  child: const Text('Second button')
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      fixedSize: const Size.fromHeight(50),
                  ),
                  onPressed:() {
                     Navigator.of(context).pop();
                  }, 
                  child: const Text('Third button')
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}