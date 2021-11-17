import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ButtonMenu {
  final Function onPressed;
  final IconData icon;
  ButtonMenu({required this.onPressed, required this.icon});
}

class NavigatorMenu extends StatelessWidget {
  final List<ButtonMenu> items = [
    ButtonMenu(
        icon: CupertinoIcons.phone,
        onPressed: () {
          print("Call");
        }),
    ButtonMenu(
        icon: CupertinoIcons.home,
        onPressed: () {
          print("HOME");
        }),
    ButtonMenu(
        icon: CupertinoIcons.location,
        onPressed: () {
          print("Locaton");
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: _MenuBackground(
        child: _MenuItems(items),
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            spreadRadius: -2,
            blurRadius: 10,
          )
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<ButtonMenu> menuItems;
  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final ButtonMenu item;
  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 25 : 20,
          color: (itemSeleccionado == index) ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
