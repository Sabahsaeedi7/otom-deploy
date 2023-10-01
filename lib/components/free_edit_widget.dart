import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/public_screen/editsuccesss/editsuccesss_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'free_edit_model.dart';
export 'free_edit_model.dart';

class FreeEditWidget extends StatefulWidget {
  const FreeEditWidget({
    Key? key,
    required this.carIdforPlanEdit,
  }) : super(key: key);

  final DocumentReference? carIdforPlanEdit;

  @override
  _FreeEditWidgetState createState() => _FreeEditWidgetState();
}

class _FreeEditWidgetState extends State<FreeEditWidget> {
  late FreeEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeEditModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.17, -0.27),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(17.0),
                        bottomRight: Radius.circular(17.0),
                        topLeft: Radius.circular(1.0),
                        topRight: Radius.circular(1.0),
                      ),
                    ),
                    child: Container(
                      width: 422.0,
                      height: 208.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                            spreadRadius: 1.0,
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF0000),
                            FlutterFlowTheme.of(context).grayLighter,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: [0.0, 0.3, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(17.0),
                          bottomRight: Radius.circular(17.0),
                          topLeft: Radius.circular(1.0),
                          topRight: Radius.circular(1.0),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'پلانێکی تر هەلبژێرە',
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidWindowRestore,
                                    color: Color(0xFF00EA58),
                                  ),
                                  options: FFButtonOptions(
                                    width: 178.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    color: Color(0xFF890DCE),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.carIdforPlanEdit!
                                        .update(createCarsRecordData(
                                      expiredDate: valueOrDefault<String>(
                                        functions.calculateTargetDate(
                                            getCurrentTimestamp, 15),
                                        '0',
                                      ),
                                      plan: 'Free',
                                      isVip: false,
                                      isGold: false,
                                    ));
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: EditsuccesssWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    _model.instantTimer = InstantTimer.periodic(
                                      duration: Duration(milliseconds: 20000),
                                      callback: (timer) async {
                                        Navigator.pop(context);
                                      },
                                      startImmediately: true,
                                    );
                                  },
                                  text: 'پەسەندی کە',
                                  icon: Icon(
                                    Icons.gpp_good_sharp,
                                    color: Color(0xFF00EA58),
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 178.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    color: Color(0xFF890DCE),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.06, -0.70),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: 368.0,
                      height: 207.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                            spreadRadius: 5.0,
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF673AB7),
                            FlutterFlowTheme.of(context).btnText,
                            FlutterFlowTheme.of(context).error,
                            FlutterFlowTheme.of(context).primaryBtnText
                          ],
                          stops: [0.65, 0.78, 0.9, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                'بەرێزت پلانی فریت هەلبژاردوە',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Naskh Arabic',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            AutoSizeText(
                              'ئایا دلنیات لە \nهەلبژاردنی ئەم پاکێجە',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Naskh Arabic',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Flexible(
                              child: Lottie.asset(
                                'assets/lottie_animations/planchoose.json',
                                width: 150.0,
                                height: 130.0,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
