class ApiUrl {
  static const PROD = 'https://randomuser.me/api/0.4/?randomapi';
}

class StatusCodes {
  static const UNKNOWN_ERROR = 1,
      SUCCESS = 200,
      TOKEN_INVALID = 2,
      AUTH_ERROR = 3,
      MISSING_AUTH_TOKEN = 4,
      ITEM_NOT_FOUND = 5,
      NOT_AUTHORIZED = 401,
      BAD_REQUEST = 400,
      PERMISSION_DENIED = 403,
      NOT_CONVERSATION_MEMBER = 7,
      USER_UNAVAILABLE = 8,
      BAD_REPORTING_REQUEST = 9,
      NOT_ALLOWED_SEND_MESSAGE = 10,
      FETCH_DATA = 11,
      NETWORK_TIMEOUT = 12;
}
