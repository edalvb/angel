/// A representation of the abstract "rate-limiting window" in which
/// a [user] is accessing some API or endpoint.
class RateLimitingWindow<User> {
  /// The user who is accessing the endpoint.
  final User user;

  /// The time at which the user's current window began.
  final DateTime start;

  /// The number of points the user has already consumed within
  /// the current window.
  final int pointsConsumed;

  /// The maximum amount of points allowed within a single window.
  ///
  /// This field is typically only set by the [RateLimiter] middleware,
  /// and is therefore optional in the constructor.
  final int pointLimit;

  /// The amount of points the user can consume before hitting the
  /// rate limit for the current window.
  ///
  /// This field is typically only set by the [RateLimiter] middleware,
  /// and is therefore optional in the constructor.
  final int remainingPoints;

  /// The time at which the window will reset.
  ///
  /// This field is typically only set by the [RateLimiter] middleware,
  /// and is therefore optional in the constructor.
  final DateTime resetsAt;

  RateLimitingWindow(this.user, this.start, this.pointsConsumed,
      {this.pointLimit, this.remainingPoints, this.resetsAt});
}
