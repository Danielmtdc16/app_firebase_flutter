import 'package:app_firebase_flutter/components/menu.dart';
import 'package:app_firebase_flutter/models/hour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Hour> listHours = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horas V3"),
      ),
      drawer: Menu(
        user: widget.user,
      ),
      body: listHours.isEmpty
          ? const Center(
              child: Text(
                "Nada por aqui\nVamos registrar um dia de trabalho?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.only(left: 4, right: 4),
              children: List.generate(
                listHours.length,
                (index) {
                  Hour model = listHours[index];
                  return Dismissible(
                    key: ValueKey<Hour>(model),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 12),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      remove(model);
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          ListTile(
                            onLongPress: () {},
                            onTap: () {},
                            leading: const Icon(
                              Icons.list_alt_rounded,
                              size: 56,
                            ),
                            title: Text(
                                "Data: ${model.date} hora: ${model.minutes}"),
                            subtitle: Text(model.description!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
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
                    onPressed: () {},
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

  remove(Hour model) {}
}
