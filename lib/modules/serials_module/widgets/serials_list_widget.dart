import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Serials {
  String? imageName = '';
  String title;
  String? description = '';
  String? rating = '';

  Serials({
    this.imageName,
    required this.title,
    this.description,
    this.rating,
  });
}

class SerialsListWidget extends StatefulWidget {
  const SerialsListWidget({Key? key}) : super(key: key);

  @override
  State<SerialsListWidget> createState() => _SerialsListWidgetState();
}

class _SerialsListWidgetState extends State<SerialsListWidget> {
  final _serials = [
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Мера',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/look.png',
      title: 'Большой куш',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Король',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Serials(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
  ];

  var _filteredSerials = <Serials>[];

  final _searchController = TextEditingController();

  void _searchSerials() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredSerials = _serials.where((Serials movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredSerials = _serials;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchSerials);
    _filteredSerials = _serials;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: Responsive.height(10.0, context)),
            itemCount: _filteredSerials.length,
            itemExtent: Responsive.height(25.0, context),
            itemBuilder: (BuildContext context, int index) {
              final serial = _filteredSerials[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {},
                      backgroundColor: AppColors.slidableDeleteColors,
                      foregroundColor: AppColors.slidableDeleteIconColors,
                      icon: AppIcons.slidableDeleteIcon,
                      label: AppTexts.delete,
                    ),
                  ],
                  // dismissible: DismissiblePane(onDismissed: () {}),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.width(2.0, context),
                      vertical: Responsive.height(1.0, context)),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.serialWidgetColor,
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 6,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Responsive.width(30, context),
                              child: Image(
                                  image: AssetImage(
                                      serial.imageName ?? 'images/look.png')),
                            ),
                            SizedBox(
                              width: Responsive.width(4.0, context),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Responsive.height(3.0, context),
                                  ),
                                  Text(
                                    serial.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.textMenuColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Responsive.height(2.0, context),
                                  ),
                                  Text(
                                    serial.description ?? '',
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.textMenuColor,
                                    ),
                                  ),
                                  const Text(AppTexts.rating),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Material(
                        color: AppColors.transparentColor,
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.width(2, context),
                vertical: Responsive.height(2.0, context)),
            child: TextFormField(
              controller: _searchController,
              style: const TextStyle(
                color: AppColors.textTextFormFieldColor,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: AppColors.filledSearchColor,
                prefixIcon: AppIcons.searchIcon,
                labelText: AppTexts.searchLabelText,
                labelStyle: const TextStyle(
                  color: AppColors.textTextFormFieldColor,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: Responsive.width(4.0, context),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
