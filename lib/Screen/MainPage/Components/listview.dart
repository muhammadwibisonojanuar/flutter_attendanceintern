import 'package:flutter/material.dart';

class ListLog2 extends StatefulWidget {
  final List<Widget> list;

  ListLog2({this.list});
  @override
  _ListLog2State createState() => _ListLog2State();
}

class _ListLog2State extends State<ListLog2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 218.5),
      child: Column(
        children: <Widget>[
          ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black26,
              thickness: 1.5,
            ),
            padding: EdgeInsets.all(0.5),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              if (widget.list.length == 0) {
                return Container(
                );
              }
              return ListTile(
                onTap: (){},
                contentPadding: EdgeInsets.only(top: 1.5, bottom: 1.5),
                trailing: Icon(Icons.arrow_forward_ios),
                title: widget.list[index] ?? '',
              );
            },
          ),
        ],
      ),
    );
  }
}
