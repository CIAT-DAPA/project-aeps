package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * UserEntity generated by hbm2java
 */
@Entity
@Table(name="agents_association")
public class AgentsAssociation  implements java.io.Serializable {


    private Integer idAgeAsc;    
    private Association association;
    private ExtensionAgents extensionAgents;

    public AgentsAssociation() {
    }

	
    public AgentsAssociation(Association association, ExtensionAgents extensionAgents) {
        this.association = association;
        this.extensionAgents = extensionAgents;
    }
    
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_age_asc", unique=true, nullable=false)
    public Integer getIdAgeAsc() {
        return idAgeAsc;
    }

    public void setIdAgeAsc(Integer idAgeAsc) {
        this.idAgeAsc = idAgeAsc;
    }
     
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_asso_age_asc")
    public Association getAssociation() {
        return association;
    }

    public void setAssociation(Association association) {
        this.association = association;
    }


@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_agent_age_asc")
    public ExtensionAgents getExtensionAgents() {
        return extensionAgents;
    }

    public void setExtensionAgents(ExtensionAgents extensionAgents) {
        this.extensionAgents = extensionAgents;
    }    

}


