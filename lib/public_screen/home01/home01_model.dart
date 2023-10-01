import '/auth/base_auth_user_provider.dart';
import '/auth_screen/no_account/no_account_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_screen/userprofile/userprofile_widget.dart';
import 'dart:ui';
import 'home01_widget.dart' show Home01Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home01Model extends FlutterFlowModel<Home01Widget> {
  ///  Local state fields for this page.

  int defualtValueFilter = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for userprofile component.
  late UserprofileModel userprofileModel;
  // Model for noAccount component.
  late NoAccountModel noAccountModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for listall widget.

  PagingController<DocumentSnapshot?, CarsRecord>? listallPagingController;
  Query? listallPagingQuery;
  List<StreamSubscription?> listallStreamSubscriptions = [];

  // State field(s) for bndaf widget.

  PagingController<DocumentSnapshot?, CarsRecord>? bndafPagingController;
  Query? bndafPagingQuery;
  List<StreamSubscription?> bndafStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userprofileModel = createModel(context, () => UserprofileModel());
    noAccountModel = createModel(context, () => NoAccountModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userprofileModel.dispose();
    noAccountModel.dispose();
    listallStreamSubscriptions.forEach((s) => s?.cancel());
    listallPagingController?.dispose();

    bndafStreamSubscriptions.forEach((s) => s?.cancel());
    bndafPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, CarsRecord> setListallController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listallPagingController ??= _createListallController(query, parent);
    if (listallPagingQuery != query) {
      listallPagingQuery = query;
      listallPagingController?.refresh();
    }
    return listallPagingController!;
  }

  PagingController<DocumentSnapshot?, CarsRecord> _createListallController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CarsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCarsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listallStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, CarsRecord> setBndafController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    bndafPagingController ??= _createBndafController(query, parent);
    if (bndafPagingQuery != query) {
      bndafPagingQuery = query;
      bndafPagingController?.refresh();
    }
    return bndafPagingController!;
  }

  PagingController<DocumentSnapshot?, CarsRecord> _createBndafController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CarsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCarsRecordPage(
          queryBuilder: (_) => bndafPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: bndafStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
