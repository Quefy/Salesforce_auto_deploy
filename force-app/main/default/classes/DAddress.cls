public class DAddress implements InterfaceDataCheck{
    public String postalCode   {set;get;}
    public String address      {set;get;}
	
    public void setAddress(String address){
        List<String> parts = address.split('/');
        if(parts.size() == 2){
            this.postalCode = parts.get(0);
            this.address = parts.get(1);
        } else {
            this.postalCode = '';
            this.address = '';
        }
    }
    
    public Boolean isBlank(){
        return false;
    }
    
    public Boolean isValid(){
		return true;
    }    
    
    public override String toString(){
        return this.postalCode + '/' + this.address;
    }
}