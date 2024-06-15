import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'service_edit_form_model.dart';
export 'service_edit_form_model.dart';

class ServiceEditFormWidget extends StatefulWidget {
  const ServiceEditFormWidget({
    super.key,
    this.title,
    this.description,
    this.image,
    this.price,
    this.location,
    required this.isnew,
  });

  final String? title;
  final String? description;
  final String? image;
  final double? price;
  final String? location;
  final bool? isnew;

  @override
  State<ServiceEditFormWidget> createState() => _ServiceEditFormWidgetState();
}

class _ServiceEditFormWidgetState extends State<ServiceEditFormWidget>
    with TickerProviderStateMixin {
  late ServiceEditFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceEditFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!widget.isnew!) {
        _model.existingData = await queryServiceAllRecordOnce(
          queryBuilder: (serviceAllRecord) => serviceAllRecord.where(
            'seller',
            isEqualTo: currentUserReference,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      } else {
        return;
      }

      setState(() {
        _model.titleTextController?.text = _model.existingData!.title;
        _model.titleTextController?.selection = TextSelection.collapsed(
            offset: _model.titleTextController!.text.length);
      });
      setState(() {
        _model.descriptionTextController?.text =
            _model.existingData!.description;
        _model.descriptionTextController?.selection = TextSelection.collapsed(
            offset: _model.descriptionTextController!.text.length);
      });
      setState(() {
        _model.priceTextController?.text =
            _model.existingData!.price.toString();
        _model.priceTextController?.selection = TextSelection.collapsed(
            offset: _model.priceTextController!.text.length);
      });
      setState(() {
        _model.locationTextController?.text =
            _model.existingData!.serviceLocation;
        _model.locationTextController?.selection = TextSelection.collapsed(
            offset: _model.locationTextController!.text.length);
      });
    });

    _model.titleTextController ??=
        TextEditingController(text: _model.existingData?.title);
    _model.titleFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController(text: () {
      if (widget.description != null && widget.description != '') {
        return widget.description;
      } else if (_model.existingData?.description != null &&
          _model.existingData?.description != '') {
        return _model.existingData?.description;
      } else {
        return '';
      }
    }());
    _model.descriptionFocusNode ??= FocusNode();

    _model.priceTextController ??= TextEditingController(
        text: formatNumber(
      widget.price,
      formatType: FormatType.custom,
      currency: 'Rs.',
      format: '####/hr',
      locale: '',
    ));
    _model.priceFocusNode ??= FocusNode();

    _model.locationTextController ??= TextEditingController(
        text: _model.existingData?.serviceLocation != null &&
                _model.existingData?.serviceLocation != ''
            ? _model.existingData?.serviceLocation
            : '');
    _model.locationFocusNode ??= FocusNode();
    _model.locationFocusNode!.addListener(
      () async {
        _model.displayplacepicker = true;
        setState(() {});
      },
    );
    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 110.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Service Edit',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: 120.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 500.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              () {
                                                if (widget.image != null &&
                                                    widget.image != '') {
                                                  return widget.image;
                                                } else if (_model
                                                            .uploadedFileUrl !=
                                                        null &&
                                                    _model.uploadedFileUrl !=
                                                        '') {
                                                  return _model.uploadedFileUrl;
                                                } else if (_model.existingData
                                                            ?.image !=
                                                        null &&
                                                    _model.existingData
                                                            ?.image !=
                                                        '') {
                                                  return _model
                                                      .existingData?.image;
                                                } else {
                                                  return 'https://picsum.photos/seed/570/600';
                                                }
                                              }(),
                                              'https://picsum.photos/seed/570/600',
                                            ),
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextFormField(
                                    controller: _model.titleTextController,
                                    focusNode: _model.titleFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Title',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 12.0, 16.0, 12.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .titleTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.descriptionTextController,
                                    focusNode: _model.descriptionFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          'Short Description of what is going to do..',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 24.0, 16.0, 12.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: 16,
                                    minLines: 6,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .descriptionTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller: _model.priceTextController,
                                    focusNode: _model.priceFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Price per hours',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 12.0, 16.0, 12.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .priceTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller: _model.locationTextController,
                                    focusNode: _model.locationFocusNode,
                                    autofocus: true,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'location',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 12.0, 16.0, 12.0),
                                      prefixIcon: Icon(
                                        Icons.location_pin,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .locationTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 12.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (widget.isnew!) {
                                    var serviceAllRecordReference =
                                        ServiceAllRecord.collection.doc();
                                    await serviceAllRecordReference
                                        .set(createServiceAllRecordData(
                                      title: _model.titleTextController.text,
                                      price: double.tryParse(
                                          _model.priceTextController.text),
                                      description:
                                          _model.descriptionTextController.text,
                                      image: _model.uploadedFileUrl,
                                      available: true,
                                      category: currentUserDocument?.professon,
                                      seller: currentUserReference,
                                      serviceLocation:
                                          _model.locationTextController.text,
                                      overallRating: 0.0,
                                      noOfSold: 0,
                                      noOfReviews: 0,
                                    ));
                                    _model.creatednewService =
                                        ServiceAllRecord.getDocumentFromData(
                                            createServiceAllRecordData(
                                              title: _model
                                                  .titleTextController.text,
                                              price: double.tryParse(_model
                                                  .priceTextController.text),
                                              description: _model
                                                  .descriptionTextController
                                                  .text,
                                              image: _model.uploadedFileUrl,
                                              available: true,
                                              category: currentUserDocument
                                                  ?.professon,
                                              seller: currentUserReference,
                                              serviceLocation: _model
                                                  .locationTextController.text,
                                              overallRating: 0.0,
                                              noOfSold: 0,
                                              noOfReviews: 0,
                                            ),
                                            serviceAllRecordReference);

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      service:
                                          _model.creatednewService?.reference,
                                    ));
                                  } else {
                                    await _model.existingData!.reference
                                        .update(createServiceAllRecordData(
                                      title: _model.titleTextController.text,
                                      price: double.tryParse(
                                          _model.priceTextController.text),
                                      description:
                                          _model.descriptionTextController.text,
                                      image: _model.uploadedFileUrl != null &&
                                              _model.uploadedFileUrl != ''
                                          ? _model.uploadedFileUrl
                                          : widget.image,
                                      available: true,
                                      serviceLocation:
                                          _model.locationTextController.text,
                                      category: currentUserDocument?.professon,
                                    ));
                                  }

                                  context.pushNamed('seller_home_page');

                                  setState(() {});
                                },
                                text: 'Edit and Publish',
                                icon: Icon(
                                  Icons.receipt_long,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 4.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_model.displayplacepicker)
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController5,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController5',
                                  Duration(milliseconds: 200),
                                  () async {
                                    _model.geoListforward = await MapBoxGroup
                                        .forwareGeoLocationEncordingCall
                                        .call(
                                      location: _model.textController5.text,
                                    );
                                    if ((_model.geoListforward?.succeeded ??
                                        true)) {
                                      _model.listPlaces = true;
                                      setState(() {});
                                    } else {
                                      _model.listPlaces = false;
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Find your Location',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textController5Validator
                                    .asValidator(context),
                              ),
                            ),
                            if (_model.listPlaces)
                              Container(
                                width: double.infinity,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final placesFound = MapBoxGroup
                                                .forwareGeoLocationEncordingCall
                                                .fetures(
                                                  (_model.geoListforward
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                ?.toList() ??
                                            [];
                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            5.0,
                                            0,
                                            0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: placesFound.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, placesFoundIndex) {
                                            final placesFoundItem =
                                                placesFound[placesFoundIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (getJsonField(
                                                      placesFoundItem,
                                                      r'''$.properties.full_address''',
                                                    ) !=
                                                    null) {
                                                  FFAppState()
                                                          .DeviceCurrentLoctationAddress =
                                                      getJsonField(
                                                    placesFoundItem,
                                                    r'''$.properties.full_address''',
                                                  ).toString();
                                                  setState(() {});
                                                } else {
                                                  return;
                                                }

                                                setState(() {
                                                  _model.locationTextController
                                                      ?.text = getJsonField(
                                                    placesFoundItem,
                                                    r'''$.properties.full_address''',
                                                  ).toString();
                                                  _model.locationTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .locationTextController!
                                                              .text
                                                              .length);
                                                });
                                                _model.displayplacepicker =
                                                    false;
                                                setState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    getJsonField(
                                                      placesFoundItem,
                                                      r'''$.properties.full_address''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'listViewOnActionTriggerAnimation']!,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
