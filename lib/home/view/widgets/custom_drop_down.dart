import 'package:flutter/material.dart';
import 'package:quran_app/global/app_colors.dart';

class MenuItem {
  final int id;
  final String label;
  final IconData? icon;

  MenuItem({required this.id, required this.label, this.icon});
}


class DropdownMenuSample extends StatelessWidget {
  final List<MenuItem> menuItems;
  final MenuItem? selectedMenu;
  final String hint;
  final TextEditingController menuController;
  final ValueChanged<MenuItem?> onSelected;

  const DropdownMenuSample({
    super.key,
    required this.menuItems,
    required this.selectedMenu,
    required this.hint,
    required this.menuController,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {

    double cornerRadius = 35;
    return DropdownMenu<MenuItem>(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.textFieldIconColor,
          fontSize: MediaQuery.textScalerOf(context).scale(14),
        ),
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        filled: false,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.textFieldFillColor,
          ),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textFieldFillColor),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
      ),
      controller: menuController,
      enableSearch: false,
      enableFilter: false,
      width: 250,
      requestFocusOnTap: false,
      hintText: hint,
      menuHeight: 250,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            Theme.of(context).colorScheme.primaryContainer),
      ),
      label: Text(hint),
      onSelected: onSelected,
      initialSelection: selectedMenu,
      dropdownMenuEntries:
      menuItems.map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
        return DropdownMenuEntry<MenuItem>(
            value: menu, label: '${menu.id}. ${menu.label}', leadingIcon: Icon(menu.icon));
      }).toList(),
    );
  }
}