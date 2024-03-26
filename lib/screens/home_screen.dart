import 'package:app_firebase_flutter/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _listHour = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horas V3"),
      ),
      drawer: Menu(),
      body: _listHour.isEmpty
          ? const Center(
              child: Text(
                "Nada por aqui\nVamos registrar um dia de trabalho?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          : Text(""),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  showFormModal({Hour? model}) {
    String title = "Adicionar";
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    TextEditingController _dateController = TextEditingController();
    final dateMaskFormatter = MaskTextInputFormatter(mask: '##/##/####');
    TextEditingController _minutesController = TextEditingController();
    final minutesMaskFormatter = MaskTextInputFormatter(mask: '##:##');
    TextEditingController _descriptionController = TextEditingController();

    if (model != null) {
      title = "Editando";
      _dateController.text = model.date;
      _minutesController.text = HourHelper.minutesToHours(model.minutes);
      if (model.descricao != null) {
        _descriptionController.text = model.description!;
      }
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      )),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(32),
          child: ListView(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextFormField(
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                decoration:
                    InputDecoration(hintText: '26/03/2024', labelText: 'Data'),
                inputFormatters: [dateMaskFormatter],
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _minutesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: '00:00', labelText: 'Horas Trabalhadas'),
                inputFormatters: [minutesMaskFormatter],
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Lembrete do que você fez',
                  labelText: 'Horas trabalhadas',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                        
                    },
                    child: Text(confirmationButton),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
