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

  Future<List<Topic>> getRecent(TopicDao topicDao) async {
    var result = await topicDao.getAllTopics();
    if (result.length <= 10) return result;
      else {
        var topics = result.getRange(result.length -  10, result.length);
        List<Topic> newResult = topics;
        return newResult;
      }
  }
}