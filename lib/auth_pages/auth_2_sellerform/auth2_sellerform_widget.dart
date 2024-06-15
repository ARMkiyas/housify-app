import '/componets/seller_form/seller_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth2_sellerform_model.dart';
export 'auth2_sellerform_model.dart';

class Auth2SellerformWidget extends StatefulWidget {
  const Auth2SellerformWidget({super.key});

  @override
  State<Auth2SellerformWidget> createState() => _Auth2SellerformWidgetState();
}

class _Auth2SellerformWidgetState extends State<Auth2SellerformWidget> {
  late Auth2SellerformModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth2SellerformModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: wrapWithModel(
          model: _model.sellerFormModel,
          updateCallback: () => setState(() {}),
          child: SellerFormWidget(),
        ),
      ),
    );
  }
}
