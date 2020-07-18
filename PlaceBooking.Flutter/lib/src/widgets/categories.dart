import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//
import 'package:booking_place/src/constants/theme.dart';
import 'package:booking_place/src/models/category_model.dart';
import 'package:booking_place/src/providers/category_provider.dart';
import 'package:booking_place/src/utils/device_utils.dart';
import 'inner_shadow.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<CategoryProvider>(context, listen: false).getCategory();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget _buildGridItem(BuildContext context, Category category) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: <Widget>[
          InnerShadow(
            color: Color.fromRGBO(0, 43, 29, 0.76),
            blur: 41,
            offset: Offset(0, -65),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                  image: NetworkImage(category.imageUrl),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: DeviceUtils.getScaledWidth(context, 1),
                height: DeviceUtils.getScaledHeight(context, 1),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                child: Text(
                  category.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).categories;

    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.contentHorizontalPadding),
          child: Text(
            "Services",
            style: GoogleFonts.montserrat(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            physics: ClampingScrollPhysics(),
            reverse: false,
            shrinkWrap: true,
            primary: false,
            itemCount: categories.length,
            padding: EdgeInsets.only(bottom: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              Category service = categories[index];
              return _buildGridItem(context, service);
            },
          ),
        )
      ],
    );
  }
}
