import 'package:flutter/material.dart';
import 'package:real_state/routes/routes.dart';

class CatagoryItems extends StatelessWidget {
  final String id;
  final String name;
  final String imgUrl;

  const CatagoryItems({
    Key? key,
    required this.id,
    required this.name,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screensize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.viewCatagoryScreen,
            arguments: [id, name]);
      },
      child: Card(
        margin: const EdgeInsets.all(6),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: SizedBox(
          width: _screensize.width * 0.28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: _screensize.height * 0.13,
                width: _screensize.width * 0.28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  name,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
