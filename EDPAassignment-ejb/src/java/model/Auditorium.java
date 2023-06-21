/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Eric
 */
@Entity
public class Auditorium implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    private String Aname;
    private String Loc;
    private int cap;
    private String stat;
    private String FM;

    public Auditorium() {
    }

    public Auditorium(String Aname, String Loc, int cap, String stat, String FM) {
        this.Aname = Aname;
        this.Loc = Loc;
        this.cap = cap;
        this.stat = stat;
        this.FM = FM;
    }

    public String getFM() {
        return FM;
    }

    public void setFM(String FM) {
        this.FM = FM;
    }

    
    public String getStat() {
        return stat;
    }

    public void setStat(String stat) {
        this.stat = stat;
    }

    public String getAname() {
        return Aname;
    }

    public void setAname(String Aname) {
        this.Aname = Aname;
    }

    public String getLoc() {
        return Loc;
    }

    public void setLoc(String Loc) {
        this.Loc = Loc;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
        if (!(object instanceof Auditorium)) {
            return false;
        }
        Auditorium other = (Auditorium) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Auditorium[ id=" + id + " ]";
    }

}
