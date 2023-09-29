import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_12/widgets/bottom_sheet_widget.dart';
import 'package:soal_12/widgets/drawer_widget.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<String> imageList = const [
    'assets/dart-logo.png',
    'assets/firebase-logo.png',
    'assets/flutter-logo.png',
    'assets/flutter-logo-1.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text('Image List', style: GoogleFonts.poppins(fontSize: 20)),
                const SizedBox(height: 12),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: 4,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => BottomSheetWidget(
                                    imageAdress: imageList[index]));
                          },
                          child: Container(
                              color: Colors.red,
                              child: Image.asset(imageList[index],
                                  fit: BoxFit.fill)),
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
