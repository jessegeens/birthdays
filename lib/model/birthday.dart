class Birthday {
  String id;
  String name;
  DateTime date;

  Birthday(this.id, this.name, this.date);

  bool get isToday => (
       this.date.month == DateTime.now().month
    && this.date.day == DateTime.now().day
  );
}