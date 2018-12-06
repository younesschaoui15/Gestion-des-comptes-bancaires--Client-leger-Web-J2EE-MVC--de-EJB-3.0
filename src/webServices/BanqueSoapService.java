package webServices;


import java.util.*;
import javax.ejb.EJB; 
import javax.jws.*; 
import metier.entities.Compte; 
import metier.session.eBanqueEjbSessionLocal; 

@WebService 
public class BanqueSoapService
{ 
	@EJB
	private eBanqueEjbSessionLocal metier; 
	@WebMethod 
	@Oneway 
	public void addCompte(@WebParam(name="solde") double solde)
	{ 
//		metier.addCompte(new Compte(null,solde,new Date())); 
	} 
	public List<Compte> consulterComptes()
	{ 
		return metier.consulterComptes(); 
	} 
}
