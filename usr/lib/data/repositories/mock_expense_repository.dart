import 'package:uuid/uuid.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';

class MockExpenseRepository implements ExpenseRepository {
  final List<Expense> _expenses = [];

  MockExpenseRepository() {
    _generateMockData();
  }

  void _generateMockData() {
    final now = DateTime.now();
    final uuid = Uuid();
    
    _expenses.addAll([
      Expense(
        id: uuid.v4(),
        amount: 12.50,
        date: now,
        categoryId: '1', // Food
        note: 'Lunch at cafe',
      ),
      Expense(
        id: uuid.v4(),
        amount: 45.00,
        date: now.subtract(const Duration(hours: 4)),
        categoryId: '3', // Shopping
        note: 'Groceries',
      ),
      Expense(
        id: uuid.v4(),
        amount: 2.50,
        date: now.subtract(const Duration(days: 1)),
        categoryId: '2', // Transport
        note: 'Bus ticket',
      ),
      Expense(
        id: uuid.v4(),
        amount: 120.00,
        date: now.subtract(const Duration(days: 2)),
        categoryId: '5', // Bills
        note: 'Electricity Bill',
      ),
      Expense(
        id: uuid.v4(),
        amount: 30.00,
        date: now.subtract(const Duration(days: 5)),
        categoryId: '4', // Entertainment
        note: 'Cinema',
      ),
    ]);
  }

  @override
  Future<List<Expense>> getExpenses() async {
    await Future.delayed(const Duration(milliseconds: 800));
    // Return sorted by date descending
    _expenses.sort((a, b) => b.date.compareTo(a.date));
    return List.from(_expenses);
  }

  @override
  Future<void> addExpense(Expense expense) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _expenses.add(expense);
  }

  @override
  Future<void> deleteExpense(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _expenses.removeWhere((e) => e.id == id);
  }

  @override
  Future<List<Expense>> getExpensesByDateRange(DateTime start, DateTime end) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _expenses.where((e) => 
      e.date.isAfter(start) && e.date.isBefore(end)
    ).toList();
  }
}
