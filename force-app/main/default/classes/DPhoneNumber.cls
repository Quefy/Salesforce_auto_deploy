public class DPhoneNumber implements InterfaceDataCheck{
    public String phoneNumber   {get;set;}
    
    public void setPhoneNumber(String phoneNumber){
        this.phoneNumber = phoneNumber;
    }

    public Boolean isBlank(){
        return false;
    }
    
    public Boolean isValid(){
		return true;
    }
    
    public override String toString(){
        return this.phoneNumber;
    }
	    
}