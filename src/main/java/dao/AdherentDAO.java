package dao;

import meserreurs.MonException;
import metier.Adherent;
import metier.Oeuvrevente;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gaetan on 25/02/2017.
 */
public class AdherentDAO extends DAO{


    public List<Adherent> findAll() {
        List<Adherent> adherents = new ArrayList<Adherent>();
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery( "select * from adherent" );
            while( resultSet.next() ) {
                adherents.add(this.buildDomainObject(resultSet));
            }
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adherents;
    }

    public Adherent find(int id) {
        Adherent adherent = null;
        try {
            String query = "select * from adherent where id_adherent=?";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setInt( 1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                adherent = this.buildDomainObject(resultSet);
            }
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adherent;
    }

    private Adherent buildDomainObject(ResultSet row) throws SQLException, MonException {
        Adherent adherent = new Adherent();
        adherent.setIdAdherent( row.getInt( "id_adherent" ) );
        adherent.setNomAdherent( row.getString( "nom_adherent" ) );
        adherent.setPrenomAdherent( row.getString( "prenom_adherent" ) );
        adherent.setVilleAdherent( row.getString( "ville_adherent" ) );
        return adherent;
    }
}
