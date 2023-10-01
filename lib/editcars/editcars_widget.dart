import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/checkplan_widget.dart';
import '/components/free_edit_widget.dart';
import '/components/gold_edit_widget.dart';
import '/components/no_erbil_widget.dart';
import '/components/vip_edit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/public_screen/editsuccesss/editsuccesss_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'editcars_model.dart';
export 'editcars_model.dart';

class EditcarsWidget extends StatefulWidget {
  const EditcarsWidget({
    Key? key,
    required this.caridForedit,
  }) : super(key: key);

  final DocumentReference? caridForedit;

  @override
  _EditcarsWidgetState createState() => _EditcarsWidgetState();
}

class _EditcarsWidgetState extends State<EditcarsWidget>
    with TickerProviderStateMixin {
  late EditcarsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -44.99999999999999),
          end: Offset(0.0, -2.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditcarsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readDuringLoad =
          await CarsRecord.getDocumentOnce(widget.caridForedit!);
      setState(() {
        _model.galleryList =
            _model.readDuringLoad!.gallery.toList().cast<String>();
        _model.mainphotoUpload = false;
        _model.mainphotoConfirrm = false;
        _model.mainphotoCancel = false;
        _model.detailsVisiblity = false;
        _model.cityIconedit = false;
        _model.nameUndModel = false;
        _model.plan = false;
        _model.mainGalleryConfirm = false;
        _model.mainPhoto = false;
        _model.gallleyTab = false;
        _model.nameAndPriceAndModel = false;
        _model.locatiomMain = false;
        _model.detailsMain = false;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            context.safePop();
            setState(() {
              _model.nameController?.clear();
              _model.priceController?.clear();
              _model.textController3?.clear();
            });
            setState(() {
              _model.nameController?.clear();
              _model.priceController?.clear();
              _model.textController3?.clear();
            });
            setState(() {
              _model.galleryList = [];
            });
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          icon: Icon(
            Icons.arrow_circle_left_rounded,
          ),
          elevation: 8.0,
          label: Text(
            'Back',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<CarsRecord>(
            stream: CarsRecord.getDocument(widget.caridForedit!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitCubeGrid(
                      color: Color(0xFFFF0036),
                      size: 50.0,
                    ),
                  ),
                );
              }
              final columnCarsRecord = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 3.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).accent4,
                                FlutterFlowTheme.of(context).primaryBtnText
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.31, -1.0),
                              end: AlignmentDirectional(-0.31, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayLighter,
                              width: 5.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          columnCarsRecord.mainPhoto,
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          columnCarsRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ]
                                      .divide(SizedBox(width: 20.0))
                                      .addToStart(SizedBox(width: 5.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 0.0, 5.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    width: 200.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .grayLight,
                                          Color(0xDE13AAD8)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.41, -1.0),
                                        end: AlignmentDirectional(-0.41, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              dateTimeFormat('MMMEd',
                                                  columnCarsRecord.createdat),
                                              '0',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 10.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AutoSizeText(
                                            'بەرواری تۆمارکردن',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 10.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 11.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.mainPhoto)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleUp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.mainPhoto = false;
                                      });
                                    },
                                  ),
                                if (!_model.mainPhoto)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.mainPhoto = true;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'وێنەی سەرەکی',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.mainPhoto)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 11.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.mainphotoConfirrm) {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading1 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
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
                                          _model.isDataUploading1 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile1 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl1 =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }
                                    } else {
                                      return;
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        columnCarsRecord.mainPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/otombelakam-cb8ef.appspot.com/o/uploadPhoto.png?alt=media&token=b73568f3-c7c0-4bff-bc87-2ec76392ce19&_gl=1*ydtpq5*_ga*MTQ3NzQwNzcxNi4xNjc1MTk1MjAw*_ga_CW55HF8NVT*MTY5NjE3NDY4My4xNzkuMS4xNjk2MTc0NzA5LjM0LjAuMA..',
                                      ),
                                      width: 150.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.mainphotoConfirrm)
                                Align(
                                  alignment: AlignmentDirectional(-0.96, 0.93),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidSave,
                                      color: Color(0x9E19A406),
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      await widget.caridForedit!
                                          .update(createCarsRecordData(
                                        mainPhoto: _model.uploadedFileUrl1,
                                      ));
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        isDismissible: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: EditsuccesssWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              if (!_model.mainphotoConfirrm)
                                Align(
                                  alignment: AlignmentDirectional(0.91, 0.94),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: Icon(
                                      Icons.edit_square,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.mainphotoConfirrm = true;
                                      });
                                    },
                                  ),
                                ),
                              if (_model.mainphotoConfirrm)
                                Align(
                                  alignment: AlignmentDirectional(-0.74, 0.82),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.mainphotoConfirrm = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: Color(0xFFE5006E),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 11.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.gallleyTab)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleUp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.gallleyTab = false;
                                      });
                                    },
                                  ),
                                if (!_model.gallleyTab)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.gallleyTab = true;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'گەلەری ',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.gallleyTab)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 11.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: 300.0,
                            child: Stack(
                              children: [
                                Builder(
                                  builder: (context) {
                                    final listmonitoring = _model.galleryList
                                        .map((e) => e)
                                        .toList();
                                    return Container(
                                      width: double.infinity,
                                      height: 180.0,
                                      child: CarouselSlider.builder(
                                        itemCount: listmonitoring.length,
                                        itemBuilder:
                                            (context, listmonitoringIndex, _) {
                                          final listmonitoringItem =
                                              listmonitoring[
                                                  listmonitoringIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.mainGalleryConfirm) {
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
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  _model
                                                      .updateGalleryListAtIndex(
                                                    valueOrDefault<int>(
                                                      _model
                                                          .carouselCurrentIndex,
                                                      0,
                                                    ),
                                                    (_) =>
                                                        _model.uploadedFileUrl2,
                                                  );
                                                });
                                              } else {
                                                return;
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  listmonitoringItem,
                                                  '0',
                                                ),
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        carouselController:
                                            _model.carouselController ??=
                                                CarouselController(),
                                        options: CarouselOptions(
                                          initialPage:
                                              min(1, listmonitoring.length - 1),
                                          viewportFraction: 0.5,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.25,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: false,
                                          onPageChanged: (index, _) => _model
                                              .carouselCurrentIndex = index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                if (!_model.mainGalleryConfirm)
                                  Align(
                                    alignment: AlignmentDirectional(0.92, 0.97),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      hoverColor: Color(0xFFE5006E),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                      icon: Icon(
                                        Icons.edit_square,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.mainGalleryConfirm = true;
                                        });
                                      },
                                    ),
                                  ),
                                if (_model.mainGalleryConfirm)
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.97, 0.96),
                                    child: Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        hoverColor: Color(0xFFE5006E),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidSave,
                                          color: Color(0x9E19A406),
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          await widget.caridForedit!.update({
                                            ...mapToFirestore(
                                              {
                                                'gallery': _model.galleryList,
                                              },
                                            ),
                                          });
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: true,
                                            avoidOverflow: false,
                                            targetAnchor: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: EditsuccesssWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    ),
                                  ),
                                if (_model.mainGalleryConfirm)
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.72, 0.89),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.mainGalleryConfirm = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.cancel,
                                        color: Color(0xFFE5006E),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 11.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.nameUndModel)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleUp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.nameUndModel = false;
                                      });
                                    },
                                  ),
                                if (!_model.nameUndModel)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.nameUndModel = true;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'ناو و  مۆدێل و نرخی سەیارە',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.nameUndModel)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.00, 0.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller:
                                                _model.nameController ??=
                                                    TextEditingController(
                                              text: columnCarsRecord.name,
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            validator: _model
                                                .nameControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller:
                                                _model.priceController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                columnCarsRecord.price
                                                    .toString(),
                                                '0',
                                              ),
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            validator: _model
                                                .priceControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          '1950',
                                          '1951',
                                          '1952',
                                          '1953',
                                          '1954',
                                          '1955',
                                          '1956',
                                          '1957',
                                          '1958',
                                          '1959',
                                          '1960',
                                          '1961',
                                          '1962',
                                          '1963',
                                          '1964',
                                          '1965',
                                          '1966',
                                          '1967',
                                          '1968',
                                          '1969',
                                          '1970',
                                          '1971',
                                          '1972',
                                          '1973',
                                          '1974',
                                          '1975',
                                          '1976',
                                          '1977',
                                          '1978',
                                          '1979',
                                          '1980',
                                          '1981',
                                          '1982',
                                          '1983',
                                          '1984',
                                          '1985',
                                          '1986',
                                          '1987',
                                          '1988',
                                          '1989',
                                          '1990',
                                          '1991',
                                          '1992',
                                          '1993',
                                          '1994',
                                          '1995',
                                          '1996',
                                          '1997',
                                          '1998',
                                          '1999',
                                          '2000',
                                          '2001',
                                          '2002',
                                          '2003',
                                          '2004',
                                          '2005',
                                          '2006',
                                          '2007',
                                          '2008',
                                          '2009',
                                          '2010',
                                          '2011',
                                          '2012',
                                          '2013',
                                          '2014',
                                          '2015',
                                          '2016',
                                          '2017',
                                          '2018',
                                          '2019',
                                          '2020',
                                          '2021',
                                          '2022',
                                          '2023',
                                          '2024',
                                          '2025',
                                          '2026',
                                          '2027',
                                          '2028',
                                          '2029',
                                          '2030'
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue = val),
                                        width: 200.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: columnCarsRecord.model,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 10.0))
                                      .addToStart(SizedBox(height: 10.0)),
                                ),
                              ),
                              if (_model.nameAndPriceAndModel)
                                Align(
                                  alignment: AlignmentDirectional(-0.96, 0.95),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidSave,
                                      color: Color(0x9E19A406),
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              if (!_model.nameAndPriceAndModel)
                                Align(
                                  alignment: AlignmentDirectional(0.92, 0.97),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: Icon(
                                      Icons.edit_square,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.nameAndPriceAndModel = true;
                                      });
                                    },
                                  ),
                                ),
                              if (_model.nameAndPriceAndModel)
                                Align(
                                  alignment: AlignmentDirectional(-0.75, 0.88),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.nameAndPriceAndModel = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Color(0xFFE5006E),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 11.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.cityIconedit)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleUp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.cityIconedit = false;
                                      });
                                    },
                                  ),
                                if (!_model.cityIconedit)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.cityIconedit = true;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'شوینی سەیارە',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.cityIconedit)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Stack(
                            children: [
                              if (!_model.locatiomMain)
                                Align(
                                  alignment: AlignmentDirectional(0.99, 0.98),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: Icon(
                                      Icons.edit_square,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.locatiomMain = true;
                                      });
                                    },
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: StreamBuilder<List<StateRecord>>(
                                    stream: queryStateRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitCubeGrid(
                                              color: Color(0xFFFF0036),
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<StateRecord> cityStateRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller:
                                            _model.cityValueController ??=
                                                FormFieldController<String>(
                                          _model.cityValue ??=
                                              columnCarsRecord.cityLocation,
                                        ),
                                        options: cityStateRecordList
                                            .map((e) => valueOrDefault<String>(
                                                  e.name,
                                                  '0',
                                                ))
                                            .toList(),
                                        onChanged: (val) => setState(
                                            () => _model.cityValue = val),
                                        width: 300.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (_model.locatiomMain)
                                Align(
                                  alignment: AlignmentDirectional(-0.96, 0.96),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidSave,
                                      color: Color(0x9E19A406),
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              if (_model.locatiomMain)
                                Align(
                                  alignment: AlignmentDirectional(-0.75, 0.86),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.locatiomMain = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: Color(0xFFE5006E),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 11.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.detailsVisiblity)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleUp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.detailsVisiblity = false;
                                      });
                                    },
                                  ),
                                if (!_model.detailsVisiblity)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.detailsVisiblity = true;
                                      });
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    },
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'وردەکاری و تێبینی',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.detailsVisiblity)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 420.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 10.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController3 ??=
                                        TextEditingController(
                                      text: columnCarsRecord.description,
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textAlign: TextAlign.end,
                                    maxLines: 10,
                                    validator: _model.textController3Validator
                                        .asValidator(context),
                                  ),
                                ),
                                if (!_model.detailsMain)
                                  Align(
                                    alignment: AlignmentDirectional(0.87, 0.96),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      hoverColor: Color(0xFFE5006E),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                      icon: Icon(
                                        Icons.edit_square,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.detailsMain = true;
                                        });
                                      },
                                    ),
                                  ),
                                if (_model.detailsMain)
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.93, 0.99),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      hoverColor: Color(0xFFE5006E),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidSave,
                                        color: Color(0x9E19A406),
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                if (_model.detailsMain)
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.71, 0.95),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.detailsMain = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.cancel_rounded,
                                        color: Color(0xFFE5006E),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation']!,
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 11.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.plan)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleUp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.plan = false;
                                      });
                                    },
                                  ),
                                if (!_model.plan)
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderRadius: 150.0,
                                    borderWidth: 3.0,
                                    buttonSize: 35.0,
                                    hoverColor: Color(0xFFE5006E),
                                    hoverIconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidArrowAltCircleDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _model.plan = true;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'پلان و پاکێچ',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.plan)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.856,
                                  height: 105.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'پلانی ئیستا',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Container(
                                        width: 250.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                              Color(0xFF0500FF),
                                              Color(0xFFE5006E),
                                              FlutterFlowTheme.of(context)
                                                  .primaryBtnText
                                            ],
                                            stops: [0.0, 0.3, 0.5, 1.0],
                                            begin: AlignmentDirectional(
                                                0.77, -1.0),
                                            end: AlignmentDirectional(
                                                -0.77, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: Color(0xE38D289E),
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                columnCarsRecord.plan,
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: PagedGridView<
                                      DocumentSnapshot<Object?>?, PlansRecord>(
                                    pagingController:
                                        _model.setGridViewController(
                                      PlansRecord.collection.orderBy('price'),
                                    ),
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 5.0,
                                      childAspectRatio: 3.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate:
                                        PagedChildBuilderDelegate<PlansRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCubeGrid(
                                            color: Color(0xFFFF0036),
                                            size: 50.0,
                                          ),
                                        ),
                                      ),
                                      // Customize what your widget looks like when it's loading another page.
                                      newPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCubeGrid(
                                            color: Color(0xFFFF0036),
                                            size: 50.0,
                                          ),
                                        ),
                                      ),

                                      itemBuilder: (context, _, gridViewIndex) {
                                        final gridViewPlansRecord = _model
                                            .gridViewPagingController!
                                            .itemList![gridViewIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (gridViewPlansRecord.name ==
                                                  'VIP') {
                                                if (columnCarsRecord.plan ==
                                                    'VIP') {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    isDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              CheckplanWidget(
                                                            carIdForPlanCeck:
                                                                widget
                                                                    .caridForedit!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                    isDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: 550.0,
                                                            child:
                                                                VipEditWidget(
                                                              carIdforPlanEdit:
                                                                  widget
                                                                      .caridForedit!,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              } else if (gridViewPlansRecord
                                                      .name ==
                                                  'GOLD') {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: GoldEditWidget(
                                                          carIdforPlanEdit:
                                                              widget
                                                                  .caridForedit!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                if (columnCarsRecord
                                                        .cityLocation ==
                                                    'هەولێر') {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: FreeEditWidget(
                                                            carIdforPlanEdit:
                                                                widget
                                                                    .caridForedit!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              NoErbilWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Container(
                                                width: 330.0,
                                                height: 287.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 1.0,
                                                      color: Color(0xE3FF8184),
                                                      offset: Offset(1.0, 1.0),
                                                      spreadRadius: 2.0,
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                      Color(0xFF0500FF),
                                                      Color(0xFFE5006E),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText
                                                    ],
                                                    stops: [0.0, 0.3, 0.5, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, 0.94),
                                                    end: AlignmentDirectional(
                                                        -1.0, -0.94),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor1,
                                                    width: 5.0,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.91, -0.87),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFFEC26),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Text(
                                                              gridViewPlansRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0xFF004BFF),
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.48),
                                                      child: Text(
                                                        gridViewPlansRecord
                                                            .specialCondition,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1,
                                                                  fontSize:
                                                                      10.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                  lineHeight:
                                                                      2.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.08, -0.83),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          ' نرخ:${valueOrDefault<String>(
                                                            gridViewPlansRecord
                                                                .price
                                                                .toString(),
                                                            '0',
                                                          )}دینار',
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Naskh Arabic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 5.0))
                                .addToStart(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                  ]
                      .divide(SizedBox(height: 5.0))
                      .addToEnd(SizedBox(height: 65.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
