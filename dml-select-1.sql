## Progression


-- 1. **Write a query to display the team details. Display the records sorted in the order of team name.**
SELECT name
FROM team
ORDER BY name ;
-- 2. **Write a query to display the player details whose name starts with a letter `S` and who do not belong to the country 'South Africa'. Display the records sorted in descending order based on player name.**
SELECT name
FROM player 
WHERE name LIKE 's%' AND country!='South Africa'
ORDER BY name  DESC;
-- 3. **Write a query to display the event number and the seconds taken for each event. Display the records sorted in ascending order based on event number.**
SELECT events_no,clock_in_seconds
FROM event
ORDER BY events_no; 
-- 4. **Write a query to display the event numbers of those events which has sum of raid points and defending points greater than or equal to 3. Display the records sorted in ascending order based on event_no.**
SELECT events_no
FROM event
WHERE  raider_points + defending_points >= 3
ORDER BY events_no;
-- 5. **Write a query to display the name of all the players who belong to the country India or Iran. Display the records sorted in ascending order based on player name.**
SELECT name
FROM player
WHERE  (country = 'india' OR country = 'Iran')
ORDER BY name;
-- 6. **Write a query to display the name of all the players who does not belong to the country India and Iran. Display the records sorted in ascending order based on player name.**
SELECT name
FROM player
WHERE  (country != 'India' AND country != 'Iran')
ORDER BY name;
-- 7. **Write a query to display the names of all the skills that start with `Defend`. Display the records sorted in ascending order based on skill name.**
SELECT name
FROM skill
WHERE name LIKE 'DEFEND%'
ORDER BY name;
-- 8. **Write a query to display all the stadium names that ends with `Complex`. Display the records sorted in ascending order based on stadium names.**
SELECT stadium_name
FROM venue
WHERE stadium_name LIKE '%COMPLEX'
ORDER BY stadium_name; 

-- 9. **Write a query to display the winner team ids and the scores of those teams whose scores are less than 35. Display the records sorted in descending order based on outcome id.**
SELECT id
FROM outcome
WHERE score < 35
ORDER BY id DESC;
-- 10. **Write a query to display the game details of those games that were played between January and March of 2020. Display the records sorted in descending order based on id.**
SELECT * FROM GAME;
INSERT INTO GAME(ID,GAME_DATE,TEAM_ID_1,TEAM_ID_2,VENUE_ID,REFEREE_ID_1,REFEREE_ID_2,FIRST_INNINGS_ID,SECOND_INNINGS_ID)
VALUES(101,DATE '2020-01-21',101,102,101,101,101,102,103);
INSERT INTO GAME(ID,GAME_DATE,TEAM_ID_1,TEAM_ID_2,VENUE_ID,REFEREE_ID_1,REFEREE_ID_2,FIRST_INNINGS_ID,SECOND_INNINGS_ID)
VALUES(102,DATE '2020-05-04',101,102,101,101,101,102,103);
INSERT INTO GAME(ID,GAME_DATE,TEAM_ID_1,TEAM_ID_2,VENUE_ID,REFEREE_ID_1,REFEREE_ID_2,FIRST_INNINGS_ID,SECOND_INNINGS_ID)
VALUES(103,DATE '2020-03-21',101,102,101,101,101,102,103);
SELECT GAME_DATE
FROM GAME
WHERE GAME_DATE BETWEEN DATE '2020-01-01' AND DATE '2020-03-31'
ORDER BY GAME_DATE DESC;
-- 11. **Write a query to display the names of players who are Raiders. Display the records sorted in ascending order based on player name.**
INSERT INTO PLAYER(ID,NAME,COUNTRY,SKILL_ID, TEAM_ID)
VALUES(101,'MICHELE','INDIA',101,101);
INSERT INTO PLAYER(ID,NAME,COUNTRY,SKILL_ID, TEAM_ID)
VALUES(102,'SHARON','VENICE',101,102);
INSERT INTO PLAYER(ID,NAME,COUNTRY,SKILL_ID, TEAM_ID)
VALUES(103,'SHARON','ENGLAND',101,102);
INSERT INTO PLAYER(ID,NAME,COUNTRY,SKILL_ID, TEAM_ID)
VALUES(104,'MANYA','ITALY',102,101);
INSERT INTO PLAYER(ID,NAME,COUNTRY,SKILL_ID, TEAM_ID)
VALUES(105,'MANYATA','EGYPT',101,102);
SELECT * 
FROM PLAYER;
SELECT NAME
FROM PLAYER
WHERE ID>101
ORDER BY NAME ASC;
-- 12. **Write a query to display the event number, raid points and defence points scored in the first innings of the game that was played on `2020-01-26`. Display the records sorted in ascending order based on event number.**
SELECT *
FROM EVENT;
SELECT EVENT_NO, RAID_POINTS, DEFENDING_POINTS
FROM EVENT,GAME
WHERE FIRST_INNINGS_ID=101 AND GAME_DATE=DATE '2020-01-26'
ORDER BY EVENT_NO ASC;
-- 13. **Write a query to display the name of the winner team in the game played on `2020-03-09`. Display the records sorted in ascending order based on team name.**
SELECT NAME, STATUS,WINNER_TEAM_ID
FROM OUTCOME,GAME,TEAM
WHERE GAME_DATE=DATE '2020-03-09'
ORDER BY NAME ASC;
-- 14. **Write a query to display the names of players who were the player of the match in the game played on 2020-03-09'. Display the records sorted in ascending order based on player name.**
SELECT *
FROM OUTCOME;
SELECT NAME
FROM OUTCOME,GAME,PLAYER
WHERE GAME_DATE=DATE '2020-03-09'
ORDER BY PLAYER_OF_MATCH ASC;
-- 15. **Write a query to display the names of players who are All rounders. Display the records sorted in ascending order based on player name.**
SELECT PLAYER.NAME
FROM PLAYER,SKILL
WHERE SKILL.NAME='ALL ROUNDERS'
ORDER BY PLAYER.NAME ASC;
-- 16. **Write a query to display the venue names for all the games that were played on `2020-03-09`. Display the records sorted in ascending order based on venue name.**
SELECT STADIUM_NAME
FROM VENUE,GAME
WHERE GAME_DATE=DATE '2020-03-09'
ORDER BY STADIUM_NAME ASC;
-- 17. **Write a query to display the Coach's name of the team `Iran`**
SELECT COACH
FROM TEAM
WHERE NAME='IRAN';

-- 18. **Write a query to display the event number and the defence points of `Fazel Atrachali` in each event. Display the records sorted in ascending order based on event number.**
SELECT EVENT_NO,DEFENDING_POINTS
FROM EVENT, TEAM
WHERE NAME='FAZEL ATRACHALI'
ORDER BY EVENT_NO ASC;
-- 19. **Write a query to display the names of the Winning teams in the month of March 2020. Display the records sorted in ascending order based on team name.**
SELECT NAME
FROM OUTCOME,GAME,TEAM
WHERE STATUS='WINNER' AND GAME_DATE BETWEEN DATE '2020-03-01' AND DATE '2020-03-31'
ORDER BY TEAM.NAME ASC;
-- 20. **Write a query to display the names of players who were the player of the match in the games held in March 2020. Display the records sorted in ascending order based on player name.**
SELECT NAME
FROM PLAYER,GAME,OUTCOME
WHERE PLAYER.ID=PLAYER_OF_MATCH AND GAME_DATE BETWEEN DATE '2020-03-01' AND DATE '2020-03-31'
ORDER BY PLAYER.NAME ASC;