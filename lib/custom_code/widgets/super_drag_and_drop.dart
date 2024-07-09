// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SuperDragAndDrop extends StatefulWidget {
  const SuperDragAndDrop({
    super.key,
    this.width,
    this.height,
    this.onPerformDrop,
  });

  final double? width;
  final double? height;
  final Future Function(List<LocalFileStruct> selectedLocalFiles)?
      onPerformDrop;

  @override
  State<SuperDragAndDrop> createState() => _SuperDragAndDropState();
}

class _SuperDragAndDropState extends State<SuperDragAndDrop> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
