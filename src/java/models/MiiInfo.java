/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kresna92
 */
@Entity
@Table(name = "MII_INFO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MiiInfo.findAll", query = "SELECT m FROM MiiInfo m")
    , @NamedQuery(name = "MiiInfo.findById", query = "SELECT m FROM MiiInfo m WHERE m.id = :id")
    , @NamedQuery(name = "MiiInfo.findByAddress", query = "SELECT m FROM MiiInfo m WHERE m.address = :address")
    , @NamedQuery(name = "MiiInfo.findByPhone", query = "SELECT m FROM MiiInfo m WHERE m.phone = :phone")
    , @NamedQuery(name = "MiiInfo.findByEmail", query = "SELECT m FROM MiiInfo m WHERE m.email = :email")})
public class MiiInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @Column(name = "ADDRESS")
    private String address;
    @Basic(optional = false)
    @Column(name = "PHONE")
    private String phone;
    @Basic(optional = false)
    @Column(name = "EMAIL")
    private String email;

    public MiiInfo() {
    }

    public MiiInfo(String id) {
        this.id = id;
    }

    public MiiInfo(String id, String address, String phone, String email) {
        this.id = id;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MiiInfo)) {
            return false;
        }
        MiiInfo other = (MiiInfo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.MiiInfo[ id=" + id + " ]";
    }
    
}
