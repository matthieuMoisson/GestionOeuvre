<%--
  Created by IntelliJ IDEA.
  User: Gaetan
  Date: 25/02/2017
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catalogue des oeuvres</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
    <%-- Bootstrap --%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <%-- Data tables --%>    <%-- Jquery --%>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
</head>

<body>

    <script>
        $(document).ready(function () {
            $('#tableOeuvres').DataTable();
        });
    </script>

    <div class="container">
        <h1>Catalogue des oeuvres</h1>
        <table id="tableOeuvres">
            <thead>
                <th>Titre</th>
                <th>Prix</th>
                <th>Propriétaire</th>
                <th>Action</th>
            </thead>
            <tbody>
                <c:forEach items="${oeuvres}" var="item">
                    <tr>
                        <td>${item.titre}</td>
                        <td>${item.prix}</td>
                        <td>${item.owner}</td>
                        <!-- Modifier button -->
                        <td>
                            <a href="#" class="btn btn-info" role="button">Réserver</a>
                            <a href="#" class="btn btn-info" role="button">Modifier</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%-- JS --%>
    <%-- Bootstrap --%>
    <script type="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%-- End JS --%>
</body>
</html>
