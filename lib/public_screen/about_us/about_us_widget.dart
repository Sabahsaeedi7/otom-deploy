import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget>
    with TickerProviderStateMixin {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(3.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 640.ms),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 640.ms,
          duration: 600.ms,
          begin: Offset(3.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1100.ms),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: Offset(3.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1670.ms),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 1670.ms,
          duration: 600.ms,
          begin: Offset(3.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 2500.ms),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 2500.ms,
          duration: 600.ms,
          begin: Offset(3.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      setState(() {
        _model.place = currentUserLocationValue;
      });
    });

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

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/aboutus.png',
                              ).image,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-0.01, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    width: 300.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .grayLight,
                                          FlutterFlowTheme.of(context).btnText,
                                          FlutterFlowTheme.of(context).warning
                                        ],
                                        stops: [0.3, 0.9, 1.0],
                                        begin: AlignmentDirectional(0.03, -1.0),
                                        end: AlignmentDirectional(-0.03, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            'https://www.snapchat.com/add/chyapasha?web_client_id=81138f90-367e-48ee-808d-7315ab1053ca');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  'https://www.snapchat.com/add/chyapasha');
                                            },
                                            child: Lottie.asset(
                                              'assets/lottie_animations/snapchat.json',
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.contain,
                                              reverse: true,
                                              animate: true,
                                            ),
                                          ),
                                          Flexible(
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: FlutterFlowYoutubePlayer(
                                                url:
                                                    'https://www.youtube.com/watch?v=ZbPtX15eg0w&t=2s',
                                                autoPlay: false,
                                                looping: true,
                                                mute: false,
                                                showControls: true,
                                                showFullScreen: true,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 30.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                                Container(
                                  width: 300.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).grayLight,
                                        FlutterFlowTheme.of(context).btnText,
                                        Color(0xFF1AE4EB)
                                      ],
                                      stops: [0.3, 0.9, 1.0],
                                      begin: AlignmentDirectional(0.03, -1.0),
                                      end: AlignmentDirectional(-0.03, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await launchURL(
                                          'https://www.tiktok.com/@otombelakam/video/7257078977452395782?q=otobelakam&t=1692390103938');
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await launchURL(
                                                'https://www.tiktok.com/@otombelakam?lang=en');
                                          },
                                          child: Lottie.asset(
                                            'assets/lottie_animations/tiktok.json',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            reverse: true,
                                            animate: true,
                                          ),
                                        ),
                                        Flexible(
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: FlutterFlowYoutubePlayer(
                                              url:
                                                  'https://www.youtube.com/watch?v=InUFu_Jyza8&t=3s',
                                              autoPlay: false,
                                              looping: true,
                                              mute: false,
                                              showControls: true,
                                              showFullScreen: true,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 30.0)),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                                Container(
                                  width: 300.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).grayLight,
                                        FlutterFlowTheme.of(context).btnText,
                                        Color(0xE3EF428F)
                                      ],
                                      stops: [0.3, 0.9, 1.0],
                                      begin: AlignmentDirectional(0.03, -1.0),
                                      end: AlignmentDirectional(-0.03, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await launchURL(
                                          'https://www.instagram.com/otombelakam/');
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await launchURL(
                                                'https://www.instagram.com/otombelakam/');
                                          },
                                          child: Lottie.asset(
                                            'assets/lottie_animations/instagram.json',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            reverse: true,
                                            animate: true,
                                          ),
                                        ),
                                        Flexible(
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: FlutterFlowYoutubePlayer(
                                              url:
                                                  'https://www.youtube.com/watch?v=kuEuJc_4vDI',
                                              autoPlay: false,
                                              looping: true,
                                              mute: false,
                                              showControls: true,
                                              showFullScreen: true,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 30.0)),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                                Container(
                                  width: 300.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).grayLight,
                                        FlutterFlowTheme.of(context).btnText,
                                        Color(0xFF165DFF)
                                      ],
                                      stops: [0.3, 0.9, 1.0],
                                      begin: AlignmentDirectional(0.03, -1.0),
                                      end: AlignmentDirectional(-0.03, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await launchURL(
                                          'https://www.facebook.com/otombelakam');
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await launchURL(
                                                'https://www.facebook.com/otombelakam');
                                          },
                                          child: Lottie.asset(
                                            'assets/lottie_animations/facebook.json',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            reverse: true,
                                            animate: true,
                                          ),
                                        ),
                                        Flexible(
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: FlutterFlowYoutubePlayer(
                                              url:
                                                  'https://www.youtube.com/watch?v=ZbPtX15eg0w&t=2s',
                                              autoPlay: false,
                                              looping: true,
                                              mute: false,
                                              showControls: true,
                                              showFullScreen: true,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 30.0)),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!),
                                Container(
                                  width: 300.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).grayLight,
                                        FlutterFlowTheme.of(context).white,
                                        Color(0xFFDF3F3F)
                                      ],
                                      stops: [0.3, 0.9, 1.0],
                                      begin: AlignmentDirectional(0.03, -1.0),
                                      end: AlignmentDirectional(-0.03, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              'https://www.youtube.com/@otombelakam3533');
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie_animations/youtube2.json',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                          reverse: true,
                                          animate: true,
                                        ),
                                      ),
                                      Flexible(
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: FlutterFlowYoutubePlayer(
                                            url:
                                                'https://www.youtube.com/watch?v=ZbPtX15eg0w&t=2s',
                                            autoPlay: false,
                                            looping: true,
                                            mute: false,
                                            showControls: true,
                                            showFullScreen: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation5']!),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'لە تۆرە کۆمەلایەتیەکان سەردانمان بکەن',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              fontSize: 15.0,
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
                              ].divide(SizedBox(height: 15.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
