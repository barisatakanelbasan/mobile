class Horoscope {
  String? color;
  String? compatibility;
  String? currentDate;
  String? dateRange;
  String? description;
  String? luckyNumber;
  String? luckyTime;
  String? mood;

  Horoscope(this.color, this.compatibility, this.currentDate, this.dateRange,
      this.description, this.luckyNumber, this.luckyTime, this.mood);

  Horoscope.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    compatibility = json['compatibility'];
    currentDate = json['current_date'];
    dateRange = json['date_range'];
    description = json['description'];
    luckyNumber = json['lucky_number'];
    luckyTime = json['lucky_time'];
    mood = json['mood'];
  }
}
