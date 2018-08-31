public class uiDateController {
    public String year					{get; set;}
    public String month					{get; set;}
    public String day					{get; set;}
    public List<SelectOption> yearList  {get; set;}
    public List<SelectOption> monthList {get; set;}
    public List<SelectOption> dayList   {get; set;}
    private List<Integer> monthDays;
   
    public uiDateController (){
    	Date d     = Date.today();
      	this.day   = String.valueOf(d.day());
      	this.month = String.valueOf(d.month());
      	this.year  = String.valueOf(d.year());

      	/* The Range of the day is "1~31" */
      	this.monthDays = new Integer[13];
     	this.monthDays[0] = 0;
      	this.monthDays[1] = 31;
      	this.monthDays[2] = 28;
    	this.monthDays[3] = 31;
	    this.monthDays[4] = 30;
	    this.monthDays[5] = 31;
	    this.monthDays[6] = 30;
	    this.monthDays[7] = 31;
	    this.monthDays[8] = 31;
	    this.monthDays[9] = 30;
	    this.monthDays[10] = 31;
	    this.monthDays[11] = 30;
	    this.monthDays[12] = 31;
                
	    getYearList();
	    getMonthList();
	    getDayList();      
    }

    public void updateDate(){
      Integer monthDays;
      
      if(Integer.valueOf(this.month) == 2){
      	monthDays = getFebruaryDays();
      } else {
      	monthDays =  this.monthDays[Integer.valueOf(this.month)];
      }
	  
	  if(Integer.valueOf(this.day) > monthDays){
	  	this.day = String.valueOf(monthDays);
      }
      
      getDayList();
    }
        
    private void getYearList(){
      /* The Range of the Year is "Current Year +- 100" */
      Integer startYear = Integer.valueOf(this.year) - 100;
      Integer endYear = Integer.valueOf(this.year) + 100;

      this.yearList  = new List<SelectOption>();      
      for(Integer y = startYear ; y <= endYear ; y+=1){
        this.yearList.add(new SelectOption(String.valueOf(y),String.valueOf(y)));
      }
    }
    
    private void getMonthList(){
      /* The Range of the month is "1~12" */
      this.monthList = new List<SelectOption>();
      for(Integer m = 1; m <= 12 ; m+=1){
        this.monthList.add(new SelectOption(String.valueOf(m),String.valueOf(m)));
      }
    }
    
    private void getDayList(){    
    	Integer endDay;                                
      	if(Integer.valueOf(this.month) == 2){
      		endDay = getFebruaryDays();
      	} else {
      		endDay = this.monthDays.get(Integer.valueOf(this.month)); 
      	}
      	this.dayList = new List<SelectOption>();
      	for(Integer d = 1; d <= endDay ; d+=1){
        	this.dayList.add(new SelectOption(String.valueOf(d),String.valueOf(d)));
      	}
    }
    
    private Integer getFebruaryDays(){
    	if(Date.isLeapYear(Integer.valueOf(this.year))){
    		return 29;
    	} else {
    		return 28;
    	}
    }
}