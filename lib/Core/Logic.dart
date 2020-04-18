import '../Data/UserDB.dart';
import '../Data/OptionsDB.dart';

class AppLogic {

  Future<Propertie> getProperties() {
    var data = OptionsDatabase().getAllProperty();
    data.then((result) {
      return result.elementAt(0);
    });
    return null;
  }

  Future<List<ApiData>> getApis() {
    var data = OptionsDatabase().getAllApis();
    data.then((result) {
      return result;
    });
    return null;
  }

  void GetRecent (TopicDao topicDao) {
    var topics = topicDao.getAllTopics();
    topics.then((result) {
      if (result.length <= 10) return result;
      else result.getRange(result.length -  10, result.length);
    });
    return null;
  }
}