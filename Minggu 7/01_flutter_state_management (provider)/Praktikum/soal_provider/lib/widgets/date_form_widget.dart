import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soal_provider/provider/date_form_provider.dart';

class DateFormWidget extends StatelessWidget {
  final BuildContext context;
  const DateFormWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    final dateFormProvider = Provider.of<DateFormProvider>(context);

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
                dateFormProvider.openDatePicker(context);
              },
            )
          ],
        ),
        Consumer<DateFormProvider>(
          builder: (context, dateConsumer, child) =>
              Text(DateFormat('dd-MM-yyyy').format(dateConsumer.dateValue)),
        ),
      ],
    );
  }
}
