package dao;

import meserreurs.MonException;
import metier.Oeuvrevente;
import metier.Reservation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gaetan on 25/02/2017.
 */
public class ReservationDAO extends DAO{


    public int insert(Reservation reservation) {

        // Check if the reservation already exists
        if (this.exist(reservation.getOeuvrevente().getIdOeuvrevente(), reservation.getAdherent().getIdAdherent())) {
            return -1;
        }

        try {
            String query = "insert into reservation (statut, id_oeuvrevente, id_adherent, date_reservation) values (?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setString( 1, reservation.getStatut());
            preparedStatement.setInt( 2, reservation.getOeuvrevente().getIdOeuvrevente());
            preparedStatement.setInt( 3, reservation.getAdherent().getIdAdherent());
            preparedStatement.setDate( 4, (Date) reservation.getDate());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean exist (int idOeuvrevente, int idAdherent) {
        Boolean reservationAlreadyDone = false;
        try {
            String query = "select * from reservation where id_oeuvrevente=? and id_adherent=?";
            PreparedStatement preparedStatement = conn.prepareStatement( query );
            preparedStatement.setInt( 1, idOeuvrevente);
            preparedStatement.setInt( 2, idAdherent);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                reservationAlreadyDone = true;
            }
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservationAlreadyDone;
    }
}
