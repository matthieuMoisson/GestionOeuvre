package dao;

import meserreurs.MonException;
import metier.Adherent;
import metier.Proprietaire;
import persistance.DialogueBd;

import java.util.ArrayList;
import java.util.List;

public class Service {

	// Mise à jour des caractéristiques d'un adhérent
	// Le booleen indique s'il s'agit d'un nouvel adhérent, auquel cas on fait
	// une création

	public void insertAdherent(Adherent unAdherent) throws MonException {
		String mysql;

		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try {
			mysql = "insert into adherent  (nom_adherent,prenom_adherent,ville_adherent)  " + "values ('"
					+ unAdherent.getNomAdherent();
			mysql += "'" + ",'" + unAdherent.getPrenomAdherent() + "','" + unAdherent.getVilleAdherent() + "')";

			unDialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	/**
	 * 	Edit an Adherent
	 * @param adherent Adherent object that will be edited
	 * @throws MonException
	 */
	public void editAdherent(Adherent adherent) throws MonException
	{
		String mysql;
		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try
		{
			mysql = "UPDATE adherent SET "+
					"nom_adherent ='" + adherent.getNomAdherent() +"'"+
					",prenom_adherent ='" + adherent.getPrenomAdherent() +"'"+
					",ville_adherent ='" + adherent.getVilleAdherent() +"' "+
					"WHERE id_adherent ='" + adherent.getIdAdherent() +"'";
			unDialogueBd.execute(mysql);
		} catch ( MonException e)
		{
			throw e;
		}
	}

	/**
	 * 	Delete an adherent
	 * @param idAdherent id of the adherent to be deleted
	 * @throws MonException
	 */
	public void deleteAdherent(int idAdherent) throws MonException
	{
		String mysql;
		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try
		{
			mysql = "DELETE FROM adherent "+
					"WHERE id_adherent ='" + idAdherent +"'";
			unDialogueBd.execute(mysql);
		} catch ( MonException e)
		{
			throw e;
		}
	}

	// gestion des adherents
	// Consultation d'un adhérent par son numéro
	// Fabrique et renvoie un objet adhérent contenant le résultat de la requête
	// BDD
	public Adherent consulterAdherent(int numero) throws MonException {
		String mysql = "select * from adherent where id_adherent=" + numero;
		List<Adherent> mesAdh = consulterListeAdherents(mysql);
		if (mesAdh.isEmpty())
			return null;
		else {
			return mesAdh.get(0);
		}
	}

	// Consultation des adhérents
	// Fabrique et renvoie une liste d'objets adhérent contenant le résultat de
	// la requête BDD
	public List<Adherent> consulterListeAdherents() throws MonException {
		String mysql = "select * from adherent";
		return consulterListeAdherents(mysql);
	}

	private List<Adherent> consulterListeAdherents(String mysql) throws MonException {
		List<Object> rs;
		List<Adherent> mesAdherents = new ArrayList<Adherent>();
		int index = 0;
		try {
			DialogueBd unDialogueBd = DialogueBd.getInstance();
			rs = DialogueBd.lecture(mysql);
			while (index < rs.size()) {
				// On crée un stage
				Adherent unA = new Adherent();
				// il faut redecouper la liste pour retrouver les lignes
				unA.setIdAdherent(Integer.parseInt(rs.get(index + 0).toString()));
				unA.setNomAdherent(rs.get(index + 1).toString());
				unA.setPrenomAdherent(rs.get(index + 2).toString());
				unA.setVilleAdherent(rs.get(index + 3).toString());
				// On incrémente tous les 3 champs
				index = index + 4;
				mesAdherents.add(unA);
			}

			return mesAdherents;
		} catch (Exception exc) {
			throw new MonException(exc.getMessage(), "systeme");
		}
	}

	/**
	 * Get all owners
	 * @return List of all owners
	 * @throws MonException
	 */
	public List<Proprietaire> getOwners() throws MonException {
		String mysql = "select * from proprietaire";
		return getOwners(mysql);
	}

	/**
	 * Add a new owner to the DB
	 * @param owner the owner object to add
	 * @throws MonException
	 */
	public void addOwner(Proprietaire owner) throws MonException {
		String mysql;

		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try {
			mysql = "insert into proprietaire  (nom_proprietaire,prenom_proprietaire)  " +
					"values ('"
					+ owner.getNomProprietaire();
			mysql += "'" + ",'" + owner.getPrenomProprietaire() +  "')";

			unDialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	/**
	 * Get only one owner
	 * @param ownerId the ID of the owner we are searching for
	 * @return the owner object ot null if no owner is found
	 * @throws MonException
	 */
	public Proprietaire getOwner(int ownerId) throws MonException {
		String mysql = "select * from proprietaire where id_proprietaire=" + ownerId;
		List<Proprietaire> owners = getOwners(mysql);
		if (owners.isEmpty())
			return null;
		else {
			return owners.get(0);
		}
	}

	/**
	 * Edit an owner
	 * @param owner the owner to edit
	 * @throws MonException
	 */
	public void editOwner(Proprietaire owner) throws MonException
	{
		String mysql;
		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try
		{
			mysql = "UPDATE proprietaire SET "+
					"nom_proprietaire ='" + owner.getNomProprietaire() +"'"+
					",prenom_proprietaire ='" + owner.getPrenomProprietaire() +"' "+
					"WHERE id_proprietaire ='" + owner.getIdProprietaire() +"'";
			unDialogueBd.execute(mysql);
		} catch ( MonException e)
		{
			throw e;
		}
	}

	/**
	 * Delete an owner
	 * @param ownerId the owner ID to delete
	 * @throws MonException
	 */
	public void deleteOwner(int ownerId) throws MonException
	{
		String mysql;
		DialogueBd unDialogueBd = DialogueBd.getInstance();
		try
		{
			mysql = "DELETE FROM proprietaire "+
					"WHERE id_proprietaire ='" + ownerId +"'";
			unDialogueBd.execute(mysql);
		} catch ( MonException e)
		{
			throw e;
		}
	}

	/**
	 * Get List of owners for a specific query
	 * @param mysql the auery for getting a list of owner
	 * @return List of owner found if no owner found then return an empty list
	 * @throws MonException
	 */
	private List<Proprietaire> getOwners(String mysql) throws MonException {
		List<Object> rs;
		List<Proprietaire> owners = new ArrayList<Proprietaire>();
		int index = 0;
		try {
			DialogueBd unDialogueBd = DialogueBd.getInstance();
			rs = DialogueBd.lecture(mysql);
			while (index < rs.size()) {
				// On crée un stage
				Proprietaire owner = new Proprietaire();
				// il faut redecouper la liste pour retrouver les lignes
				owner.setIdProprietaire(Integer.parseInt(rs.get(index + 0).toString()));
				owner.setNomProprietaire(rs.get(index + 1).toString());
				owner.setPrenomProprietaire(rs.get(index + 2).toString());
				// On incrémente tous les 3 champs
				index = index + 3;
				owners.add(owner);
			}

			return owners;
		} catch (Exception exc) {
			throw new MonException(exc.getMessage(), "systeme");
		}
	}

}
