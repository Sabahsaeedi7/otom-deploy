import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _adPeriodComponet = true;
  bool get adPeriodComponet => _adPeriodComponet;
  set adPeriodComponet(bool _value) {
    _adPeriodComponet = _value;
  }

  List<String> _gallery = [];
  List<String> get gallery => _gallery;
  set gallery(List<String> _value) {
    _gallery = _value;
  }

  void addToGallery(String _value) {
    _gallery.add(_value);
  }

  void removeFromGallery(String _value) {
    _gallery.remove(_value);
  }

  void removeAtIndexFromGallery(int _index) {
    _gallery.removeAt(_index);
  }

  void updateGalleryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _gallery[_index] = updateFn(_gallery[_index]);
  }

  void insertAtIndexInGallery(int _index, String _value) {
    _gallery.insert(_index, _value);
  }

  bool _okagain = false;
  bool get okagain => _okagain;
  set okagain(bool _value) {
    _okagain = _value;
  }

  int _validDuration = 0;
  int get validDuration => _validDuration;
  set validDuration(int _value) {
    _validDuration = _value;
  }

  List<String> _galleyshow = [];
  List<String> get galleyshow => _galleyshow;
  set galleyshow(List<String> _value) {
    _galleyshow = _value;
  }

  void addToGalleyshow(String _value) {
    _galleyshow.add(_value);
  }

  void removeFromGalleyshow(String _value) {
    _galleyshow.remove(_value);
  }

  void removeAtIndexFromGalleyshow(int _index) {
    _galleyshow.removeAt(_index);
  }

  void updateGalleyshowAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _galleyshow[_index] = updateFn(_galleyshow[_index]);
  }

  void insertAtIndexInGalleyshow(int _index, String _value) {
    _galleyshow.insert(_index, _value);
  }

  bool _createAcount = true;
  bool get createAcount => _createAcount;
  set createAcount(bool _value) {
    _createAcount = _value;
  }

  String _markfilter = '';
  String get markfilter => _markfilter;
  set markfilter(String _value) {
    _markfilter = _value;
  }

  String _modelA = '';
  String get modelA => _modelA;
  set modelA(String _value) {
    _modelA = _value;
  }

  String _modelB = '';
  String get modelB => _modelB;
  set modelB(String _value) {
    _modelB = _value;
  }

  double _priceA = 0.0;
  double get priceA => _priceA;
  set priceA(double _value) {
    _priceA = _value;
  }

  double _priceB = 0.0;
  double get priceB => _priceB;
  set priceB(double _value) {
    _priceB = _value;
  }

  String _state = '';
  String get state => _state;
  set state(String _value) {
    _state = _value;
  }

  String _city = '';
  String get city => _city;
  set city(String _value) {
    _city = _value;
  }

  DocumentReference? _carIdForPlanSelection;
  DocumentReference? get carIdForPlanSelection => _carIdForPlanSelection;
  set carIdForPlanSelection(DocumentReference? _value) {
    _carIdForPlanSelection = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
