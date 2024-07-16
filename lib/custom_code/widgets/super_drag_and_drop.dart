// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class SuperDragAndDrop extends StatefulWidget {
  const SuperDragAndDrop({
    super.key,
    this.width,
    this.height,
    this.onFileRead,
    required this.onFilesDrop,
    this.onDropEnter,
    this.onDropLeave,
    //LOCAL_START
    this.onFileReadAsStream,
    //LOCAL_END
  });

  final double? width;
  final double? height;
  final Future Function(String selectedFilePath, List<int> selectedFileBytes)?
      onFileRead;
  final Future Function(int howManySelectedFiles) onFilesDrop;
  final Future Function()? onDropEnter;
  final Future Function()? onDropLeave;
  //LOCAL_START
  final Future Function(String selectedFilePath, Stream<Uint8List> fileStream)?
      onFileReadAsStream;
  //LOCAL_END

  @override
  State<SuperDragAndDrop> createState() => _SuperDragAndDropState();
}

class _SuperDragAndDropState extends State<SuperDragAndDrop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropRegion(
        // Formats this region can accept.
        formats: Formats.standardFormats,
        hitTestBehavior: HitTestBehavior.opaque,
        onDropOver: (event) {
          // print('onDropOver');
          // print(event);
          // You can inspect local data here, as well as formats of each item.
          // However on certain platforms (mobile / web) the actual data is
          // only available when the drop is accepted (onPerformDrop).
          final item = event.session.items.first;
          if (item.localData is Map) {
            // This is a drag within the app and has custom local data set.
          }
          if (item.canProvide(Formats.plainText)) {
            // this item contains plain text.
          }
          // This drop region only supports copy operation.
          if (event.session.allowedOperations.contains(DropOperation.copy)) {
            return DropOperation.copy;
          } else {
            return DropOperation.none;
          }
        },
        onDropEnter: (event) {
          // This is called when region first accepts a drag. You can use this
          // to display a visual indicator that the drop is allowed.
          // print('onDropEnter');
          widget.onDropEnter?.call();
        },
        onDropLeave: (event) {
          // Called when drag leaves the region. Will also be called after
          // drag completion.
          // This is a good place to remove any visual indicators.
          // print('onDropLeave');
          widget.onDropLeave?.call();
        },
        onPerformDrop: (event) async {
          // print('onPerformDrop');

          widget.onFilesDrop.call(event.session.items.length);

          // Called when user dropped the item. You can now request the data.
          // Note that data must be requested before the performDrop callback
          // is over.

          for (final item in event.session.items) {
            // print('onPerformDrop item $counter');
            // data reader is available now
            final reader = item.dataReader!;

            // final itemFormats = reader.getFormats([
            //   ...Formats.standardFormats,
            // ]);
            // print('DropItem.Formats: $itemFormats');

            if (reader.canProvide(Formats.fileUri)) {
              reader.getValue(Formats.fileUri, (value) {
                String filePath = value?.path ?? "N/A";

                reader.getFile(null, (file) async {
                  // Binary files may be too large to be loaded in memory and thus
                  // are exposed as stream.
                  final fileStream = file.getStream();
                  widget.onFileReadAsStream?.call(filePath, fileStream);

                  return;

                  // Alternatively, if you know that that the value is small enough,
                  // you can read the entire value into memory:
                  // (note that readAll is mutually exclusive with getStream(), you
                  // can only use one of them)
                  // Uint8List fileBytes = file.readAll();

                  // TODO: replace with reading stream
                  Uint8List fileBytes = await file.readAll();

                  // Uint8List fileBytes = Uint8List.fromList([]);

                  // print('onPerformDrop.reader.getFile: ${filePath}');
                  widget.onFileRead?.call(filePath, fileBytes);

                  // clean up memory leaks
                  fileBytes = Uint8List.fromList([]);
                }, onError: (error) {
                  // print(
                  //     'onPerformDrop.reader.getFile.Error reading value $error');
                });
              });
            }
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(''),
        ),
      ),
    );
  }
}
