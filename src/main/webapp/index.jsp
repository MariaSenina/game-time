<%@ page import="com.group9.gametime.services.ScheduleService" %>
<%@ page import="com.group9.gametime.services.api.LiveScoreScheduleService" %>
<%@ page import="com.group9.gametime.repositories.api.LiveScoreScheduleRepository" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.group9.gametime.beans.schedule.Schedule" %>
<%@ page import="java.util.List" %>
<%@ page import="com.group9.gametime.beans.schedule.Game" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.FormatStyle" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Game Time!</title>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet"  type="text/css" href="styles/main.css">
</head>
<body>
    <jsp:include page="top-nav.jsp"/>
    <div style="text-align: center">
        <h1>Welcome to Game Time!</h1>
    </div>
    <div style="width: 500px" class="centre">
        <%!
            ScheduleService scheduleService = new LiveScoreScheduleService(new LiveScoreScheduleRepository());
            LocalDate date = LocalDate.of(2022, 5, 15);

            Schedule schedule;

            {
                try {
                	
                    schedule = scheduleService.getScheduleByDateAndCompetitionId(date, 2);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            List<Game> games = schedule.getData().getGames();
        %>
       <% if(!games.isEmpty()) { %>
            <table style="text-align:center; margin-left:auto; margin-right:auto">
                <tr>
                    <th colspan='5'> <%=date.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL))%> </th>
                </tr>
                <tr>
                    <th colspan='5'>Round: <%=games.get(0).getRound()%></th>
                </tr>
                <tr>
                    <th> Location </th>
                    <th> Home Team </th>
                    <th> </th>
                    <th> Away Team </th>
                    <th> Local Time </th>
                </tr>
                <% for(Game game : games) { %>
                <tr>
                    <td><%=game.getLocation()%></td>
                    <td><%=game.getHomeTeam()%></td>
                    <td> VS </td>
                    <td><%=game.getAwayTeam()%></td>
                    <td><%=game.getTime()%></td>
                </tr>
                <% } %>
            </table>
        <% } else { %>
        		<h3 style="text-align:center; margin-left:auto; margin-right:auto">-- NO GAMES TODAY --</h3>
        <% } %>
    </div>
</body>
</html>