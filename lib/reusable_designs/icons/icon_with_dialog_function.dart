import 'package:flutter/material.dart';

class PopupMenuItemData {
  final String value;
  final IconData icon;
  final String title;

  const PopupMenuItemData({
    required this.value,
    required this.icon,
    required this.title,
  });
}

class PopupMenuIconButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final List<PopupMenuItemData> items;
  final Function(String value) onSelected;

  const PopupMenuIconButton({
    super.key,
    required this.icon,
    this.iconSize = 30,
    required this.items,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: iconSize),
      onPressed: () async {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

        final Offset buttonPosition = button.localToGlobal(Offset.zero);
        final Size buttonSize = button.size;
        final Size overlaySize = overlay.size;

        final selected = await showMenu<String>(
          context: context,
          position: RelativeRect.fromLTRB(
            overlaySize.width - 5*buttonSize.width,
            buttonPosition.dy + buttonSize.height,
            buttonPosition.dx,
            0,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 8,
          items: items
              .map(
                (item) => PopupMenuItem(
              value: item.value,
              child: ListTile(
                leading: Icon(item.icon, size: 28), // Larger icon
                title: Text(
                  item.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500), // Larger text
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                horizontalTitleGap: 12,
              ),
            ),
          )
              .toList(),
        );

        if (selected != null) {
          onSelected(selected);
        }
      },
    );
  }
}
