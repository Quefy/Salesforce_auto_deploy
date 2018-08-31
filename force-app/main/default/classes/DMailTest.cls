@isTest
private class DMailTest {
    @isTest
    static void doTest(){
        DMail tMail = new DMail();

        tMail.setMail('tydsharp@outlook.jp');
        system.assertEquals('tydsharp@outlook.jp',tMail.mail);
        system.assertEquals(false,tMail.isBlank());
        system.assertEquals(true,tMail.isValid());
        system.assertEquals('tydsharp@outlook.jp',tMail.toString());
    }
}
