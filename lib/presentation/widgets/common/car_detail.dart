import 'package:flutter/material.dart';
import 'package:tarrif/models/car_model.dart';
import 'package:tarrif/utilities/constants/theme_globals.dart';

class CarDetail extends StatelessWidget {
  final Rate rate;
  const CarDetail({
    Key? key,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 160,
        width: double.maxFinite,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rate.name,
                  style: size14weight300.copyWith(color: black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Column(children: [
                    _buildDetailRow(
                      title: 'Цена',
                      detail: rate.price,
                      detailTitle: "\$" + rate.priceTitle,
                    ),
                    _buildDetailRow(
                      title: 'Включенный пробег',
                      detail: rate.description[4].type.toString(),
                      detailTitle: rate.description[4].desc,
                    ),
                    _buildDetailRow(
                      title: 'Парковка',
                      detail: rate.parkrate.toString(),
                      detailTitle: "\$" + rate.priceTitle.toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            _openDetails(context);
                          },
                          child: Text(
                            "Детальнее",
                            style: size14weight300.copyWith(color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _openDetails(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            title: Center(
              child: Text(
                rate.name,
                style: size14weight900.copyWith(color: black),
              ),
            ),
            children: [
              _buildDetailRow(
                title: 'Цена',
                detail: rate.price,
                detailTitle: "\$" + rate.priceTitle,
              ),
              _buildDetailRow(
                title: 'Включенный пробег',
                detail: rate.description[4].type.toString(),
                detailTitle: rate.description[4].desc,
              ),
              _buildDetailRow(
                title: rate.description[5].title.toString(),
                detail: rate.description[5].type.toString(),
                detailTitle: "\$" + rate.description[5].desc.toString(),
              ),
              _buildDetailRow(
                title: 'Парковка',
                detail: rate.parkrate.toString(),
                detailTitle: "\$" + rate.priceTitle.toString(),
              ),
              _buildDetailRow(
                title: rate.description[9].title.toString(),
                detail: rate.description[9].type.toString(),
                detailTitle: "\$" + rate.description[9].desc.toString(),
              ),
              _buildDetailRow(
                title: rate.description[7].title.toString(),
                detail: rate.description[7].type.toString(),
                detailTitle: "\$",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  rate.comment,
                  style: size14weight300.copyWith(color: black.withOpacity(0.8)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  rate.description[7].comment,
                  style: size14weight300.copyWith(color: black.withOpacity(0.8)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  rate.description[1].comment,
                  style: size14weight300.copyWith(color: black.withOpacity(0.8)),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Эакрыть",
                    style: size14weight300.copyWith(color: primaryColor),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _buildDetailRow({
    required String title,
    required String detail,
    required String detailTitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: size14weight300.copyWith(
            color: black900.withOpacity(0.8),
          ),
        ),
        RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            children: [
              TextSpan(
                text: detail,
                style: size14weight900.copyWith(
                  color: black,
                ),
              ),
              TextSpan(
                text: ' ' + detailTitle,
                style: size14weight300.copyWith(
                  color: black900.withOpacity(0.8),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
