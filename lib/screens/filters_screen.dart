import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var vegan = false;
  var vegetarian = false;
  var lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'];
    vegan = widget.currentFilters['vegan'];
    vegetarian = widget.currentFilters['vegetarian'];
    lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-free'),
                  value: glutenFree,
                  subtitle: Text('Only includes gluten-free meals'),
                  onChanged: (value) {
                    setState(() {
                      glutenFree = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  value: lactoseFree,
                  subtitle: Text('Only includes lactose-free meals'),
                  onChanged: (value) {
                    setState(() {
                      lactoseFree = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: vegetarian,
                  subtitle: Text('Only includes vegetarian meals'),
                  onChanged: (value) {
                    setState(() {
                      vegetarian = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: vegan,
                  subtitle: Text('Only includes vegan meals'),
                  onChanged: (value) {
                    setState(() {
                      vegan = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
