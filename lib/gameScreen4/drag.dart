import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  String value = "";
  bool _isDropped = false;
  Drag({Key? key, this.value = ""}) : super(key: key);
  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget._isDropped,
      child: Opacity(
        opacity: !widget._isDropped ? 1 : 0,
        child: LongPressDraggable<String>(
          // Data is the value this Draggable stores.
          data: widget.value,
          //axis: Axis.vertical,
          child: Container(
            height: 70.0,
            width: 70.0,
            color: Colors.redAccent,
            child: Center(
              child: Text(
                widget.value != "" ? widget.value : "Hi",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          feedback: Material(
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Center(
                child: Text(
                  widget.value != "" ? widget.value : "Hi",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          childWhenDragging: Container(
            height: 70.0,
            width: 70.0,
            color: Colors.grey,
            child: Center(
              child: Text(
                widget.value != "" ? widget.value : "Hi",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
