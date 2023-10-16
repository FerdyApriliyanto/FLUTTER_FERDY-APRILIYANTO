import 'package:flutter/material.dart';
import 'package:praktikum/screens/put_request/put_request_view_model.dart';
import 'package:praktikum/widgets/button_widget.dart';
import 'package:praktikum/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class PutRequestScreen extends StatelessWidget {
  const PutRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final putRequestProviderNotListening =
        Provider.of<PutRequestViewmodel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('PUT Request'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'ID',
                  controller: putRequestProviderNotListening.idController),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'Title',
                  controller: putRequestProviderNotListening.titleController),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'Body',
                  controller: putRequestProviderNotListening.bodyController),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'User ID',
                  controller: putRequestProviderNotListening.userIdController),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  onPressed: () {
                    putRequestProviderNotListening.updateData();
                    showDialog(
                        context: context,
                        builder: (context) => Consumer<PutRequestViewmodel>(
                              builder: (context, value, child) => AlertDialog(
                                  title: const Text('Update Data'),
                                  content: value.status == '200'
                                      ? const Text('Data Updated Successfully!')
                                      : const Text('Sending data...')),
                            ));
                  },
                  label: 'PUT Update Data 1'),
            ],
          ),
        ));
  }
}
