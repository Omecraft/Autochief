import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class IngredientItem extends StatefulWidget {
  final String name;
  final String quantity;
  final String unit;
  final String iconId;

  const IngredientItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.iconId,
  });

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  final Map<String, IconData> iconMap = {
    'apple': IconlyBold.activity,
    'banana': IconlyBold.bag,
    'orange': IconlyBold.bookmark,
    'carrot': IconlyBold.calendar,
    'tomato': IconlyBold.chart,
    'cucumber': IconlyBold.document,
    'milk': IconlyBold.game,
    'cheese': IconlyBold.heart,
    'yogurt': IconlyBold.home,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: SizedBox(
        width: 120,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF2F334A) : const Color(0xFF2A2E42),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    
                    decoration: BoxDecoration(
                      color: _isHovered ? const Color(0xFF3A3F56) : const Color(0xFF343950),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Icon(
                          iconMap[widget.iconId] ?? IconlyBold.activity,
                          size: 32,
                          color: const Color(0xFFFFB37C).withOpacity(_isHovered ? 1.0 : 0.9),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB37C),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        '${widget.quantity}${widget.unit}',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1E2132),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                widget.name,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}