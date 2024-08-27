// Expense class
class Expense {
  String title;
  double amount;
  String category;
  String date;

  Expense(this.title, this.amount, this.category, this.date);

  @override
  String toString() {
    return 'Title: $title, Amount: \$$amount, Category: $category, Date: $date';
  }
}
