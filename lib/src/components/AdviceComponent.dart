import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdviceComponent extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;

  const AdviceComponent({Key key, @required this.image, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Ink(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: this.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                    ),
                    child: Center(
                      child: Text(
                        this.title,
                        style: _textContent(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle _textContent() =>
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
