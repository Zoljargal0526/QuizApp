import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen4/gameScreen4.dart';

class DragDrop extends StatefulWidget {
  List<String> value;
  String hint;
  int id = 0;
  final VoidCallback update;
  DragDrop({Key? key, required this.value, this.hint = "", this.id = 0, required this.update}) : super(key: key);

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.15;
    return Column(children: [
      IgnorePointer(
        ignoring: GameScreen4.checkD[widget.id],
        child: Opacity(
          opacity: !GameScreen4.checkD[widget.id] ? 1 : 0,
          child: LongPressDraggable<String>(
            // Data is the value this Draggable stores.
            data: widget.value[widget.id],
            //axis: Axis.vertical,
            child: Container(
              height: width - 10,
              width: width - 10,
              color: Colors.green,
              child: Center(
                child: FittedBox(
                  child: Text(
                    widget.value[widget.id] != "" ? widget.value[widget.id] : "Hi",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            feedback: Material(
              child: Container(
                height: width - 10,
                width: width - 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      widget.value[widget.id] != "" ? widget.value[widget.id] : "Hi",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            childWhenDragging: Container(
              height: width - 10,
              width: width - 10,
              color: Colors.grey,
              child: Center(
                child: FittedBox(
                  child: Text(
                    widget.value[widget.id] != "" ? widget.value[widget.id] : "Hi",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      DragTarget<String>(
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
                height: width,
                width: width,
                color: GameScreen4.checkDrag[widget.id] ? Colors.redAccent : null,
                child: Center(
                    child: FittedBox(
                  child: Text(
                    !GameScreen4.checkDrag[widget.id] ? (widget.hint[widget.id] == "" ? "Drop here" : widget.hint) : widget.value[a],
                    textAlign: TextAlign.center,
                  ),
                )),
              ),
            ),
          );
        },
        onAccept: (data) {
          GameScreen4.check[widget.id] = (data);
          a = widget.value.indexOf(data);
          print('Dropped successfully!' + data + "index=" + a.toString());
          widget.update();
          GameScreen4.checkDrag[widget.id] = true;
          GameScreen4.checkD[a] = true;
        },
      ),
    ]);
  }
}
