import 'package:flutter/material.dart';
import 'package:soal_openai/screens/home/home_view_model.dart';
import 'package:soal_openai/screens/home/widgets/textfield_widget.dart';
import 'package:soal_openai/screens/result/result_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Phone Recommendations',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: Column(
            children: [
              TextFieldWidget(
                controller: homeViewModel.budgetController,
                label: 'Budget',
                onChanged: (_) {
                  homeViewModel.validateTextField();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                controller: homeViewModel.cameraController,
                label: 'Camera (MP)',
                onChanged: (_) {
                  homeViewModel.validateTextField();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                controller: homeViewModel.internalStorageController,
                label: 'Internal Storage (GB)',
                onChanged: (_) {
                  homeViewModel.validateTextField();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<HomeViewModel>(
                builder: (context, value, child) => ElevatedButton(
                    onPressed: value.isValidated
                        ? () async {
                            final result =
                                await homeViewModel.getPhoneReccomendation();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResultScreen(data: result)));
                          }
                        : null,
                    child: value.isLoading
                        ? Container(
                            padding: const EdgeInsets.all(16),
                            width: 50,
                            height: 50,
                            child: const CircularProgressIndicator())
                        : const Text('Get Recommendation')),
              ),
            ],
          ),
        ));
  }
}
