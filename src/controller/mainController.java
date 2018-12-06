package controller;



import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.session.eBanqueEjbSessionLocal;
import metier.entities.*;

@WebServlet(name="mainController",
loadOnStartup = 1,
urlPatterns = {"/",
			   "/authentification",
			   "/acceuil",
			   "/clients",
			   "/employes",
			   "/deconnecter",
               "/operations"})

public class mainController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	@EJB 
	private eBanqueEjbSessionLocal eBanque; 
	
    public mainController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		String toPage ="/WEB-INF/404.jsp";
		String userPath = request.getServletPath();
		String msgError = "error message";
		String msgSuccess = "success message";

		
		if (userPath.equals("/")) 
		{
			toPage = "/WEB-INF/Authentification.jsp";
		}
		else
		if (userPath.equals("/acceuil"))
		{
			toPage = "/WEB-INF/Acceuil.jsp";
		}
		else
		if (userPath.equals("/authentification")) 
        {
        	if(request.getParameter("identifiant")!=null && request.getParameter("motpasse")!=null)
        	{
				String login = request.getParameter("identifiant").toString();
	        	String password = request.getParameter("motpasse").toString();
	        	try
	        	{
	            	Employe EMPLOYE = eBanque.consulterAuthentification(login, password);
	            	if(EMPLOYE != null)
	            	{
	            		HttpSession session = request.getSession();
	            		session.setAttribute("EMPLOYE", EMPLOYE);
	            		
	            		//cette operation de "sendRedirect" ce catch dans la section doGET !
	            		response.sendRedirect("acceuil");
	            	}
	            	else
	            	{
	            		msgError= "Login ou mot de passe invalide, Ou connexion au serveur n'est pas établie!</br>*Vérifier si le serveur est démarré.";
	            		request.setAttribute("msgError", msgError);
	            		toPage = "/WEB-INF/Authentification.jsp";
	            	}
	        	}
	        	catch(RuntimeException ex)
	            {   
	        		msgError= "Login ou mot de passe invalide, Ou connexion au serveur n'est pas établie!</br>*Vérifier si le serveur est démarré.";
	        		request.setAttribute("msgError", msgError);
	        		toPage = "/WEB-INF/Authentification.jsp";
	            }
        	}
        	else
        		toPage = "/WEB-INF/Authentification.jsp";
		}
		else
		if(userPath.equals("/operations"))
		{	
			if(request.getSession().getAttribute("EMPLOYE")==null)
				response.sendRedirect("authentification");
			
			try
			{
				String action = request.getParameter("submit");
				if(action != null)
				if(action.equals("Verser"))
				{ 
					Double montant = Double.parseDouble(request.getParameter("montant")); 
					String num = request.getParameter("numCompte").toString(); 
					
					Operation opV = new Versement(new Date(), montant);
					Employe emp = (Employe)request.getSession().getAttribute("EMPLOYE");
		            eBanque.addOperation(opV, num, emp.getNumEmploye());
		            msgSuccess = "L'opération de versement est passée avec succes.";
		            request.setAttribute("msgSuccess", msgSuccess);
				}
				else
				if(action.equals("Retirer"))
				{
					Double montant = Double.parseDouble(request.getParameter("montant")); 
					String num = request.getParameter("numCompte").toString(); 
					
					Operation opR = new Retrait(new Date(), montant);
					Employe emp = (Employe)request.getSession().getAttribute("EMPLOYE");
		            eBanque.addOperation(opR, num, emp.getNumEmploye());
		            msgSuccess = "L'opération de retrait est passée avec succes.";
		            request.setAttribute("msgSuccess", msgSuccess);
				}
				else
				if(action.equals("Transferer"))
				{	
					Employe emp = (Employe)request.getSession().getAttribute("EMPLOYE");
	
					Double montant = Double.parseDouble(request.getParameter("montant")); 
					String num1 = request.getParameter("numCompte1").toString(); 
					String num2 = request.getParameter("numCompte2").toString(); 
					
					Operation opR = new Retrait(new Date(), montant);
		            eBanque.addOperation(opR, num1, emp.getNumEmploye());
		            
		            Operation opV = new Versement(new Date(), montant);
		            eBanque.addOperation(opV, num2, emp.getNumEmploye());
		            msgSuccess = "L'opération du virement est passée avec succes.";
		            request.setAttribute("msgSuccess", msgSuccess);
				}
			}
			catch(RuntimeException ex)
			{
				msgError = "L'opération a echoué !";
				request.setAttribute("msgError", msgError);
			}
			
    		request.setAttribute("listeComptes", eBanque.consulterComptes());
			toPage = "/WEB-INF/Operations.jsp";
		}
		else
		if(userPath.equals("/clients"))
		{
			if(request.getSession().getAttribute("EMPLOYE")==null)
				response.sendRedirect("authentification");
			
			try
			{
				String action = request.getParameter("submit");
				if(action != null)
				if(action.equals("Créer le compte"))
				{	
					Double solde = Double.parseDouble(request.getParameter("solde"));
					Double td = Double.parseDouble(request.getParameter("td"));
					Long codeCl = Long.parseLong(request.getParameter("client"));
					Employe e = (Employe)request.getSession().getAttribute("EMPLOYE");
					
					if(request.getParameter("typeCompte").toString().equals("C"))
					{
						Compte c = new CompteCourant(new Date(), solde, td);
			            eBanque.addCompte(c, codeCl, e.getNumEmploye());
					}
					else
					{
						Compte c = new CompteEpargne(new Date(), solde, td);
			            eBanque.addCompte(c, codeCl, e.getNumEmploye());
					}
					
		            msgSuccess="Compte crée avec succes.";
		            request.setAttribute("msgSuccess", msgSuccess);
				}
				else
				if(action.equals("Créer le client"))
				{
					Client client = new Client(request.getParameter("npClient"));  
		            eBanque.addClient(client);
		            msgSuccess="Client crée avec succes.";
		            request.setAttribute("msgSuccess", msgSuccess);
				}
			}
			catch(RuntimeException ex)
			{
				msgError = "Erreur lors de la création!";
				request.setAttribute("msgError", msgError);
			}
			
			request.setAttribute("listeClients", eBanque.consulterClients());
			request.setAttribute("listeComptes", eBanque.consulterComptes());
			
			toPage = "/WEB-INF/Clients.jsp";
		}
		else
		if(userPath.equals("/deconnecter"))
		{
			request.getSession().removeAttribute("EMPLOYE");
			response.sendRedirect("authentification");
		}
		
		try 
        {
            this.getServletContext().getRequestDispatcher(toPage).forward(request, response);
        } 
        catch (Exception ex) {}
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
