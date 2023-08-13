import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/upi_pin_bloc/bloc/upi_pin_bloc.dart';
import '../../../utils/navigation_transition.dart';
import '../../widgets/custom_button.dart';
import '../pay_page/pay_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<int> selectedOption = ValueNotifier(4);
  late UpiPinBloc upiPinBloc;

  @override
  void initState() {
    upiPinBloc = BlocProvider.of<UpiPinBloc>(context);
    // upiPinBloc.numberOfPins = selectedOption.value;
    selectedOption.value = upiPinBloc.numberOfPins;
    super.initState();
  }

  void onChanged(int? option) {
    selectedOption.value = option!;
    upiPinBloc.numberOfPins = option;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose length of UPI pin",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: selectedOption,
              builder: (context, val, _) {
                return Row(
                  children: [
                    Expanded(
                      child: RadioListTile<int>(
                        title: const Text('4'),
                        value: 4,
                        groupValue: val,
                        onChanged: onChanged,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<int>(
                        title: const Text('5'),
                        value: 5,
                        groupValue: val,
                        onChanged: onChanged,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<int>(
                        title: const Text('6'),
                        value: 6,
                        groupValue: val,
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            CustomButton(
                text: "Start",
                onTap: () {
                  Navigator.push(context, FadeRoute(page: const PayScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
