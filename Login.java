package GUI;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
public class Login extends JFrame {
    private JLabel user, pass, images;
    private JButton login, signup, forgotPassword, createAccount;
    private JTextField username;
    private JPasswordField password;
    private JPanel panel, button_panel, extraPanel, leftPanel;
    private ImageIcon image;

    public Login() {
        init();
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
    }

    public void init() {
        dinhnghia();
        this.setTitle("Đăng nhập");
        this.setSize(925, 550);
        this.setLayout(new BorderLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.HORIZONTAL;

        gbc.gridx = 0;
        gbc.gridy = 0;
        panel.add(user, gbc);
        gbc.gridx = 1;
        panel.add(username, gbc);
        gbc.gridx = 0;
        gbc.gridy = 1;
        panel.add(pass, gbc);
        gbc.gridx = 1;
        panel.add(password, gbc);

        button_panel.add(login);
        button_panel.add(signup);
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        panel.add(button_panel, gbc);
        xoakhung(forgotPassword);
        xoakhung(createAccount);
        extraPanel.add(forgotPassword, BorderLayout.NORTH);
        extraPanel.add(createAccount, BorderLayout.SOUTH);
        gbc.gridx = 0;
        gbc.gridy = 3;
        panel.add(extraPanel, gbc);

        leftPanel.add(images, BorderLayout.CENTER);

        this.add(leftPanel, BorderLayout.WEST);
        this.add(panel, BorderLayout.EAST);
        login.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String tendangnhap = username.getText();
                char[] matkhau = password.getPassword();
                if (tendangnhap.equals("admin") && new String(matkhau).equals("1234")) {
                    JOptionPane.showMessageDialog(Login.this, "Đăng nhập thành công!", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
                    Login.this.dispose();
 //                   new GD_QL();
                } else {
                    JOptionPane.showMessageDialog(Login.this, "Sai tên đăng nhập hoặc mật khẩu!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    }

    public void dinhnghia() {

        String imagePath = "C:/Users/LOQ/Documents/DACS1/src/GUI/R.png";

  
   

        images = new JLabel(image);

        user = new JLabel("Tên đăng nhập");
        pass = new JLabel("Mật khẩu");
        username = new JTextField(20);
        password = new JPasswordField(20);
        login = new JButton("Đăng nhập");
        signup = new JButton("Đăng kí");
        forgotPassword = new JButton("Quên mật khẩu?");
        createAccount = new JButton("Tạo tài khoản");

        panel = new JPanel(new GridBagLayout());
        button_panel = new JPanel();
        extraPanel = new JPanel(new BorderLayout());
        leftPanel = new JPanel(new BorderLayout());
    }
    private void xoakhung(JButton button) { 
    	button.setBorder(null);
    	button.setContentAreaFilled(false);
        button.setForeground(Color.BLACK); 
        button.setCursor(new Cursor(Cursor.HAND_CURSOR)); }
    
    public static void main(String[] args) {
        new Login();
    }
}
