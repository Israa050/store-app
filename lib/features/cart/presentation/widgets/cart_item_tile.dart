import 'package:flutter/material.dart';
import 'package:store_app/features/cart/presentation/screens/cart_screen.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onInc;
  final VoidCallback onDec;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onInc,
    required this.onDec,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(item.imageUrl, width: 72, height: 72, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                Text(item.brand, style: const TextStyle(color: Color(0xFF8C8C94))),
                const SizedBox(height: 6),
                Text(
                  '\$${item.price.toStringAsFixed(0)} + \$${item.tax.toStringAsFixed(1)} Tax',
                  style: const TextStyle(color: Color(0xFF8C8C94), fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QtyButton(icon: Icons.remove_rounded, onTap: onDec),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${item.qty}', style: const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    _QtyButton(icon: Icons.add_rounded, onTap: onInc),
                    const Spacer(),
                    IconButton(
                      onPressed: onRemove,
                      icon: const Icon(Icons.delete_outline_rounded),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE9E9EE)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(icon, size: 18),
        ),
      ),
    );
  }
}
