public class Employee {
    public String       eId             {get;set;}
    public String       eNo             {get;set;}
    public DName		eName			{get;set;}
    public DPhoneNumber	ePhoneNumber	{get;set;}
    public DMail		eMail			{get;set;}
    public DAddress		eAddress		{get;set;}
    public DDate        eBirthDay       {get;set;}
    
    public static List<Employee> getAllEmployee(){
        List<Employee__c> allEmployee = [SELECT Id,Name,Name__c,Mail__c,PhoneNumber__c,Address__c,Birthday__c FROM Employee__c ORDER BY Name];
        List<Employee> newAllEmployee = new List<Employee>();
        for(Employee__c employee : allEmployee){
            Employee ne = new Employee();
            ne.eId = employee.Id;
            ne.eNo = employee.Name;
            ne.eName.setName(employee.Name__c);
            ne.ePhoneNumber.setPhoneNumber(employee.PhoneNumber__c);
            ne.eMail.setMail(employee.Mail__c);
            ne.eAddress.setAddress(employee.Address__c);
            ne.eBirthDay.setDate(employee.Birthday__c);
            newAllEmployee.add(ne);
        }
		return newAllEmployee;
    }
    
    public Employee(){
        eName 			= new DName();
        ePhoneNumber	= new DPhoneNumber();
        eMail			= new DMail();
        eAddress		= new DAddress();
        eBirthday       = new DDate();
    }
   
    public void save(){
        if(true == this.isBlank()){
           //something error message
           return;
        }
        if(false == this.isValid()){
			//something error message            
        }
        
        Employee__c employee = new Employee__c();
        employee.Name__c = eName.toString();
        employee.Mail__c = eMail.toString();
        employee.PhoneNumber__c = ePhoneNumber.toString();
        employee.Address__c = eAddress.toString();
        employee.Birthday__c = eBirthday.toString();
        
        try{
	        insert employee;        
        } catch(Exception e){
            
        }
    }
    
    public void renewal(){
        List<Employee__c> rs = [SELECT Id,Name,Name__c,Mail__c,PhoneNumber__c,Address__c,Birthday__c FROM Employee__c WHERE Id=:this.eId];
        if(rs.size() > 0){
            Employee__c employee = rs.get(0);
        	employee.Name__c = eName.toString();
        	employee.Mail__c = eMail.toString();
        	employee.PhoneNumber__c = ePhoneNumber.toString();
        	employee.Address__c = eAddress.toString();
        	employee.Birthday__c = eBirthday.toString();
            
            update employee;
        }
    }
    
    private Boolean isBlank(){
        return false;
    }
    
    private Boolean isValid(){
        return true;
    }
}