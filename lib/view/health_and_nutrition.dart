import 'package:fitness/view/utils.dart';
import 'package:flutter/material.dart';

class HealthAndNutrition extends StatefulWidget {
  const HealthAndNutrition({Key? key}) : super(key: key);

  @override
  State<HealthAndNutrition> createState() => _HealthAndNutritionState();
}

class _HealthAndNutritionState extends State<HealthAndNutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          "HEATLH & NUTRITION",
          style: TextStyle(
              fontSize: 15.8, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            //-----BMI-----
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              decoration: Utils.containerShadow(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Body Mass Index (BMI)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Body mass index (BMI) is a value derived from the mass (weight) and height of a person. The BMI is defined as the body mass divided by the square of the body height, and is expressed in units of kg/m2, resulting from mass in kilograms and height in metres.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "The BMI is a convenient rule of thumb used to broadly categorize a person as underweight, normal weight, overweight, or obese based on tissue mass (muscle, fat, and bone) and height. Major adult BMI classifications are underweight (under 18.5 kg/m2), normal weight (18.5 to 24.9), overweight (25 to 29.9), and obese (30 or more).[1] When used to predict an individual's health, rather than as a statistical measurement for groups, the BMI has limitations that can make it less useful than some of the alternatives, especially when applied to individuals with abdominal obesity, short stature, or unusually high muscle mass.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            //-----Health Tips----
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              decoration: Utils.containerShadow(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Health Tips",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Choose good carbs, not no carbs. Whole grains are your best bet.\n\nPay attention to the protein package. Fish, poultry, nuts, and beans are the best choices.\n\nChoose foods with healthy fats, limit foods high in saturated fat, and avoid foods with trans fat. Plant oils, nuts, and fish are the healthiest sources.\n\nChoose a fiber-filled diet, rich in whole grains, vegetables, and fruits.\n\n Eat more vegetables and fruits. Go for color and variety—dark green, yellow, orange, and red.\n\nCalcium is important. But milk isn’t the only, or even best, source.\n\n Water is best to quench your thirst. Skip the sugary drinks, and go easy on the milk and juice.\n\n Eating less salt is good for everyone’s health. Choose more fresh foods and fewer processed foods.\n\n Moderate drinking can be healthy—but not for everyone. You must weigh the benefits and risks.\n\nA daily multivitamin is a great nutrition insurance policy. Some extra vitamin D may add an extra health boost.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
