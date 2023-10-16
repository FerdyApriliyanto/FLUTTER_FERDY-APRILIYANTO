import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:praktikum/screens/dicebear/dicebear_view_model.dart';
import 'package:praktikum/widgets/button_widget.dart';
import 'package:praktikum/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class DiceBearScreen extends StatelessWidget {
  const DiceBearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dicebearProviderListening = Provider.of<DiceBearViewModel>(context);
    final dicebearProviderNotListening =
        Provider.of<DiceBearViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Generator'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<DiceBearViewModel>(
                    builder: (context, dicebearProvider, child) =>
                        dicebearProvider.imageGenerated.isEmpty
                            ? Image.network(
                                'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                                width: 200,
                                height: 200,
                              )
                            : SvgPicture.string(
                                dicebearProvider.imageGenerated,
                                width: 200,
                                height: 200,
                              )),
                const SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                    label: 'Image Style',
                    controller: dicebearProviderNotListening.styleController),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    label: 'Name',
                    controller: dicebearProviderNotListening.seedController),
                const SizedBox(
                  height: 20,
                ),
                dicebearProviderListening.isLoading
                    ? const CircularProgressIndicator()
                    : ButtonWidget(
                        onPressed: () {
                          dicebearProviderNotListening.generateImage();
                        },
                        label: 'GENERATE'),
                const SizedBox(
                  height: 40,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/contact');
                      },
                      label: 'Go to Contact Screen'),
                  const SizedBox(
                    width: 6,
                  ),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/put-request');
                      },
                      label: 'Go to PUT Screen'),
                ]),
              ],
            ),
          ),
        ));
  }
}
