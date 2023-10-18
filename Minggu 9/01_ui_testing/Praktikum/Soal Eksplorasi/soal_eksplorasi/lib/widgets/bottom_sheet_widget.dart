import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final String imageAdress;

  const BottomSheetWidget({required this.imageAdress, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: Column(
        children: [
          const SizedBox(height: 32),
          SizedBox(
              height: 250,
              width: 350,
              child: Image.asset(imageAdress, fit: BoxFit.fill)),
          const SizedBox(height: 12),
          const Text('Do you want to see this image details?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-gallery',
                        arguments: imageAdress);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
            ],
          )
        ],
      ),
    );
  }
}
