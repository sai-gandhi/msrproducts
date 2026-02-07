
package com.mkproducts.project.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "Temporary_Customer")
public class TemporaryCustomer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "temp_id")
    private int id;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "email", nullable = false, unique = true, length = 55)
    private String email;

    @Column(name = "password", nullable = false, length = 15)
    private String password;

    @Column(name = "location", nullable = false, length = 50)
    private String location;

    @Column(name = "contact", nullable = false, unique = true, length = 10)
    private String contact;

    @Column(name = "otp", nullable = false, length = 6)
    private String otp;

    @Column(name = "otp_expiry", nullable = false)
    private Timestamp otpExpiry;

    // Getters & Setters
    public int getId()
    { 
    	return id; 
    }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getOtp() { return otp; }
    public void setOtp(String otp) { this.otp = otp; }

    public Timestamp getOtpExpiry() { return otpExpiry; }
    public void setOtpExpiry(Timestamp otpExpiry) { 
    	this.otpExpiry = otpExpiry; 
    }
}
