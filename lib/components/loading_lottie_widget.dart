import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'loading_lottie_model.dart';
export 'loading_lottie_model.dart';

class LoadingLottieWidget extends StatefulWidget {
  const LoadingLottieWidget({super.key});

  @override
  State<LoadingLottieWidget> createState() => _LoadingLottieWidgetState();
}

class _LoadingLottieWidgetState extends State<LoadingLottieWidget> {
  late LoadingLottieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingLottieModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      'https://lottie.host/523c8884-4a21-4912-9f11-076b4d1372cc/t3hPEcaKdB.json',
      width: 150.0,
      height: 130.0,
      fit: BoxFit.cover,
      animate: true,
    );
  }
}
