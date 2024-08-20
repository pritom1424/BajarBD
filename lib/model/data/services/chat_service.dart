import 'package:bajarbd/utils/db/user_credential.dart';
import 'package:crisp_chat/crisp_chat.dart';

class ChatService {
  CrispConfig Init(String webId) {
    //CrispChatSdk().setUserEmail(email: UserCredential.emailOrPhone!);

    return CrispConfig(
      websiteID: webId,
    );
  }
}
