import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../appbar/appbar.dart';
import '../texts/section_heading.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text("Brand"), showbackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(title: 'Brands', showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,)
            ],
          ),
        ),
      ),
    );
  }
}
