import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'socialbaner_model.dart';
export 'socialbaner_model.dart';

class SocialbanerWidget extends StatefulWidget {
  const SocialbanerWidget({Key? key}) : super(key: key);

  @override
  _SocialbanerWidgetState createState() => _SocialbanerWidgetState();
}

class _SocialbanerWidgetState extends State<SocialbanerWidget> {
  late SocialbanerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialbanerModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 95.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF890DCE), Color(0xFFE8E8E8)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'لە هەموو تۆرە کۆمەلایەتیەکان بینەرمان بن',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Lottie.asset(
                      'assets/lottie_animations/instagram.json',
                      width: 50.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                  Flexible(
                    child: Lottie.asset(
                      'assets/lottie_animations/tiktok.json',
                      width: 50.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                  Flexible(
                    child: Lottie.asset(
                      'assets/lottie_animations/snapchat.json',
                      width: 50.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                  Flexible(
                    child: Lottie.asset(
                      'assets/lottie_animations/youtube2.json',
                      width: 50.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                  Flexible(
                    child: Lottie.asset(
                      'assets/lottie_animations/facebook.json',
                      width: 50.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                      animate: true,
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
