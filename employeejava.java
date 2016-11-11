class Employee{
public static void main(String args[]){
int employeeNumber[]={1001,1002,1003,1004,1005,1006,1007};
String employeeName[]={"Ashish","Sushma","Rahul","Chahat","Ranjan","Suman",
"Tanmay"};
String joinDate[]={"01/04/2009","23/08/2012","12/11/2008","29/01/2013",
"16/07/2005","1/1/2000","12/06/2006"};
char designationCode[]={'e','c','k','r','m','e','c'};
String department[]={"R&D","PM","Acct","FrontDesk","Engg",
"Manufactring","PM"};
int basic[]={20000,30000,10000,12000,6000,20000,9000,12000};
int hra[]={8000,12000,8000,6000,20000,9000,12000};
int IT[]={3000,9000,1000,2000,20000,4400,10000};
int index=0;
char desig;
int dA=0;
int salary=0;
int flag=1;
String designation="ab";
int number=Integer.parseInt(args[0]);
System.out.println("Employee numer: "+number);
for(int i=0;i<7;i++){
if(number==employeeNumber[i]){
index=i;
flag=0;
}
}
if(flag==1)
System.out.println("There is no employee with employee id");
else
{
desig=designationCode[index];
switch(desig)
{
case 'e': dA=20000;
designation="Engineer";
break;
case 'c': dA=32000;
designation="Consultant";
break;
case 'k': dA=12000;
designation="Clerk";
break;
case 'r': dA=15000;
designation="Receptionist";
break;
case 'm' :dA=40000;
designation="Manager";
break;
}
salary=basic[index]+hra[index]-IT[index]+dA;
System.out.println("EmpNo EmpName Dept Desig Salary");
System.out.println(employeeNumber[index]+" "+employeeName[index]+"
"+department[index]+" "+designation+""+salary);
}
}}
