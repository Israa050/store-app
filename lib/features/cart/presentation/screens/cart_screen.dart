// lib/features/cart/cart_screen.dart
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // ---- Hard-coded data (no networking / state mgmt) ----
  final List<CartItem> _items = [
    CartItem(
      id: '1',
      name: "Men's Tie-Dye T-Shirt",
      brand: 'Nike Sportswear',
      imageUrl: 'https://picsum.photos/id/1012/300/300',
      price: 45,
      tax: 4.0,
      qty: 1,
    ),
    CartItem(
      id: '2',
      name: "Men's Tie-Dye T-Shirt",
      brand: 'Nike Sportswear',
      imageUrl: 'https://picsum.photos/id/1027/300/300',
      price: 45,
      tax: 4.0,
      qty: 1,
    ),
  ];

  final String _addressTitle = 'Chhatak, Sunamgonj 12/8AB';
  final String _addressCity = 'Sylhet';
  final String _paymentBrand = 'Visa Classic';
  final String _paymentLast4 = '7690';
  final double _shippingCost = 10;

  double get _subtotal =>
      _items.fold(0, (sum, i) => sum + (i.price + i.tax) * i.qty);
  double get _total => _subtotal + _shippingCost;

  // ---- UI ----
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _AppIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text('Cart'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0x11000000), blurRadius: 12, offset: Offset(0, -4)),
          ],
        ),
        child: SafeArea(
          top: false,
          child: _PrimaryButton(
            label: 'Checkout',
            onPressed: () {/* navigate to checkout */},
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        children: [
          ..._items.map((it) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _CartItemTile(
                  item: it,
                  onInc: () => setState(() => it.qty += 1),
                  onDec: () => setState(() {
                    if (it.qty > 1) it.qty -= 1;
                  }),
                  onRemove: () => setState(() => _items.removeWhere((e) => e.id == it.id)),
                ),
              )),
          const SizedBox(height: 8),
          _NavTile(
            title: 'Delivery Address',
            subtitle: '$_addressTitle\n$_addressCity',
            leading: const _RoundedIcon(icon: Icons.location_on_rounded),
            trailing: const Icon(Icons.check_circle_rounded, color: Color(0xFF2AC769)),
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _NavTile(
            title: 'Payment Method',
            subtitle: '$_paymentBrand\n**** $_paymentLast4',
            leading: const _RoundedIcon(icon: Icons.credit_card_rounded),
            trailing: const Icon(Icons.check_circle_rounded, color: Color(0xFF2AC769)),
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _OrderInfo(subtotal: _subtotal, shipping: _shippingCost, total: _total),
        ],
      ),
    );
  }
}

/* ===================== Models ===================== */
class CartItem {
  CartItem({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
    required this.tax,
    required this.qty,
  });

  final String id;
  final String name;
  final String brand;
  final String imageUrl;
  final double price;
  final double tax;
  int qty; // mutable for local screen state
}

/* ===================== Reusable atoms ===================== */
class _AppIconButton extends StatelessWidget {
  const _AppIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, this.onPressed, this.leading});

  final String label;
  final VoidCallback? onPressed;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: leading ?? const SizedBox.shrink(),
      label: Text(label),
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _RoundedIcon extends StatelessWidget {
  const _RoundedIcon({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: const Color(0xFFF1F2F5),
      child: Icon(icon, color: const Color(0xFF5A5A66)),
    );
  }
}

/* ===================== Tiles & sections ===================== */
class _CartItemTile extends StatelessWidget {
  const _CartItemTile({
    required this.item,
    required this.onInc,
    required this.onDec,
    required this.onRemove,
  });

  final CartItem item;
  final VoidCallback onInc;
  final VoidCallback onDec;
  final VoidCallback onRemove;

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
            child: Image.network(
              item.imageUrl,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
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
  const _QtyButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

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

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.trailing,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget leading;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Color(0xFF8C8C94))),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              trailing,
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFFB9BBC6)),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderInfo extends StatelessWidget {
  const _OrderInfo({
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  final double subtotal;
  final double shipping;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _AmountRow(label: 'Subtotal', value: subtotal),
          const SizedBox(height: 8),
          _AmountRow(label: 'Shipping cost', value: shipping),
          const Divider(height: 24),
          _AmountRow(label: 'Total', value: total, bold: true),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({required this.label, required this.value, this.bold = false});

  final String label;
  final double value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontWeight: bold ? FontWeight.w700 : FontWeight.w500)),
        const Spacer(),
        Text(
          '\$${value.toStringAsFixed(0)}',
          style: TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.w600),
        ),
      ],
    );
  }
}
