#List all the interviews
SELECT i.interview_id, d.name as Detective, p.name as "Interrogated Person" FROM Interview i
JOIN Detective d on i.detective_id=d.detective_id
JOIN Person p on i.person_id=p.person_id;

#Search through the interviews by the ID of the interview (1-10)
SELECT p.name as speaker, s.content FROM Statement s
JOIN Interview i on s.interview_id = i.interview_id
JOIN Person p on i.person_id = p.person_id
WHERE s.interview_id = 1;

#Search through the interviews by the ID of the person interrogated (1-11, 3 excluded)
SELECT p.name as speaker, s.content FROM Statement s
JOIN Interview i on s.interview_id = i.interview_id
JOIN Person p on i.person_id = p.person_id
WHERE p.person_id = 1;

#Search through a person's list of friends by the person's ID (1-11)
SELECT p.name as Related, r.relationship_type FROM Relationship r
JOIN Person p on r.friend_id = p.person_id
WHERE r.person_id = 1;

#List all the details of the people
SELECT p.person_id as ID, p.name as Name, p.height_cm as "Height in cm", p.clothing as Clothing from Person p;

#This is your final guess, here you can input the ID of the person you think is the traitor (there are 2 traitors)
SELECT p.name AS Person, CASE WHEN p.is_traitor = 1 
    THEN 'True'
    ElSE 'False' 
END AS 'Is the traitor'
FROM Person p
WHERE p.person_id = 1;