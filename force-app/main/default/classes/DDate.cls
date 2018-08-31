public class DDate implements InterfaceDataCheck{
    public String year    {get;set;}
    public String month   {get;set;}
    public String day     {get;set;}
    
    public void setDate(String dateStr){
    	List<String> parts = dateStr.split('/');
        if(parts.size() == 3){
            this.year = parts.get(0);
            this.month = parts.get(1);
            this.day = parts.get(2);            
        } else {
            this.year = '';
            this.month = '';
            this.day = '';    
        }
    }
    
    public Boolean isBlank(){
        return false;
    }
    
    public Boolean isValid(){
        return true;
    }
    
    public override String toString(){
        return this.year + '/' + this.month + '/' + this.day;
    }
}