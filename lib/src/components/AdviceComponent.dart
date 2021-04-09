import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdviceComponent extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final Function onTap;

  const AdviceComponent({Key key, @required this.image, @required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 150.0,
        decoration: _imageBackground(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: this.onTap,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: _darkOverlay(),
              child: Center(
                child: Text(
                  this.title,
                  style: _textContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _darkOverlay() {
    return BoxDecoration(
      color: Colors.black38,
    );
  }

  BoxDecoration _imageBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: this.image,
        fit: BoxFit.cover,
      ),
    );
  }

  TextStyle _textContent() =>
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
}
