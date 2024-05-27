import currency.*;
import time.*;
import distance.*;
public class conversions {
    public static void main(String[] args) {
        currency c = new currency();
        distance d = new distance();
        time t = new time();

        c.dtr();
        c.rtd();
        c.eurotorupee();
        c.rupeetoeuro();
        c.rupeetoyen();
        c.yentorupee();

        d.kmtom();
        d.kmtomiles();
        d.milestokm();
        d.mtokm();
        d.milestokm();
        
        t.hourstominutes();
        t.minutestohours();
        t.hourstoseconds();
        t.secondstohours();
    }
}
