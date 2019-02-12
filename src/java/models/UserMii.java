/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kresna92
 */
@Entity
@Table(name = "USER_MII")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserMii.findAll", query = "SELECT u FROM UserMii u")
    , @NamedQuery(name = "UserMii.findById", query = "SELECT u FROM UserMii u WHERE u.id = :id")
    , @NamedQuery(name = "UserMii.findByPassword", query = "SELECT u FROM UserMii u WHERE u.password = :password")
    , @NamedQuery(name = "UserMii.findByName", query = "SELECT u FROM UserMii u WHERE u.name = :name")
    , @NamedQuery(name = "UserMii.findByEmail", query = "SELECT u FROM UserMii u WHERE u.email = :email")})
public class UserMii implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @Column(name = "PASSWORD")
    private String password;
    @Basic(optional = false)
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @Column(name = "EMAIL")
    private String email;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "userMii", fetch = FetchType.LAZY)
    private Employee employee;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "userMii", fetch = FetchType.LAZY)
    private Client client;
    @JoinColumn(name = "ROLE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private RoleMii role;

    public UserMii() {
    }

    public UserMii(String id) {
        this.id = id;
    }

    public UserMii(String id, String password, String name, String email) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
    }

    public UserMii(String id, String password, String name, String email, RoleMii role) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.role = role;
    }
    

    public UserMii(String id, String password, String name, String email, Employee employee, Client client) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.employee = employee;
        this.client = client;
    }

    public UserMii(String id, String password, String name, String email, Employee employee, Client client, RoleMii role) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.employee = employee;
        this.client = client;
        this.role = role;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public RoleMii getRole() {
        return role;
    }

    public void setRole(RoleMii role) {
        this.role = role;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserMii)) {
            return false;
        }
        UserMii other = (UserMii) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.UserMii[ id=" + id + " ]";
    }
    
}
