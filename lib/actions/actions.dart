import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future<bool?> issellervarfied(BuildContext context) async {
  SellersRecord? sellerData;

  if (currentUserDocument?.seller != null) {
    sellerData =
        await SellersRecord.getDocumentOnce(currentUserDocument!.seller!);
    if (sellerData.verified == true) {
      return true;
    }

    context.goNamed('Verfication_wait');

    return null;
  } else {
    context.goNamed('auth_2_sellerform');

    return null;
  }
}
