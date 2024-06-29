import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'housify_model.dart';
export 'housify_model.dart';

class HousifyWidget extends StatefulWidget {
  const HousifyWidget({super.key});

  @override
  State<HousifyWidget> createState() => _HousifyWidgetState();
}

class _HousifyWidgetState extends State<HousifyWidget> {
  late HousifyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HousifyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
