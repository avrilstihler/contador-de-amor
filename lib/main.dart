import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amor ao Gato',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dê Amor ao Seu Gato!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _loveCounter = 0;

  // Incrementa o contador de amor
  void _incrementLove(int increment) {
    setState(() {
      _loveCounter += increment;
    });
  }

  // Reseta o contador de amor
  void _resetLove() {
    setState(() {
      _loveCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 207, 214),
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal, 
              color: Colors.black, 
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Reiniciar Amor') {
                _resetLove();
              } else if (value == 'Dar +1 Amor') {
                _incrementLove(1);
              } else if (value == 'Dar +5 Amor') {
                _incrementLove(5);
              } else if (value == 'Dar +10 Amor') {
                _incrementLove(10);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'Reiniciar Amor',
                  child: Text('Reiniciar Amor'),
                ),
                const PopupMenuItem(
                  value: 'Dar +1 Amor',
                  child: Text('Dar +1 Amor'),
                ),
                const PopupMenuItem(
                  value: 'Dar +5 Amor',
                  child: Text('Dar +5 Amor'),
                ),
                const PopupMenuItem(
                  value: 'Dar +10 Amor',
                  child: Text('Dar +10 Amor'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.pets,
              size: 80,
              color: Colors.pink,
            ),
            const SizedBox(height: 20),
            const Text(
              'Você deu amor ao gato este número de vezes:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_loveCounter ❤️',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.pink,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementLove(1),
        tooltip: 'Dar Amor',
        backgroundColor: Colors.pink,
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }
}
