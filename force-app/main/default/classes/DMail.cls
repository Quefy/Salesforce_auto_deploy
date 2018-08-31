public class DMail implements InterfaceDataCheck{
    public String mail   {set;get;}
    
    public DMail(){}
   
    public void setMail(String mail){
        this.mail = mail;
    }
    
    public Boolean isBlank(){
        return false;
    }
    
    public Boolean isValid(){
		return true;
    }
    
    public override String toString(){
        return mail;
    }
}