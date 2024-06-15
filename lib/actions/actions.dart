import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future issellervarfied(BuildContext context) async {
  SellersRecord? sellerData;

  sellerData = await querySellersRecordOnce(
    parent: currentUserReference,
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (sellerData != null) {
    if (sellerData.verified == true) {
      context.goNamed('seller_home_page');
    } else {
      context.goNamed('Verfication_wait');
    }
  } else {
    context.pushNamed('auth_2_sellerform');
  }
}

Future updateCurrentLocation(BuildContext context) async {
  ApiCallResponse? currentDeviceLocation;
  LatLng currentUserLocationValue =
      await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));

  currentDeviceLocation = await MapBoxGroup.reverseGeoLocationEncodingCall.call(
    longitude: valueOrDefault<double>(
      functions.getlong(currentUserLocationValue),
      0.0,
    ),
    latitude: valueOrDefault<double>(
      functions.getlat(currentUserLocationValue),
      0.0,
    ),
  );
  FFAppState().DeviceCurrentLoctationAddress =
      MapBoxGroup.reverseGeoLocationEncodingCall.fullAddress(
    (currentDeviceLocation.jsonBody ?? ''),
  )!;
  FFAppState().update(() {});
}
