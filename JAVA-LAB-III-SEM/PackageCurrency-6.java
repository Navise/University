
package currency;
import java.util.*;
public class currency {
    double inr , usd , euro , yen;
    Scanner sc = new Scanner(System.in);
    public void dtr()
    {
        System.out.println("Enter dollars to convert into rupees: ");
        usd = sc.nextDouble();
        inr = usd*80;
        System.out.println("Dollar ="+ usd + " is equal to "+ inr );
    }
    public void rtd()
    {
        System.out.println("Enter Rupee to convert into Dollars: ");
        inr = sc.nextDouble();
        usd = inr /80;
        System.out.println("Rupee ="+inr + "equal to Dollars =" +usd);
    }
    public void eurotorupee()
    {
        System.out.println("Enter euro to convert into Rupees:");
        euro=sc.nextInt();
        inr=euro*79.50;
        System.out.println("Euro ="+euro +"equal to INR="+inr);
    }
    public void rupeetoeuro()
    {
        System.out.println("Enter Rupees to convert into Euro:");
        inr=sc.nextInt();
        euro=(inr/79.50);
        System.out.println("Rupee ="+inr +"equal to Euro="+euro);
    }
    public void yentorupee()
    {
    System.out.println("Enter yen to convert into Rupees:");
    yen=sc.nextInt();
    inr=yen*0.61;
    System.out.println("YEN="+yen +"equal to INR="+inr);
    }
    public void rupeetoyen()
    {
    System.out.println("Enter Rupees to convert into Yen:");
    inr=sc.nextInt();
    yen=(inr/0.61);
    System.out.println("INR="+inr +"equal to YEN"+yen);
    }
}

