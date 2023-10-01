import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  String serchkey = '0';

  String? modelA = '';

  String? modelB = '';

  bool changeListnormal = false;

  bool changlistAlgolia = false;

  String? brandName = '0';

  Color brandcontinarBorder = const Color(0xFF0C0B0B);

  bool brandSelected = false;

  bool brandListed = false;

  DocumentReference? brandRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, BrandRecord>? gridViewPagingController;
  Query? gridViewPagingQuery;
  List<StreamSubscription?> gridViewStreamSubscriptions = [];

  // State field(s) for modela widget.
  String? modelaValue;
  FormFieldController<String>? modelaValueController;
  // State field(s) for priceBB widget.
  TextEditingController? priceBBController;
  String? Function(BuildContext, String?)? priceBBControllerValidator;
  // State field(s) for priceAA widget.
  TextEditingController? priceAAController;
  String? Function(BuildContext, String?)? priceAAControllerValidator;
  // State field(s) for listall widget.

  PagingController<DocumentSnapshot?, CarsRecord>? listallPagingController;
  Query? listallPagingQuery;
  List<StreamSubscription?> listallStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    gridViewStreamSubscriptions.forEach((s) => s?.cancel());
    gridViewPagingController?.dispose();

    priceBBController?.dispose();
    priceAAController?.dispose();
    listallStreamSubscriptions.forEach((s) => s?.cancel());
    listallPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, BrandRecord> setGridViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController ??= _createGridViewController(query, parent);
    if (gridViewPagingQuery != query) {
      gridViewPagingQuery = query;
      gridViewPagingController?.refresh();
    }
    return gridViewPagingController!;
  }

  PagingController<DocumentSnapshot?, BrandRecord> _createGridViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BrandRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBrandRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

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
          queryBuilder: (_) => listallPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listallStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
