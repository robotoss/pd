import '../aqueduct_pd.dart';
import 'security_helper.dart';

class BasicValidator implements AuthValidator {
  @override
  List<APISecurityRequirement> documentRequirementsForAuthorizer(
      APIDocumentContext context, Authorizer authorizer,
      {List<AuthScope> scopes}) {
    return [
      APISecurityRequirement(
          {"oauth2": scopes?.map((s) => s.toString())?.toList() ?? []})
    ];
  }

  @override
  FutureOr<Authorization> validate<T>(
      AuthorizationParser<T> parser, T authorizationData,
      {List<AuthScope> requiredScope}) {
    final userId = SecurityHelper().userIdByToken(authorizationData.toString());
    if (userId != null) {
      return Authorization(
        "$userId",
        null,
        this,
      );
    }
    return null;
  }
  // @override
  // FutureOr<Authorization> validate<T>(AuthorizationParser<T> parser, T authorizationData, {List<AuthScope> requiredScope}) {}
  //   var user = await userForName(usernameAndPassword.username);
  //   if (user.password == hash(usernameAndPassword.password, user.salt)) {
  //     return Authorization(...);
  //   }

  //   // Will end up creating a 401 Not Authorized Response
  //   return null;
  // }
}
