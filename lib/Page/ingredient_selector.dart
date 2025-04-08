import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

// Mock list of ingredients - in a real app, this would come from an API or database
const INGREDIENTS = [
  'Tomate', 'Oignon', 'Ail', 'Poivron', 'Carotte', 'Pomme de terre', 'Courgette',
  'Aubergine', 'Champignon', 'Brocoli', 'Chou-fleur', 'Épinard', 'Laitue',
  'Concombre', 'Maïs', 'Haricot vert', 'Pois', 'Lentille', 'Pois chiche',
  'Riz', 'Pâtes', 'Quinoa', 'Couscous', 'Farine', 'Pain', 'Baguette',
  'Poulet', 'Bœuf', 'Porc', 'Agneau', 'Saumon', 'Thon', 'Crevette', 'Moule',
  'Œuf', 'Lait', 'Beurre', 'Crème', 'Fromage', 'Yaourt', "Huile d'olive",
  'Sel', 'Poivre', 'Paprika', 'Cumin', 'Cannelle', 'Curry', 'Basilic',
  'Persil', 'Citron', 'Orange', 'Pomme', 'Banane', 'Fraise', 'Framboise',
  'Myrtille', 'Sucre', 'Miel', 'Chocolat', 'Vanille', 'Noix', 'Amande', 'Pistache',
];

class IngredientSelector extends StatefulWidget {
  final List<String> selectedIngredients;
  final Function(List<String>) setSelectedIngredients;

  const IngredientSelector({
    Key? key,
    required this.selectedIngredients,
    required this.setSelectedIngredients,
  }) : super(key: key);

  @override
  State<IngredientSelector> createState() => _IngredientSelectorState();
}

class _IngredientSelectorState extends State<IngredientSelector> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredIngredients = [];
  bool _isDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterIngredients);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      } else {
        _hideOverlay();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _hideOverlay();
    super.dispose();
  }

  void _filterIngredients() {
    final searchTerm = _searchController.text;
    
    if (searchTerm.trim().isEmpty) {
      setState(() {
        _filteredIngredients = [];
      });
      _updateOverlay();
      return;
    }

    final filtered = INGREDIENTS
        .where((ingredient) => 
            ingredient.toLowerCase().contains(searchTerm.toLowerCase()) &&
            !widget.selectedIngredients.contains(ingredient))
        .take(5) // Limit to 5 results for better UX
        .toList();

    setState(() {
      _filteredIngredients = filtered;
      _isDropdownOpen = filtered.isNotEmpty;
    });
    
    _updateOverlay();
  }

  void _handleAddIngredient(String ingredient) {
    if (!widget.selectedIngredients.contains(ingredient)) {
      widget.setSelectedIngredients([...widget.selectedIngredients, ingredient]);
      _searchController.clear();
      setState(() {
        _filteredIngredients = [];
        _isDropdownOpen = false;
      });
      _hideOverlay();
    }
  }

  void _showOverlay() {
    _hideOverlay();
    
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60), // Adjust based on your input field height
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF292D4D),
            child: _isDropdownOpen && _filteredIngredients.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: _filteredIngredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = _filteredIngredients[index];
                      return InkWell(
                        onTap: () => _handleAddIngredient(ingredient),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            ingredient,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _updateOverlay() {
    _hideOverlay();
    if (_focusNode.hasFocus) {
      _showOverlay();
    }
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Rechercher des ingrédients...',
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: const Icon(LucideIcons.search, color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF292D4D),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}