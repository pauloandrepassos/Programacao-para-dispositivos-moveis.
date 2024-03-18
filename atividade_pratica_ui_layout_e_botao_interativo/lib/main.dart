import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro de times",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.blue[900]),
        textTheme: Typography.material2018().white,
      ),
      home: CadastroTime(),
    );
  }
}

class CadastroTime extends StatefulWidget {
  @override
  _CadastroTimeState createState() => _CadastroTimeState();
}

class _CadastroTimeState extends State<CadastroTime> {
  TextEditingController timeController = TextEditingController();
  List<String> timesCadastrados = [];
  String timeCadastrado = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 2,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Cadastre seu time:"),
              SizedBox(height: 10,),
              TextField(
                controller: timeController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nome do Time',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Cor da borda quando o campo não está focado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Cor da borda quando o campo está focado
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timeController.clear();
                      });
                      print('Botão LIMPAR pressionado');
                    },
                    child: Text('LIMPAR'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timesCadastrados.add(timeController.text);
                        timeController.clear();
                      });
                      print('Botão CADASTRAR pressionado');
                    },
                    child: Text('CADASTRAR'),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Image.asset('assets/images/image.png', height: 200,),
              SizedBox(height: 20,),
              Container(
                color: Colors.blue[900],
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Times', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('')),
                  ],
                  rows: timesCadastrados.map((time) => DataRow(
                    cells: [
                      DataCell(Text(time, style: TextStyle(color: Colors.white))),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            setState(() {
                              timesCadastrados.remove(time);
                            });
                            print('Botão DELETAR pressionado para $time');
                          },
                          icon: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    ],
                  )).toList(),
                ),
              ),
            ],

          ),
        )
      ),
    );
  }
}
