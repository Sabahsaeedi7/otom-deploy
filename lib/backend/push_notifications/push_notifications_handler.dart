import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).dark400,
          child: Image.asset(
            'assets/images/finalotombelakam130.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login': ParameterData.none(),
  'createAccount': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'carDetiales': (data) async => ParameterData(
        allParams: {
          'carId': getParameter<DocumentReference>(data, 'carId'),
          'carselected': await getDocumentParameter<CarsRecord>(
              data, 'carselected', CarsRecord.fromSnapshot),
        },
      ),
  'changePassword': ParameterData.none(),
  'aboutUs': ParameterData.none(),
  'home01': ParameterData.none(),
  'verifyphoneNumber': ParameterData.none(),
  'NewuserAccountCration': ParameterData.none(),
  'addcar02': ParameterData.none(),
  'SearchPage': (data) async => ParameterData(
        allParams: {},
      ),
  'landing': ParameterData.none(),
  'currentUserLogin': ParameterData.none(),
  'carsoual': (data) async => ParameterData(
        allParams: {
          'caridforshowcarpic':
              getParameter<DocumentReference>(data, 'caridforshowcarpic'),
        },
      ),
  'algoliasearch': ParameterData.none(),
  'userProfileprofile': ParameterData.none(),
  'phonecrationAcount': (data) async => ParameterData(
        allParams: {
          'refToupdate': getParameter<DocumentReference>(data, 'refToupdate'),
        },
      ),
  'verifyphonecurrentUser': ParameterData.none(),
  'ckeckingHaveAccouant': ParameterData.none(),
  'editcars': (data) async => ParameterData(
        allParams: {
          'caridForedit': getParameter<DocumentReference>(data, 'caridForedit'),
        },
      ),
  'usersCar': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
