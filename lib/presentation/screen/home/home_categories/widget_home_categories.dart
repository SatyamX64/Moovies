import 'package:findseat/model/entity/categoryy.dart';
import 'package:findseat/presentation/app_router.dart';
import 'package:findseat/presentation/common_widgets/widget_spacer.dart';
import 'package:findseat/presentation/custom_ui/svg_image.dart';
import 'package:findseat/presentation/screen/home/home_categories/bloc/bloc.dart';
import 'package:findseat/presentation/screen/home/home_categories/bloc/home_categories_state.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeCategories extends StatelessWidget {
  // final items = [
  //   _ItemCategoryVM("Movies", "assets/ic_film.svg"),
  //   _ItemCategoryVM("Events", "assets/ic_events.svg"),
  //   _ItemCategoryVM("Plays", "assets/ic_plays.svg"),
  //   _ItemCategoryVM("Sports", "assets/ic_sports.svg"),
  //   _ItemCategoryVM("Activity", "assets/ic_activity.svg"),
  //   _ItemCategoryVM("Monum", "assets/ic_monum.svg"),
  // ];
  late final List<_ItemCategoryVM> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoryBloc, HomeCategoriesState>(
        builder: (context, state) {
      if (state is HomeCategoriesLoaded) {
        items = state.categories
            .map((category) => _ItemCategoryVM.fromCategory(category))
            .toList();
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Seat categories'.toUpperCase(),
                  style: FONT_CONST.MEDIUM_BLACK2_14),
              WidgetSpacer(height: 14),
              _buildListCategory(),
            ],
          ),
        );
      } else {
        return Center(
          child: Text('No Categories'),
        );
      }
    });
  }

  Widget _buildListCategory() {
    return Container(
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _WidgetItemCategory(item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 30);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }
}

class _WidgetItemCategory extends StatelessWidget {
  final _ItemCategoryVM item;

  _WidgetItemCategory(this.item);

  @override
  Widget build(BuildContext context) {
    void openAllShows() {
      Navigator.pushNamed(context, AppRouter.ALL_SHOWS);
    }

    return GestureDetector(
      onTap: openAllShows,
      child: Column(
        children: <Widget>[
          Container(
            width: 34,
            height: 34,
            child: Center(
              child: MySvgImage(
                path: item.image,
                width: 28,
                height: 28,
                applyColorFilter: false,
              ),
            ),
          ),
          WidgetSpacer(height: 4),
          Text(item.title, style: FONT_CONST.REGULAR_GRAY6_12),
        ],
      ),
    );
  }
}

class _ItemCategoryVM {
  Categoryy categoryy;
  String image;
  String title;

  _ItemCategoryVM.fromCategory(this.categoryy)
      : image = "assets/${categoryy.icon}",
        title = categoryy.name;
}
