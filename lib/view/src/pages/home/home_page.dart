import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/palette.dart';
import 'filter_option.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _options = <FilterOption>[
    FilterOption('Sales & Offers', const SizedBox.shrink()),
    FilterOption('Size', const SizedBox.shrink()),
    FilterOption('Brand', const SizedBox.shrink()),
    FilterOption('Color', const SizedBox.shrink()),
    FilterOption('Price', const SizedBox.shrink()),
    FilterOption('Rating', const SizedBox.shrink()),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _buildNavigationBar(),
      child: SafeArea(
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _FilterOptionTile(
                title: 'Sort by',
                subtitle: 'Featured Items',
              ),
              const SizedBox(height: 28.0),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Filter by',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Palette.titleTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) => _FilterOptionTile(
                  title: _options[index].title,
                ),
                separatorBuilder: (_, __) =>
                    const Divider(height: 8.0, thickness: 1.0),
                itemCount: _options.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CupertinoNavigationBar _buildNavigationBar() => CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.0,
          color: Palette.iconColor,
        ),
        middle: Text(
          'Sort & Filter',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Palette.appBarTextColor,
          ),
        ),
        trailing: Text(
          'Reset',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Palette.primaryColor,
          ),
        ),
      );
}

class _FilterOptionTile extends StatelessWidget {
  const _FilterOptionTile({
    required this.title,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: Palette.titleTextColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: Palette.subTitleTextColor,
              ),
            )
          : null,
    );
  }
}
