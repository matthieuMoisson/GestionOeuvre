package dao;

import meserreurs.MonException;
import metier.Oeuvrevente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gaetan on 25/02/2017.
 */
public class OeuvreventeDAO extends DAO{


    public void insert(Oeuvrevente oeuvrevente) {
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

    public void delete( int id ) {
        try {
            new ReservationDAO().deleteAllByOeuvrevente(id);
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
            preparedStatement.setInt( 5, oeuvrevente.getIdOeuvrevente());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Oeuvrevente> findAll() {
        List<Oeuvrevente> oeuvreventes = new ArrayList<Oeuvrevente>();
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery( "select * from oeuvrevente" );
            while( resultSet.next() ) {
                oeuvreventes.add(this.buildDomainObject(resultSet));
            }
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oeuvreventes;
    }

    public Oeuvrevente find(int id) {
        Oeuvrevente oeuvrevente = null;
        try {
            String query = "select * from oeuvrevente where id_oeuvrevente=?";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setInt( 1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                oeuvrevente = this.buildDomainObject(resultSet);
            }
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oeuvrevente;
    }

    private Oeuvrevente buildDomainObject(ResultSet row) throws SQLException, MonException {
        Oeuvrevente oeuvrevente = new Oeuvrevente();
        oeuvrevente.setIdOeuvrevente( row.getInt( "id_oeuvrevente" ) );
        oeuvrevente.setTitreOeuvrevente( row.getString( "titre_oeuvrevente" ) );
        oeuvrevente.setEtatOeuvrevente(row.getString("etat_oeuvrevente"));
        oeuvrevente.setPrixOeuvrevente(row.getFloat("prix_oeuvrevente"));
        oeuvrevente.setProprietaire(new Service().getOwner(row.getInt("id_proprietaire")));
        return oeuvrevente;
    }
}
