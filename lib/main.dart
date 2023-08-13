import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_pay/bloc/pay_bloc/pay_bloc.dart';
import 'package:google_pay/bloc/upi_pin_bloc/bloc/upi_pin_bloc.dart';
import 'package:google_pay/data/data_provider.dart';
import 'package:google_pay/view/page/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayBloc>(
          create: (BuildContext context) => PayBloc(
            payer: DataProvider().getPayer(),
            payee: DataProvider().getPayee(),
          ),
        ),
        BlocProvider<UpiPinBloc>(
          create: (BuildContext context) => UpiPinBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
