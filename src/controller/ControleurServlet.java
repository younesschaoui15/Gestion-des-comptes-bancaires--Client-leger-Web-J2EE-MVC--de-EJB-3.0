package controller;


import java.io.IOException; import javax.ejb.EJB; 
import javax.servlet.ServletException;import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import metier.entities.Compte; 
import metier.session.eBanqueEjbSessionLocal;

@WebServlet(name="cs",urlPatterns={"/controleur"}) 
public class ControleurServlet extends HttpServlet
{ 
	private static final long serialVersionUID = 1L;
	@EJB 
	private eBanqueEjbSessionLocal metier; 
	
	@Override 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
		try 
		{
			String action=request.getParameter("action"); 
			if(action!=null)
			{ 
				if(action.equals("Consulter"))
				{ 
					Long code=Long.parseLong(request.getParameter("code")); 
					request.setAttribute("code", code); 
//					Compte cp=metier.consulterCompte(code); 
//					request.setAttribute("compte", cp); 
				} 
				else if(action.equals("Tous Les comptes"))
					request.setAttribute("comptes", metier.consulterComptes()); 
				else if((action.equals("Verser"))||(action.equals("Retirer")))
				{ 
					double montant=Double.parseDouble(request.getParameter("montant")); 
					Long code=Long.parseLong(request.getParameter("code")); 
					request.setAttribute("montant", montant); 
					request.setAttribute("code", code); 
					
//					if(action.equals("Verser"))
//						metier.verser(code, montant); 
//					else
//						metier.retirer(code, montant); 
//					request.setAttribute("compte", metier.consulterCompte(code)); 
				}
			}
		} 
		catch (Exception e) 
		{
			request.setAttribute("exception", e.getMessage());
		} 
		request.getRequestDispatcher("VueBanque.jsp").forward(request, response); 
	}
}
