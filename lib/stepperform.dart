import 'package:flutter/material.dart';
import 'package:swiftdynamicstest/widgets.dart';

class StepperForm extends StatefulWidget {
  const StepperForm({Key? key}) : super(key: key);

  @override
  _StepperFormState createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarmenu(context, 'Stepper Form'),
      body: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
