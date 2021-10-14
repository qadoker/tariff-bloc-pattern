import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tarrif/models/car_model.dart';
import 'package:tarrif/utilities/constants/theme_globals.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    Key? key,
    required CarModel car,
  })  : _car = car,
        super(key: key);

  final CarModel _car;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 170,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(_car.car.picturecardurlSmall),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 7),
              child: Text(
                _car.id,
                style: size16weight300.copyWith(color: black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
