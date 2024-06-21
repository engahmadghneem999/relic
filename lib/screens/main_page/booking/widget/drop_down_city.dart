import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../data/models/city_model.dart';
import '../../../component/custom_text.dart';
import '../../bookings_controller/booking_controller.dart';

class AddDropDownCity extends StatefulWidget {
  final List<CityModel> cityList;
  final bool isFirst;

  const AddDropDownCity(
      {Key? key, required this.cityList, required this.isFirst})
      : super(key: key);

  @override
  State<AddDropDownCity> createState() => _AddDropDownCityState();
}

class _AddDropDownCityState extends State<AddDropDownCity> {
  List<DropdownMenuItem<int>> citiesDropdown = [];
  int citiesId = 0;
  late BookingController citiesController;

  @override
  void initState() {
    citiesController = Get.find();
    citiesDropdown = [
      const DropdownMenuItem<int>(
        value: 0,
        child: Text(''),
      )
    ];
    for (var i = 0; i < widget.cityList.length; i++) {
      citiesDropdown.add(DropdownMenuItem<int>(
        value: widget.cityList[i].id,
        child: Text(widget.cityList[i].name ?? ''),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 180.0.w, top: 15.h),
            child: CustomText(
              text: widget.isFirst ? 'مدينة المغادرة' : "مدينة الوصول",
              textStyle: TextStyle(
                  color: ColorManager.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
          ),
          Container(
            height: size.width / 8,
            width: size.width / 1.32,
            alignment: Alignment.center,
            padding:
                EdgeInsets.only(right: size.width / 20, left: size.width / 50),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.white,
              ),
              color: ColorManager.colorButton,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                alignment: Alignment.centerRight,
                enableFeedback: true,
                focusColor: ColorManager.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                dropdownColor: ColorManager.colorButton,
                isExpanded: true,
                icon: Image.asset(
                  AssetsManager.take_on,
                  width: size.width / 12,
                  height: size.width / 12,
                ),
                style: const TextStyle(
                  color: ColorManager.white,
                ),
                items: citiesDropdown,
                value: citiesId,
                onChanged: (value) {
                  setState(() {
                    if (widget.isFirst) {
                      citiesId = value!;
                      citiesController.changeCityIdEnd(citiesId);
                      citiesController.setEndCityName(widget.cityList
                          .firstWhere((city) => city.id == citiesId)
                          .name);
                      // citiesController.setStartCityName(value);
                    } else {
                      citiesId = value!;

                      citiesController.changeCityIdStart(citiesId);
                      citiesController.setStartCityName(widget.cityList
                          .firstWhere((city) => city.id == citiesId)
                          .name);
                      // citiesController.setEndCityName(value);
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
