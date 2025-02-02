package app.classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BillingDetails {

    private int id;
    private int userId;
    private String firstName;
    private String lastName;
    private String companyName;
    private String address;
    private String province;
    private String zipCode;
    private String phone;
    private String email;
    private String additionalInfo;
    private Timestamp createdAt;

    // Constructors
    public BillingDetails() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Database operations
    public boolean save(Connection conn) {
        try {
            String query = "INSERT INTO billing_details (user_id, first_name, last_name, company_name, "
                    + "address, province, zip_code, phone, email, additional_info) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, this.userId);
            pstmt.setString(2, this.firstName);
            pstmt.setString(3, this.lastName);
            pstmt.setString(4, this.companyName);
            pstmt.setString(5, this.address);
            pstmt.setString(6, this.province);
            pstmt.setString(7, this.zipCode);
            pstmt.setString(8, this.phone);
            pstmt.setString(9, this.email);
            pstmt.setString(10, this.additionalInfo);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(BillingDetails.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static BillingDetails getByUserId(Connection conn, int userId) {
        try {
            String query = "SELECT * FROM billing_details WHERE user_id = ? ORDER BY created_at DESC LIMIT 1";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                BillingDetails billing = new BillingDetails();
                billing.setId(rs.getInt("id"));
                billing.setUserId(rs.getInt("user_id"));
                billing.setFirstName(rs.getString("first_name"));
                billing.setLastName(rs.getString("last_name"));
                billing.setCompanyName(rs.getString("company_name"));
                billing.setAddress(rs.getString("address"));
                billing.setProvince(rs.getString("province"));
                billing.setZipCode(rs.getString("zip_code"));
                billing.setPhone(rs.getString("phone"));
                billing.setEmail(rs.getString("email"));
                billing.setAdditionalInfo(rs.getString("additional_info"));
                billing.setCreatedAt(rs.getTimestamp("created_at"));
                return billing;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BillingDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
