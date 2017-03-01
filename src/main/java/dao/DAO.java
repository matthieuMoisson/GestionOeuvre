package dao;

import meserreurs.MonException;
import persistance.Connexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Gaetan on 01/03/2017.
 */
abstract class DAO {

    Connection conn;

    DAO() {
        try {
            this.conn = Connexion.getInstance().getConnexion();
        } catch (MonException e) {
            e.printStackTrace();
        }
    }
}
