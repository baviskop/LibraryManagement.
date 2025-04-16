package GUI;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import database.DataBaseConnection;

public class Login extends JFrame {
    private JLabel user, pass, images, title, eyeIcon;
    private JButton login, signup, forgotPassword;
    private JTextField username;
    private JPasswordField password;
    private JPanel panel, button_panel, extraPanel, leftPanel, topPanel;
    private ImageIcon image, eyeOpen, eyeClosed;
    private boolean isPasswordVisible = false;
    private JCheckBox showPassword;

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

        // Title top center
        topPanel = new JPanel(new BorderLayout());
        topPanel.add(title, BorderLayout.CENTER);
        this.add(topPanel, BorderLayout.NORTH);

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
        gbc.gridx = 2;
        eyeIcon.setCursor(new Cursor(Cursor.HAND_CURSOR));
        eyeIcon.addMouseListener(new MouseAdapter() {
            
            public void mouseClicked(MouseEvent e) {
                isPasswordVisible = !isPasswordVisible;
                password.setEchoChar(isPasswordVisible ? (char) 0 : '•');
                eyeIcon.setIcon(isPasswordVisible ? eyeOpen : eyeClosed);
            }
        });
        panel.add(eyeIcon, gbc);
        button_panel.add(login);
        button_panel.add(signup);
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        panel.add(button_panel, gbc);

        xoakhung(forgotPassword);
        extraPanel.add(forgotPassword, BorderLayout.NORTH);
        gbc.gridx = 0;
        gbc.gridy = 3;
        panel.add(extraPanel, gbc);

        leftPanel.add(images, BorderLayout.CENTER);

        this.add(leftPanel, BorderLayout.WEST);
        this.add(panel, BorderLayout.EAST);

        // Đăng nhập
        login.addActionListener(e -> {
            String tendangnhap = username.getText();
            char[] matkhauChars = password.getPassword();
            String matkhau = new String(matkhauChars);
            boolean LoginCheckResult = LoginCheck(tendangnhap, matkhau);
            if (LoginCheckResult) {
                JOptionPane.showMessageDialog(Login.this, "Đăng nhập thành công!", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
                Login.this.dispose();
            } else {
                JOptionPane.showMessageDialog(Login.this, "Sai tên đăng nhập hoặc mật khẩu!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        });

        signup.addActionListener(e -> dangki());

        forgotPassword.addActionListener(e -> quenmatkhau());
    }

    public void dinhnghia() {
        image = new ImageIcon("src/images/login-graphic.png");
        images = new JLabel(image);

        user = new JLabel("Tên đăng nhập");
        pass = new JLabel("Mật khẩu");

        username = new JTextField(20);
        password = new JPasswordField(20);
        password.setEchoChar('•');

        eyeOpen = new ImageIcon("src/images/eye-open.png");
        eyeClosed = new ImageIcon("src/images/eye-closed.png");
        eyeIcon = new JLabel(eyeClosed);

        login = new JButton("Đăng nhập");
        signup = new JButton("Đăng kí");
        forgotPassword = new JButton("Quên mật khẩu?");

        panel = new JPanel(new GridBagLayout());
        button_panel = new JPanel();
        extraPanel = new JPanel(new BorderLayout());
        leftPanel = new JPanel(new BorderLayout());

        title = new JLabel("HỆ THỐNG ĐĂNG NHẬP");
        title.setFont(new Font("Arial", Font.BOLD, 28));
        title.setHorizontalAlignment(SwingConstants.CENTER);
    }

    private void xoakhung(JButton button) {
        button.setBorder(null);
        button.setContentAreaFilled(false);
        button.setForeground(Color.BLUE);
        button.setCursor(new Cursor(Cursor.HAND_CURSOR));
    }

    public boolean LoginCheck(String tendangnhap, String matkhau) {
        boolean isValid = false;
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "SELECT * FROM Login WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, tendangnhap);
            stmt.setString(2, matkhau);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) isValid = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public void dangki() {
        String username = JOptionPane.showInputDialog("Nhập tên đăng nhập:");
        String password = JOptionPane.showInputDialog("Nhập mật khẩu:");

        if (checkIfUserExists(username)) {
            JOptionPane.showMessageDialog(this, "Tên đăng nhập đã tồn tại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        } else {
            try (Connection conn = DataBaseConnection.getConnection()) {
                String sql = "INSERT INTO Login (username, password) VALUES (?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.executeUpdate();

                JOptionPane.showMessageDialog(this, "Tạo tài khoản thành công!", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
            } catch (SQLException e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Lỗi khi tạo tài khoản.", "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private boolean checkIfUserExists(String username) {
        boolean exists = false;
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "SELECT * FROM Login WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) exists = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    public void quenmatkhau() {
        String username = JOptionPane.showInputDialog("Nhập tên đăng nhập:");

        if (!checkIfUserExists(username)) {
            JOptionPane.showMessageDialog(this, "Tên đăng nhập không tồn tại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        } else {
            String newPassword = JOptionPane.showInputDialog("Nhập mật khẩu mới:");
            try (Connection conn = DataBaseConnection.getConnection()) {
                String sql = "UPDATE Login SET password = ? WHERE username = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, newPassword);
                stmt.setString(2, username);
                stmt.executeUpdate();

                JOptionPane.showMessageDialog(this, "Mật khẩu đã được thay đổi thành công!", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
            } catch (SQLException e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Lỗi khi cập nhật mật khẩu.", "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    public static void main(String[] args) {
        new Login();
    }
}
