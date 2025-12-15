class AppUrls {
  const AppUrls._();

  static const String baseUrl = 'https://api.stackexchange.com/2.3/';

}

class AppEndpoints {
  const AppEndpoints._();

  // Endpoints
  static const String users = 'users';

  static String reputationHistory(String userId) =>
      'users/$userId/reputation-history';

}

class AppStrings {
  const AppStrings._();

  static const String appName = 'Oivan App';
  static const String usersTitle = 'Users';
  static const String bookmarksOnly = 'Bookmarked only';
  static const String bookmarks = 'Bookmarks';
  static const String noBookMarksYet = 'No bookmarks yet';
  static const String reputation = 'Reputation: ';
  static const String allUsers = 'All users';
  static const String noResults = 'No results found';
  static const String somethingWentWrong = 'Something went wrong';
}
