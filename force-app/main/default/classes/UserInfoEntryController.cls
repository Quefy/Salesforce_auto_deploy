public class UserInfoEntryController {
    public Employee employee    {get;set;}
    public String pageMessage   {get;set;}
    public Boolean isEditMode   {get;set;}
        
    public UserInfoEntryController(){
        employee = new Employee();
        system.debug('UserInfoEntryController called');
    }
    
    public UserInfoEntryController(ApexPages.StandardController standard){
        system.debug('standard controller called');
        this.employee = new Employee();
        this.isEditMode = false;
        
        String employeeId = standard.getId();
        system.debug('employeeId =' + employeeId);
        if(employeeId != null || employeeId != ''){
            List<Employee__c> cml = [SELECT Id,Name,Name__c,Mail__c,Address__c,PhoneNumber__c,Birthday__c FROM Employee__c WHERE Id=:employeeId];
            if(cml.size() > 0){
                Employee__c cEmployee = cml.get(0);
                this.employee.eId = cEmployee.Id;
                this.employee.eNo = cEmployee.Name;            
                this.employee.eName.setName(cEmployee.Name__c);
                this.employee.eMail.setMail(cEmployee.Mail__c);
                this.employee.eAddress.setAddress(cEmployee.Address__c);
                this.employee.ePhoneNumber.setPhoneNumber(cEmployee.PhoneNumber__c);
                this.employee.eBirthday.setDate(cEmployee.Birthday__c);
                this.isEditMode = true;                
            }
        }
    }
    
    public void saveUserInfo(){
        if(this.isEditMode == true){
            this.employee.renewal();
        } else {
            this.employee.save();
        }
        
        employee = null;
        employee = new Employee();
        this.pageMessage = '社員情報を登録しました。';
    }
}