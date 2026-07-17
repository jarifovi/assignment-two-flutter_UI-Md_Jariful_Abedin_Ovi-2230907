import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: const CustomHeader(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Screen Title
              const Text(
                'Monthly Spending Report',
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // 2. Total Expenses Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Expenses (Last 30 days)',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '-\$1270.00',
                      style: TextStyle(
                        color: Color(0xFFEF4444),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_upward,
                          color: Color(0xFFEF4444),
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Up 12% from last month',
                          style: TextStyle(
                            color: Color(0xFFEF4444),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. Spending Breakdown Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Spending Breakdown',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Food & Drink (Red, 35%)
                    _buildBreakdownItem(
                      label: 'Food & Drink',
                      amountText: '\$450.00 (35%)',
                      percentage: 0.35,
                      color: const Color(0xFFEF4444),
                    ),
                    
                    // Shopping (Indigo/Purple, 25%)
                    _buildBreakdownItem(
                      label: 'Shopping',
                      amountText: '\$320.00 (25%)',
                      percentage: 0.25,
                      color: const Color(0xFF4C49ED),
                    ),
                    
                    // Housing (Yellow/Orange, 22%)
                    _buildBreakdownItem(
                      label: 'Housing',
                      amountText: '\$280.00 (22%)',
                      percentage: 0.22,
                      color: const Color(0xFFF59E0B),
                    ),
                    
                    // Transport (Green, 12%)
                    _buildBreakdownItem(
                      label: 'Transport',
                      amountText: '\$150.00 (12%)',
                      percentage: 0.12,
                      color: const Color(0xFF10B981),
                    ),
                    
                    // Other (Grey, 6%)
                    _buildBreakdownItem(
                      label: 'Other',
                      amountText: '\$70.00 (6%)',
                      percentage: 0.06,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownItem({
    required String label,
    required String amountText,
    required double percentage,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                amountText,
                style: const TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Custom progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 8,
              width: double.infinity,
              color: const Color(0xFFE5E7EB), // Grey background track
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: percentage,
                  child: Container(
                    color: color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
