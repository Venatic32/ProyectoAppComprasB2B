import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'search': Icons.search,
  'person': Icons.person,
  'history': Icons.history,
  'logout': Icons.logout,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
