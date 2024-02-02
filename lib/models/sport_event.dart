class SportEvent {
  final String iconUrl;
  final String league;
  final String teams;
  final String sportType;
  final String dateStarting;
  final String timeStarting;

  SportEvent({
    required this.iconUrl,
    required this.league,
    required this.teams,
    required this.sportType,
    required this.dateStarting,
    required this.timeStarting,
  });

  factory SportEvent.fromJson(Map<String, dynamic> json) {
    return SportEvent(
      iconUrl: json['iconUrl'],
      league: json['league'],
      teams: json['teams'],
      sportType: json['sportType'],
      dateStarting: json['dateStarting'],
      timeStarting: json['timeStarting'],
    );
  }
}
