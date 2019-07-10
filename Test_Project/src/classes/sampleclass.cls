public class sampleclass {
    public Account acc {get;set;}
    public String SampleTest {get;set;}
    public sampleclass(){
        acc = [select Id, Name from Account limit 1];
    }
}