public class UserInfoViewController {
    public List<Employee> employeeList {set;get;}
   
    public void refreshUserInfo(){
        employeeList = Employee.getAllEmployee();
    }
}