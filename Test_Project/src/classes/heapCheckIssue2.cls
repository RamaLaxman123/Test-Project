@isTest
private class heapCheckIssue2{
  static testMethod void myTest(){
    String tStr = 'aaaaa bbbbb ccccc ddddd eeeeee fffff ggggg 11111 22222 33333 44444';
    List<String> baseList = tStr.split(' ');
    Map<integer, List<String>> SampleMap = new Map<integer, List<String>>();
    List<String> bigList = baseList;

    SampleMap.put(1, bigList);
    List<string> myList = new list<string>(); //Declare a new list

    for (integer i=0; i<50; i++) {
      List<String> tempList = new List<String>();
      tempList = SampleMap.get(1);
      system.debug('templist: ' + tempList.size());
      system.debug(' bigList: ' + bigList.size());

      myList.addall(tempList); //original code is  bigList.addall(tempList);
    }

    system.debug('FINAL LIST SIZE OF bigList IS '+bigList.size());
    system.debug('myList IS '+mylist.size());
  }
}