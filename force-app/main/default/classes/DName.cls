public class DName implements InterfaceDataCheck{
    public String lastName  {get;set;}
    public String firstName {get;set;}

    public void setName(String name){
        List<String> parts = name.split('/');
        if(parts.size() == 2){
	        this.lastName = parts.get(0);
    	    this.firstName = parts.get(1);            
        } else {
            this.lastName = name;
            this.firstName = '';
        }
    }
    public Boolean isBlank(){
        return false;
    }
    
    public Boolean isValid(){
        //this is a comment 12
        return true;
    }
    
    public override String toString(){
        return this.lastName + '/' + this.firstName;  
    }
}
