import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Solution {
	public static void main(String args[]) throws IOException {
     BufferedReader bf=new BufferedReader(new InputStreamReader(System.in));
     System.out.println("1.circle\n2.triangle\n3.rectangle");
     System.out.println("enter your choice");
     int choice=Integer.parseInt(bf.readLine());
     switch(choice){
     	case 1:
     	System.out.println(".........Circle area....");
     	System.out.println("enter radius");
     	Circle circle = new Circle();
     	circle.radius = Double.parseDouble(bf.readLine());
     	circle.area();
     	break;
     	case 2:
     	System.out.println("........Triangle area....");
     	System.out.println("enter base and hight");
     	Triangle triangle = new Triangle();
     	triangle.base = Double.parseDouble(bf.readLine());
     	triangle.height = Double.parseDouble(bf.readLine());
     	triangle.area();
     	break;
     	case 3:
     	System.out.println("..........Rectangle area....");
     	System.out.println("enter length and breath");
     	Rectangle rectangle=new Rectangle();
     	rectangle.length = Double.parseDouble(bf.readLine());
     	rectangle.breath = Double.parseDouble(bf.readLine());
     	rectangle.area();

     }
	}
}