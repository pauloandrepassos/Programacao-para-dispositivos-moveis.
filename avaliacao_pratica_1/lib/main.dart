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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController filmecontroller = TextEditingController();
  String filmeCadastrado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("FILMES"),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/image.png'),
                Text('Cadastre seu filme'),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: filmecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Título', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          filmecontroller.clear();
                          filmeCadastrado = "";
                        });
                        print('Botão LIMPAR pressionado');
                      },
                      child: Text('LIMPAR'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          filmeCadastrado = filmecontroller.text;
                        });
                        print('Botão CADASTRAR pressionado');
                      },
                      child: Text('CADASTRAR'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(filmeCadastrado),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
