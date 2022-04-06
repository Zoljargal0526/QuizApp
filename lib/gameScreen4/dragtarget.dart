import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DragT extends StatefulWidget {
  String value = "";
  String hint = "";
  DragT({Key? key, this.value = "", this.hint = ""}) : super(key: key);
  bool _isDropped = false;
  @override
  State<DragT> createState() => _DragTState();
}

class _DragTState extends State<DragT> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(6),
          color: Colors.black,
          strokeWidth: 2,
          dashPattern: [8],
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 80,
              width: 80,
              color: widget._isDropped ? Colors.redAccent : null,
              child: Center(
                  child: Text(
                !widget._isDropped ? (widget.hint == "" ? "Drop here" : widget.hint) : widget.value,
                textAlign: TextAlign.center,
              )),
            ),
          ),
        );
      },
      onAccept: (data) {
        //if (data == widget.value)
        setState(() {
          print('Dropped successfully!');
          widget._isDropped = true;
        });
      },
      onLeave: (data) {
        print('Missed');
      },
    );
  }
}
