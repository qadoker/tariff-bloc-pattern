import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarrif/infrastructure/cubits/car/car_cubit.dart';
import 'package:tarrif/infrastructure/helpers/alerter.dart';

import 'package:tarrif/models/car_model.dart';
import 'package:tarrif/presentation/widgets/common/car_detail.dart';
import 'package:tarrif/presentation/widgets/items/car_item.dart';
import 'package:tarrif/utilities/constants/theme_globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _carCubit = CarCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _carCubit..getCars(),
      child: Scaffold(
        backgroundColor: milkWhite,
        appBar: _buildAppBar(),
        body: BlocConsumer<CarCubit, CarState>(
          listener: (context, state) {
            if (state is CarAlert) {
              AppAlerter.showSnackBar(message: state.message, positive: true);
            }
          },
          builder: (context, state) {
            if (state is CarLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Card(
                        color: milkWhite,
                        elevation: 2,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: ListWheelScrollView(
                              itemExtent: 180,
                              physics: const FixedExtentScrollPhysics(),
                              diameterRatio: 20,
                              onSelectedItemChanged: (value) {
                                _carCubit.updateIndex(value);
                              },
                              children: List.generate(state.cars.length, (index) {
                                final _car = state.cars[index];
                                return CarItem(car: _car);
                              })),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
                      child: StreamBuilder<int>(
                          stream: _carCubit.index$,
                          initialData: 0,
                          builder: (context, snapshot) {
                            List<Rate> rates = [];
                            if (state.cars.isNotEmpty) {
                              rates = state.cars[snapshot.data!].rate;
                            }
                            if (rates.isEmpty) {
                              return const SizedBox();
                            } else {
                              return Column(
                                children: [
                                  CarDetail(rate: rates[0]),
                                  CarDetail(rate: rates[1]),
                                  CarDetail(rate: rates[2]),
                                ],
                              );
                            }
                          }),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: grey,
      centerTitle: true,
      title: Text(
        'ТАРИФЫ',
        style: size18weight700,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: primaryColor),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
