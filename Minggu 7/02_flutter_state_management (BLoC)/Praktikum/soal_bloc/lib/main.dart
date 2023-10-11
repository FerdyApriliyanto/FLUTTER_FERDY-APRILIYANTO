import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/color_picker/color_picker_bloc.dart';
import 'package:soal_bloc/bloc/crud_contact/crud_contact_bloc.dart';
import 'package:soal_bloc/bloc/date_picker/date_picker_bloc.dart';
import 'package:soal_bloc/bloc/file_picker/file_picker_bloc.dart';
import 'package:soal_bloc/bloc/name_validator/name_validator_bloc.dart';
import 'package:soal_bloc/bloc/phone_validator/phone_validator_bloc.dart';
import 'package:soal_bloc/screens/contact_screen.dart';
import 'package:soal_bloc/screens/detail_gallery_screen.dart';
import 'package:soal_bloc/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameValidatorBloc>(
          create: (context) => NameValidatorBloc(),
        ),
        BlocProvider<PhoneValidatorBloc>(
          create: (context) => PhoneValidatorBloc(),
        ),
        BlocProvider<DatePickerBloc>(
          create: (context) => DatePickerBloc(),
        ),
        BlocProvider<ColorPickerBloc>(
          create: (context) => ColorPickerBloc(),
        ),
        BlocProvider<FilePickerBloc>(
          create: (context) => FilePickerBloc(),
        ),
        BlocProvider<CrudContactBloc>(
          create: (context) => CrudContactBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Soal BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => ContactScreen(),
          '/gallery': (_) => const GalleryScreen(),
          '/detail-gallery': (_) => const DetailGalleryScreen()
        },
      ),
    );
  }
}
