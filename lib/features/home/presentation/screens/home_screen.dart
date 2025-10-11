import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/widgets/error_dialog.dart';
import 'package:store_app/core/widgets/success_dialog.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/screens/bottom_navigation.dart';
import 'package:store_app/features/home/presentation/widgets/categories_section.dart';
import 'package:store_app/features/home/presentation/widgets/loading_widget.dart';
import 'package:store_app/features/home/presentation/widgets/offers_carousel.dart';
import 'package:store_app/features/home/presentation/widgets/products_section.dart';
import 'package:store_app/features/home/presentation/widgets/search_row_widget.dart';
import 'package:store_app/features/home/presentation/widgets/welcom_header.dart';

class HomeScreen extends StatefulWidget {
 

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()async{
    await context.read<HomeCubit>().getHomeData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset('assets/svgs/menu.svg'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset('assets/svgs/cart.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomHeader(),
            SearchRowWidget(),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if(state is Success){
                  return Column(
                    children: [
                      OffersCarousel(offers: state.offers),
                      CategoriesSection(categories: state.category,),
                      ProductsSection(products: state.products,),
                    ],
                  );
                }
                else if(state is Faliuare){
                  return SizedBox();
                }
                else{
                  return LoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}
