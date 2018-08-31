@isTest
private class DDateTest {
    @isTest
    static void doTest(){
        DDate tDate = new DDate();

        tDate.setDate('2018/08/29');
        system.assertEquals('2018',tDate.year);
        system.assertEquals('08',tDate.month);
        system.assertEquals('29',tDate.day);

        system.assertEquals(false,tDate.isBlank());
        system.assertEquals(true,tDate.isValid());
        system.assertEquals('2018/08/29',tDate.toString());

        tDate.setDate('');
        system.assert(String.isEmpty(tDate.year));
        system.assert(String.isEmpty(tDate.month));
        system.assert(String.isEmpty(tDate.day));        
    }
}
