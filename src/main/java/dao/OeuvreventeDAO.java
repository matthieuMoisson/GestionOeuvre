package dao;

import meserreurs.MonException;
import metier.Oeuvrevente;
import persistance.Connexion;
import persistance.DialogueBd;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gaetan on 25/02/2017.
 */
public class OeuvreventeDAO {

    private Connection conn;

    public OeuvreventeDAO() {
        try {
            this.conn = Connexion.getInstance().getConnexion();
        } catch (MonException e) {
            e.printStackTrace();
        }
    }

    public void addOeuvrevente(Oeuvrevente oeuvrevente) {
        try {
            String query = "insert into oeuvrevente (titre_oeuvrevente, etat_oeuvrevente, prix_oeuvrevente, id_proprietaire) values (?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setString( 1, oeuvrevente.getTitreOeuvrevente());
            preparedStatement.setString( 2, oeuvrevente.getEtatOeuvrevente());
            preparedStatement.setFloat( 3, oeuvrevente.getPrixOeuvrevente());
            preparedStatement.setInt( 4, oeuvrevente.getProprietaire().getIdProprietaire());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOeuvrevente( int id ) {
        try {
            String query = "delete from oeuvrevente where id_oeuvrevente=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOeuvrevente( Oeuvrevente oeuvrevente ) {
        try {
            String query = "update oeuvrevente set titre_oeuvrevente=?, etat_oeuvrevente=?, prix_oeuvrevente=?, id_proprietaire=? where id_oeuvrevente=?";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setString( 1, oeuvrevente.getTitreOeuvrevente());
            preparedStatement.setString( 2, oeuvrevente.getEtatOeuvrevente());
            preparedStatement.setFloat( 3, oeuvrevente.getPrixOeuvrevente());
            preparedStatement.setInt( 4, oeuvrevente.getProprietaire().getIdProprietaire());
            preparedStatement.setInt( 4, oeuvrevente.getIdOeuvrevente());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Oeuvrevente> getAllOeuvrevente() {
        List<Oeuvrevente> oeuvreventes = new ArrayList<Oeuvrevente>();
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery( "select * from oeuvrevente" );
            while( resultSet.next() ) {
                Oeuvrevente oeuvrevente = new Oeuvrevente();
                oeuvrevente.setIdOeuvrevente( resultSet.getInt( "id_oeuvrevente" ) );
                oeuvrevente.setTitreOeuvrevente( resultSet.getString( "titre_oeuvrevente" ) );
                oeuvrevente.setEtatOeuvrevente(resultSet.getString("etat_oeuvrevente"));
                oeuvrevente.setPrixOeuvrevente(resultSet.getFloat("prix_oeuvrevente"));
                oeuvrevente.setProprietaire(new Service().getOwner(resultSet.getInt("id_proprietaire")));
                oeuvreventes.add(oeuvrevente);
            }
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oeuvreventes;
    }
}
