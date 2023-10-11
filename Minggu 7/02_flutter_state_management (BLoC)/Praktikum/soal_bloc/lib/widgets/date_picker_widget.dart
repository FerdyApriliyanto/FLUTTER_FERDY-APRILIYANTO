import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soal_bloc/bloc/date_picker/date_picker_bloc.dart';

class DatePickerWidget extends StatelessWidget {
  final BuildContext context;

  const DatePickerWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () {
                context
                    .read<DatePickerBloc>()
                    .add(OpenDatePicker(context: context));
              },
            )
          ],
        ),
        BlocBuilder<DatePickerBloc, DatePickerState>(
          builder: (context, state) {
            if (state is DatePickerSelected) {
              return Text(DateFormat('dd-MM-yyyy').format(state.selectedDate));
            } else {
              return Text(DateFormat('dd-MM-yyyy').format(DateTime.now()));
            }
          },
        ),
      ],
    );
  }
}
