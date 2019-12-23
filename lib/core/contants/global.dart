const int MAX_ITEM_PER_REQUEST = 20;

enum ServiceType {
  USER_SERVICE,
}

enum RepositoryType {
  APP_CLIENT_REPOSITORY,
  USER_REPOSITORY,
}

enum ViewState { LOADING, NO_DATA, NO_NETWORK, SHOW_DATA }

enum Flavor { PROD }

class CacheKeys {
  static const JWT = 'jwt';
  static const USER_PROFILE = 'user_profile';
  static const USER_SELECTION = 'user_selection';
}
