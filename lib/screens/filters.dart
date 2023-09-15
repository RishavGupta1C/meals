import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    Key? key,
    required this.currentFilters,
  }) : super(key: key);

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterState = false;
  var _lactoseFreeFilterState = false;
  var _vegetarianFilterState = false;
  var _veganFilterState = false;

  @override
  void initState() {
    super.initState();
    // We don't need to call setState as initState is called before build()
    // So these values will be available before build() is called.
    _gluttenFreeFilterState = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterState = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterState = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterState = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters!'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (ctx) => const TabsScreen(),
      //     //   ),
      //     // );
      //     // To replace the current screen and not add the screen to stack
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        // Creating Future Suing async.
        onWillPop: () async {
          // The mapping will be returned when the back button is pressed.
          // And then the map is accessible by tabsScreen.
          Navigator.of(context).pop({
            Filter.glutenFree: _gluttenFreeFilterState,
            Filter.lactoseFree: _lactoseFreeFilterState,
            Filter.vegetarian: _vegetarianFilterState,
            Filter.vegan: _veganFilterState,
          });
          return false;
        },
        child: Column(children: [
          SwitchListTile(
            value: _gluttenFreeFilterState,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeFilterState = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeFilterState,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterState = isChecked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegetarianFilterState,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterState = isChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFilterState,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterState = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ]),
      ),
    );
  }
}
