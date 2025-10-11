
import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/category.dart';
import 'package:store_app/features/home/presentation/widgets/categories_header.dart';
import 'package:store_app/features/home/presentation/widgets/category_tile.dart';

class CategoriesSection extends StatelessWidget {

  final CategoryModel categories;
  const CategoriesSection({super.key,required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Column(
        children: [
          categoriesHeader(context),
          
      
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context,index){
                return CategoryTile(categories: categories.categories![index],);
              },
              ),
          )
      
        ],
      ),
    );
  }
}