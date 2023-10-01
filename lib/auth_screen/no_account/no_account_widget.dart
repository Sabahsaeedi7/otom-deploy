import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_account_model.dart';
export 'no_account_model.dart';

class NoAccountWidget extends StatefulWidget {
  const NoAccountWidget({Key? key}) : super(key: key);

  @override
  _NoAccountWidgetState createState() => _NoAccountWidgetState();
}

class _NoAccountWidgetState extends State<NoAccountWidget>
    with TickerProviderStateMixin {
  late NoAccountModel _model;

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 1230.ms,
          duration: 1140.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 1530.ms,
          duration: 1260.ms,
          begin: Offset(-54.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoAccountModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 5.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).dark400,
            FlutterFlowTheme.of(context).error,
            FlutterFlowTheme.of(context).primaryBtnText,
            FlutterFlowTheme.of(context).error
          ],
          stops: [0.29, 0.33, 0.72, 1.0],
          begin: AlignmentDirectional(0.17, -1.0),
          end: AlignmentDirectional(-0.17, 1.0),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.81, -0.98),
            child: FlutterFlowIconButton(
              borderRadius: 25.0,
              buttonSize: 35.0,
              hoverIconColor: Color(0xFFFFEB7C),
              icon: Icon(
                Icons.menu_open_sharp,
                color: Color(0xFFFF0036),
                size: 35.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 500.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).dark400,
                              FlutterFlowTheme.of(context).grayLight,
                              FlutterFlowTheme.of(context).primaryBtnText
                            ],
                            stops: [0.0, 0.58, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 4.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.04, 0.25),
                              child: Text(
                                'گەر ئەکاونتت نیە دروستی بکە',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.04, -0.39),
                              child: Text(
                                'گەر ئەکاونتت هەیە داخیڵ بە',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.06, -0.17),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('currentUserLogin');
                                },
                                text: 'داخیل بوون',
                                icon: Icon(
                                  Icons.logout_outlined,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
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
                                  hoverColor:
                                      FlutterFlowTheme.of(context).error,
                                  hoverTextColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  hoverElevation: 3.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.07, 0.56),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('currentUserLogin');
                                },
                                text: 'ئەکاونتی نێوی',
                                icon: Icon(
                                  Icons.person_add,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
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
                                  hoverColor:
                                      FlutterFlowTheme.of(context).error,
                                  hoverTextColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  hoverElevation: 3.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.06, -0.65),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF03E1C4),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF03E1C4),
                          width: 2.0,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-0.15, -1.19),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 100.0,
                            height: 100.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/usericon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.08, -0.41),
                  child: Text(
                    'مێوانی بەریز',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.84),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/tieraction.png',
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0.01, 0.97),
                  child: Text(
                    'Profesional',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation1']!),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/otom128.png',
              width: 300.0,
              height: 120.0,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.01, 0.90),
            child: Text(
              'Otombelakam ',
              style: FlutterFlowTheme.of(context).displayLarge.override(
                    fontFamily: 'Oswald',
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).displayLargeFamily),
                  ),
            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
          ),
        ],
      ),
    );
  }
}
