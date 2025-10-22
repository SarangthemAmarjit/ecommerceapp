import 'package:flutter/material.dart';

class AnimatedNavItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final bool hasDropdown;
  final bool showCategoryDropdown;
  final VoidCallback onTap;

  const AnimatedNavItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.hasDropdown,
    required this.showCategoryDropdown,
    required this.onTap,
  });

  @override
  State<AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<AnimatedNavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isCategoryActive =
        widget.title == 'Category' && widget.showCategoryDropdown;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.only(top: 4, bottom: 6),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isCategoryActive
                    ? Colors.blue.shade600
                    : widget.isSelected
                    ? Color.fromARGB(255, 0, 61, 41)
                    : isHovered
                    ? Color.fromARGB(255, 0, 61, 41)
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Row(
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: widget.isSelected || isHovered
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: isCategoryActive
                      ? Colors.blue.shade600
                      : widget.isSelected
                      ? Colors.green.shade900
                      : isHovered
                      ? Color.fromARGB(255, 0, 61, 41)
                      : Colors.grey.shade800,
                ),
                child: Text(widget.title),
              ),
              if (widget.hasDropdown) ...[
                const SizedBox(width: 4),
                Icon(
                  widget.showCategoryDropdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 20,
                  color: isCategoryActive
                      ? Colors.blue.shade600
                      : isHovered
                      ? Color.fromARGB(255, 0, 61, 41)
                      : Colors.grey.shade800,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
