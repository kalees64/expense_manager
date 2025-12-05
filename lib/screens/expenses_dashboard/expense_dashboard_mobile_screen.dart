import 'package:expense_manager/contstants/app_colors.dart';
import 'package:flutter/material.dart';

class ExpenseDashboardMobileScreen extends StatefulWidget {
  const ExpenseDashboardMobileScreen({super.key});

  @override
  State<ExpenseDashboardMobileScreen> createState() =>
      _ExpenseDashboardMobileScreenState();
}

class _ExpenseDashboardMobileScreenState
    extends State<ExpenseDashboardMobileScreen> {
  String selectedPeriod = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Expense Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildPeriodSelector(),
            const SizedBox(height: 20),
            _buildIncomeExpenseCards(),
            const SizedBox(height: 24),
            _buildSectionTitle('Spending by Category'),
            const SizedBox(height: 12),
            _buildCategoryList(),
            const SizedBox(height: 24),
            _buildSectionTitle('Recent Transactions'),
            const SizedBox(height: 12),
            _buildTransactionsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppColors.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '₹45,230.50',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildBalanceItem(
                  'Income',
                  '₹65,400',
                  Icons.arrow_downward,
                  AppColors.income,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildBalanceItem(
                  'Expenses',
                  '₹20,169.50',
                  Icons.arrow_upward,
                  AppColors.expense,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem(
    String label,
    String amount,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ['This Week', 'This Month', 'This Year', 'Custom']
            .map(
              (period) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(period),
                  selected: selectedPeriod == period,
                  onSelected: (selected) {
                    setState(() {
                      selectedPeriod = period;
                    });
                  },
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: selectedPeriod == period
                        ? Colors.white
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildIncomeExpenseCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Income',
            '₹65,400',
            '+12.5%',
            AppColors.incomeGradient,
            Icons.trending_up,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'Expenses',
            '₹20,169.50',
            '+8.2%',
            AppColors.expenseGradient,
            Icons.trending_down,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String amount,
    String percentage,
    Gradient gradient,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [AppColors.cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(icon, color: Colors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            percentage,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = [
      {
        'name': 'Food & Dining',
        'amount': '₹5,430',
        'percent': 0.35,
        'color': AppColors.categoryFood,
      },
      {
        'name': 'Transport',
        'amount': '₹3,200',
        'percent': 0.25,
        'color': AppColors.categoryTransport,
      },
      {
        'name': 'Shopping',
        'amount': '₹4,800',
        'percent': 0.20,
        'color': AppColors.categoryShopping,
      },
      {
        'name': 'Entertainment',
        'amount': '₹2,150',
        'percent': 0.12,
        'color': AppColors.categoryEntertainment,
      },
      {
        'name': 'Bills',
        'amount': '₹3,500',
        'percent': 0.08,
        'color': AppColors.categoryBills,
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [AppColors.cardShadow],
      ),
      child: Column(
        children: categories
            .map(
              (category) => _buildCategoryItem(
                category['name'] as String,
                category['amount'] as String,
                category['percent'] as double,
                category['color'] as Color,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildCategoryItem(
    String name,
    String amount,
    double percent,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.category, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(percent * 100).toStringAsFixed(0)}% of total',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    final transactions = [
      {
        'title': 'Starbucks Coffee',
        'category': 'Food',
        'amount': '-₹450',
        'date': 'Today',
        'icon': Icons.local_cafe,
        'color': AppColors.categoryFood,
      },
      {
        'title': 'Uber Ride',
        'category': 'Transport',
        'amount': '-₹280',
        'date': 'Today',
        'icon': Icons.directions_car,
        'color': AppColors.categoryTransport,
      },
      {
        'title': 'Salary Deposit',
        'category': 'Income',
        'amount': '+₹65,400',
        'date': 'Yesterday',
        'icon': Icons.account_balance_wallet,
        'color': AppColors.income,
      },
      {
        'title': 'Amazon Purchase',
        'category': 'Shopping',
        'amount': '-₹2,350',
        'date': 'Yesterday',
        'icon': Icons.shopping_bag,
        'color': AppColors.categoryShopping,
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [AppColors.cardShadow],
      ),
      child: Column(
        children: transactions
            .map(
              (transaction) => _buildTransactionItem(
                transaction['title'] as String,
                transaction['category'] as String,
                transaction['amount'] as String,
                transaction['date'] as String,
                transaction['icon'] as IconData,
                transaction['color'] as Color,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTransactionItem(
    String title,
    String category,
    String amount,
    String date,
    IconData icon,
    Color color,
  ) {
    final isIncome = amount.startsWith('+');
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        '$category • $date',
        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: isIncome ? AppColors.income : AppColors.expense,
        ),
      ),
    );
  }
}
