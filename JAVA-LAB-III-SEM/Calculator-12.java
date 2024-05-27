/* Program-12: Develop an applet that displays a simple message in center of the screen. Develop a simple
calculator using Swings.*/
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.awt.event.ActionListener;

public class Calculator extends JFrame implements ActionListener {
     JTextField display;
     JButton[] buttons;
     String[] buttonLabels = {
        "7", "8", "9", "+",
        "4", "5", "6", "-",
        "1", "2", "3", "*",
        "0", ".", "=", "/"
    };
     double result;
     String operator = "";
     boolean start = true;

    public Calculator() {
        setTitle("Calculator");
        setSize(400, 350);

        JPanel panel = new JPanel(new GridLayout(4, 4));

        display = new JTextField("0");
        buttons = new JButton[16];

        for (int i = 0; i < 16; i++) {
            buttons[i] = new JButton(buttonLabels[i]);
            buttons[i].addActionListener(this);
            panel.add(buttons[i]);
        }
        
        getContentPane().add(display, BorderLayout.NORTH);
        getContentPane().add(panel, BorderLayout.CENTER);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        String label = e.getActionCommand();

        if (label.equals("+")) {
            result = Double.parseDouble(display.getText());
            operator = "+";
            start = true;
        } else if (label.equals("-")) {
            result = Double.parseDouble(display.getText());
            operator = "-";
            start = true;
        } else if (label.equals("*")) {
            result = Double.parseDouble(display.getText());
            operator = "*";
            start = true;
        } else if (label.equals("/")) {
            result = Double.parseDouble(display.getText());
            operator = "/";
            start = true;
        } else if (label.equals("=")) {
            double secondOperand = Double.parseDouble(display.getText());
            if (operator.equals("+")) {
                result += secondOperand;
            } else if (operator.equals("-")) {
                result -= secondOperand;
            } else if (operator.equals("*")) {
                result *= secondOperand;
            } else if (operator.equals("/")) {
                result /= secondOperand;
            }
            display.setText("" + result);
            operator = "";
        } else {
            if (start) {
                display.setText(label);
                start = false;
            } else {
                display.setText(display.getText() + label);
            }
        }
    }
    public static void main(String[] args) {
        Calculator calc = new Calculator();    
    }
}
