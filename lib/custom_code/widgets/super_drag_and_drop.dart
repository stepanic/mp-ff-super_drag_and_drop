// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class SuperDragAndDrop extends StatefulWidget {
  const SuperDragAndDrop({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

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
          print('onDropEnter');
          print(event);
        },
        onDropLeave: (event) {
          // Called when drag leaves the region. Will also be called after
          // drag completion.
          // This is a good place to remove any visual indicators.
          print('onDropLeave');
          print(event);
        },
        onPerformDrop: (event) async {
          print('onPerformDrop');
          print(event);
          print(event.session.items.first);
          print(event.session.items.first.dataReader?.toString());
          // Called when user dropped the item. You can now request the data.
          // Note that data must be requested before the performDrop callback
          // is over.
          final item = event.session.items.first;
          print(item.localData);
          print('****************');

          // data reader is available now
          final reader = item.dataReader!;

          print(await reader.getSuggestedName());

          if (reader.canProvide(Formats.plainText)) {
            reader.getValue<String>(Formats.plainText, (value) {
              if (value != null) {
                // You can access values through the `value` property.
                print('Dropped text: ${value}');
              }
            }, onError: (error) {
              print('Error reading value $error');
            });
          }

          if (reader.canProvide(Formats.png)) {
            print('---- Reading PNG----');
            reader.getFile(Formats.png, (file) {
              // Binary files may be too large to be loaded in memory and thus
              // are exposed as stream.
              final stream = file.getStream();

              // Alternatively, if you know that that the value is small enough,
              // you can read the entire value into memory:
              // (note that readAll is mutually exclusive with getStream(), you
              // can only use one of them)
              // final data = file.readAll();
            }, onError: (error) {
              print('Error reading value $error');
            });
          }

          if (reader.canProvide(Formats.wav)) {
            reader.getFile(Formats.wav, (file) {
              print('---- Reading WAV----');
              // Binary files may be too large to be loaded in memory and thus
              // are exposed as stream.
              final stream = file.getStream();

              // Alternatively, if you know that that the value is small enough,
              // you can read the entire value into memory:
              // (note that readAll is mutually exclusive with getStream(), you
              // can only use one of them)
              // final data = file.readAll();

              print('---- Done Reading WAV----');
            }, onError: (error) {
              print('Error reading value $error');
            });
          }

          var formats = reader.getFormats([
            Formats.mp3,
            Formats.m4a,
            Formats.oga,
            Formats.aac,
            Formats.wav,
            Formats.opus,
            Formats.flac,
            Formats.fileUri,
          ]);

          final itemFormats = reader.getFormats([
            ...Formats.standardFormats,
          ]);

          if (reader.canProvide(Formats.fileUri)) {
            print('ja sam FILE URI');

            reader.getValue(Formats.fileUri, (value) {
              print('value $value');
            });
          }

          print('formati su');
          print(itemFormats);

          reader.getFile(null, (file) {
            print('citam fajl');

            // var path = file.

            // final stream = file.getStream();
            // print(stream.toString());

            // final data = file.readAll();

            // print(data.toString());
          }, onError: (error) {
            print('GRESKA Error reading value $error');
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Drop items here'),
        ),
      ),
    );
  }
}
