import 'package:app_ui_03/view_models/products_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_ui_03/widget/card_widget.dart';

class TabHome extends StatefulWidget{
 _TabHome createState() => _TabHome();
}

class _TabHome extends State<TabHome> with CardWidget{
  ProductsViewModel model = new ProductsViewModel();
  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsViewModel>(
      create: (_)=> ProductsViewModel(),
      child: Consumer<ProductsViewModel>(builder: (_,model,Widget child){
        if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!model.isLoading && model.allProducts.length == 0) {
            return Center(
              child: Text('NoData'),
            );
          }
             return GridView.builder(
              shrinkWrap: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: model.allProducts.length,
              itemBuilder: (_, index) => buildItem(context, model.allProducts[index]),
              // children: [
              //   buildItem(context),
              //   buildItem(context),
              // ],
            );
      },),
    );
  }

}