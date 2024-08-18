import 'package:flutter/material.dart';

int radioMapFromString(String permission) {
  int radioValue = 0;
  debugPrint('permission : $permission');
  switch (permission) {
    case 'MEM':
      radioValue = 1;
      break;
    case 'ADM':
      radioValue = 2;
      break;
    case 'OWN':
      radioValue = 3;
      break;
    case 'EMP':
      radioValue = 4;
      break;
    default:
      debugPrint('radioValue : error');
      radioValue = 0;
  }
  debugPrint('radioValue : $radioValue');

  return radioValue;
}

String radioMapToString(int radioValue) {
  String permission = "";
  debugPrint('radioValue : $radioValue');
  switch (radioValue) {
    case 1:
      permission = 'MEM';
      break;
    case 2:
      permission = 'ADM';
      break;
    case 3:
      permission = 'OWN';
      break;
    case 4:
      permission = 'EMP';
      break;
    default:
      debugPrint('error');
      permission = "";
  }
  debugPrint('permission : $permission');

  return permission;
}
