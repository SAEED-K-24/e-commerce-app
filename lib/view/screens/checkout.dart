import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/helper/navigation_helper.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/carts_provider.dart';
import 'package:e_commerce_app/view/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/cart.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int currentStep = 0;
  int group = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            currentStep == 0
                ? Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 140.w,
                  )
                : InkWell(
                    onTap: () {
                      if (currentStep != 0) {
                        setState(() {});
                        currentStep--;
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: primaryColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          'BACK',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
            InkWell(
              onTap: currentStep == 2
                  ? () {
                      NavigationHelper.navigationHelper
                          .navigateToWidgetWithReplacement(
                              const LayoutScreen());
                    }
                  : () {
                      if (currentStep != 2) {
                        setState(() {});
                        currentStep++;
                      }
                    },
              child: Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    currentStep == 2 ? 'Deliver' : 'NEXT',
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        NavigationHelper.navigationHelper.navigateBack();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.22,
                  ),
                  Text(
                    currentStep == 2 ? 'Summary' : 'Checkout',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Theme(
                  data: ThemeData(
                    //canvasColor: Colors.yellow,
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: primaryColor,
                          background: Colors.red,
                          secondary: primaryColor,
                        ),
                  ),
                  child: Stepper(
                    elevation: 0.0,
                    type: StepperType.horizontal,
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Container();
                    },
                    currentStep: currentStep,
                    onStepTapped: (i) {
                      setState(() {
                        currentStep = i;
                      });
                    },
                    onStepContinue: () {
                      if (currentStep != 2) {
                        setState(() {});
                        currentStep++;
                      }
                    },
                    onStepCancel: () {
                      if (currentStep != 0) {
                        setState(() {});
                        currentStep--;
                      }
                    },
                    steps: [
                      Step(
                        isActive: currentStep >= 0,
                        title: const Text('Delivery'),
                        state: currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                        content: _buildDeliveryItem(),
                      ),
                      Step(
                        isActive: currentStep >= 1,
                        state: currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text('Address'),
                        content: _stepTwoWidget(),
                      ),
                      Step(
                          isActive: currentStep >= 2,
                          state: currentStep >= 2
                              ? StepState.complete
                              : StepState.disabled,
                          title: const Text('Summer'),
                          content: _buildSummaryWidget()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryWidget() {
    List<Product> products = Provider.of<CartsProvider>(context).products;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130.h,
                        width: 130.w,
                        child: Image.network(
                          '${products.elementAt(index).image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          '${products.elementAt(index).title}',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        '\$${products.elementAt(index).price}',
                        style: TextStyle(fontSize: 16.sp, color: primaryColor),
                      )
                    ],
                  )),
              separatorBuilder: (ctx, i) => SizedBox(
                    width: 10.w,
                  ),
              itemCount: 6),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          color: Colors.grey,
        ),
        Text(
          'Shipping Address',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              '21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria',
              style: TextStyle(fontSize: 16.sp),
              //maxLines: 1,
              //overflow: TextOverflow.ellipsis,
            )),
            Transform.scale(
              scale: 1.4,
              child: Checkbox(
                value: true,
                onChanged: (v) {},
                checkColor: Colors.white,
                activeColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Change',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _stepTwoWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 1.4,
                child: Checkbox(
                  value: true,
                  onChanged: (v) {},
                  checkColor: Colors.white,
                  activeColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const Expanded(
                  child: Text(
                'Billing address is the same as delivery address',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          const SizedBox(height: 4.0),
          Container(
            padding: const EdgeInsets.only(left: 15, bottom: 28),
            child: Column(
              children: [
                StepperTextField(
                  labelText: 'Street 1',
                  fieldText: '21, Alex Davidson Avenue',
                ),
                const SizedBox(height: 30.0),
                StepperTextField(
                  labelText: 'Street 2',
                  fieldText: '21, Alex Davidson Avenue',
                ),
                const SizedBox(height: 30.0),
                StepperTextField(
                  labelText: 'City',
                  fieldText: '21, Alex Davidson Avenue',
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.only(left: 15, bottom: 28),
            child: Row(
              children: [
                Expanded(
                  child: StepperTextField(
                    labelText: 'State',
                    fieldText: 'Lagos State',
                  ),
                ),
                const SizedBox(width: 50.0),
                Expanded(
                  child: StepperTextField(
                    labelText: 'Country',
                    fieldText: 'Lagos State',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Standard Delivery',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Order will be delivered between 3 - 5 busniess days',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Radio(
                value: 1,
                groupValue: group,
                onChanged: (i) {
                  setState(() {
                    group = i as int;
                  });
                },
                fillColor: MaterialStateProperty.all(primaryColor)),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          'Next Day Delivery',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Place your order before 6pm and your items will be deliverered the next day',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Radio(
                value: 2,
                groupValue: group,
                onChanged: (i) {
                  setState(() {
                    group = i as int;
                  });
                },
                fillColor: MaterialStateProperty.all(primaryColor)),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          'Nominated Delivery',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Pick a particular date from the calendar and order will be delivered on selected date',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Radio(
                value: 3,
                groupValue: group,
                onChanged: (i) {
                  setState(() {
                    group = i as int;
                  });
                },
                fillColor: MaterialStateProperty.all(primaryColor)),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}

class StepperTextField extends StatelessWidget {
  final String labelText;
  final String fieldText;
  const StepperTextField({
    Key? key,
    required this.labelText,
    required this.fieldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
