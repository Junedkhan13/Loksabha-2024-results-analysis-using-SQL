-- Total Seats

SELECT DISTINCT 
	COUNT(Parliament_Constituency) AS 'Total Seats'
FROM 
	constituencywise_results;


-- What is the total number of seats available for elections in each state?

SELECT 
	states.State, 
	COUNT(Parliament_Constituency) AS 'Total Seats Available'
FROM 
	states
JOIN 
	statewise_results
ON states.State_ID = statewise_results.State_ID
GROUP BY 
	states.State;


-- Total Seats Won by NDA Alliance:

SELECT 
	SUM(Won) as 'NDA Total Seats'
FROM 
	partywise_results
WHERE 
	Party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            );


-- Seats Won by NDA Alliance Parties:

SELECT 
	Party as 'NDA Alliance Party', Won as 'Seats won'
FROM 
	partywise_results
WHERE 
	Party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
		  'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
		  'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            )
ORDER BY 
	Won DESC;



-- Total Seats Won by I.N.D.I.A. Alliance:

SELECT 
	SUM(Won) as 'INDIA Total Seats'
FROM 
	partywise_results
WHERE 
	Party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            );





-- Seats Won by I.N.D.I.A. Alliance Parties:

SELECT 
	Party as 'INDIA Alliance Party', Won as 'Seats won'
FROM 
	partywise_results
WHERE 
	Party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            )
ORDER BY 
	Won DESC;


-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

ALTER TABLE partywise_results
ADD 
	Alliance varchar(50);

-- INDIA

UPDATE 
	partywise_results
SET 
	Alliance = 'I.N.D.I.A'
WHERE 
	party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

-- NDA

UPDATE 
	partywise_results
SET 
	Alliance = 'NDA'
WHERE 
	party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

-- OTHER


UPDATE 
	partywise_results
SET 
	Alliance = 'OTHER'
WHERE 
	Alliance IS NULL;


-- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT 
	Alliance, 
	SUM(Won) as 'Total Seats Won'
FROM 
	partywise_results
GROUP BY 
	Alliance
ORDER BY 
	'Total Seats Won' DESC;


-- Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

SELECT states.State AS 'State', Constituency_Name AS 'Constituency', Winning_Candidate AS 'Candidate Name', Party AS 'Party Name', 
		Total_Votes AS 'Total Votes', cr.Margin as 'Margin of Victory'	
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency= sr.Parliament_Constituency
JOIN states ON sr.State_ID = states.State_ID
JOIN partywise_results pr ON pr.Party_ID = cr.Party_ID
ORDER BY states.State, Constituency_Name;

SELECT Winning_Candidate AS 'Candidate Name', Party AS 'Party Name', Total_Votes AS 'Total Votes', cr.Margin as 'Margin of Victory', Alliance,
		Constituency_Name AS 'Constituency', states.State AS 'State'
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency= sr.Parliament_Constituency
JOIN states ON sr.State_ID = states.State_ID
JOIN partywise_results pr ON pr.Party_ID = cr.Party_ID
WHERE Constituency_Name = 'MAINPURI';

-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select * from constituencywise_details;

SELECT cr.Constituency_Name, cd.Candidate, cd.EVM_Votes, cd.Postal_Votes, cd.Total_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE Constituency_Name = 'JAIPUR';

-- Which parties won the most seats in a specific State, and how many seats did each party win?

SELECT pr.Party, count (Constituency_ID) as 'Total Seats'

FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
JOIN partywise_results pr ON pr.Party_ID = cr.Party_ID

WHERE s.State ='Rajasthan'
GROUP BY pr.Party
ORDER BY 'Total Seats' DESC;

-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024:

SELECT s.State, SUM(CASE WHEN Alliance = 'NDA' THEN 1
					ELSE 0
					END) AS 'NDA Seats Won',
				SUM(CASE WHEN Alliance = 'I.N.D.I.A' THEN 1
					ELSE 0
					END) AS 'INDIA Seats Won',
				SUM(CASE WHEN Alliance = 'OTHER' THEN 1
					ELSE 0
					END) AS 'OTHER Seats Won'

FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
JOIN partywise_results pr ON pr.Party_ID = cr.Party_ID
GROUP BY s.State
ORDER BY s.State;


-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?

select * from constituencywise_details;
use indialsr

SELECT TOP 10 
		cd.Candidate, cd.Party, cd.EVM_Votes, cr.Constituency_Name
FROM constituencywise_details cd
JOIN constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = (SELECT MAX(cd1.EVM_Votes)
					 FROM constituencywise_details cd1
				     WHERE cd1.Constituency_ID = cd.Constituency_ID
					 )
ORDER BY cd.EVM_Votes desc;

-- -- Which candidate won and which candidate was the runner-up in each constituency of country for the 2024 elections?

WITH 
	RankofCandidate AS (
	SELECT 
	Constituency_ID, 
	Candidate, 
	Party, 
	EVM_Votes, 
	Postal_Votes, 
	Total_Votes,
	RANK() OVER(PARTITION BY Constituency_ID ORDER BY Total_Votes DESC) AS 'Vote rank'
FROM 
	constituencywise_details
)

SELECT 
cr.Constituency_ID AS 'Constituency ID', 
cr.Constituency_Name AS 'Constituency Name', 
		MAX(CASE WHEN roc.[Vote rank] = 1 THEN roc.Candidate END) AS Winner,
		MAX(CASE WHEN roc.[Vote rank] = 2 THEN roc.Candidate END) AS Runnerup

FROM 
	RankofCandidate roc
JOIN 
	constituencywise_results cr ON roc.Constituency_ID = cr.Constituency_ID 

GROUP BY 
	cr.Constituency_ID, cr.Constituency_Name;


-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Rajasthan'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;


-- Top 10 Candidates won by largest margins

SELECT TOP 10 Parliament_Constituency as Constituency, Winning_Candidate, Total_Votes AS 'Total Votes', FORMAT(Margin, '###,###,###') AS 'Win Margin', Party, Alliance
FROM constituencywise_results cr 
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
ORDER BY Margin DESC;

-- Top 10 parties by total number of votes         


SELECT Top 10 Party, FORMAT(SUM(Total_Votes),'###,###,###') as 'Total Votes'
FROM constituencywise_details
GROUP BY Party
ORDER BY SUM(Total_Votes) DESC;

-- Total votes by ALLIANCE

SELECT Alliance, FORMAT(SUM(cd.Total_Votes), '###,###,###') as 'Total Votes'
FROM constituencywise_details cd
JOIN constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
JOIN partywise_results pr on cr.Party_ID = pr.Party_ID
GROUP BY Alliance
ORDER BY SUM(cd.Total_Votes) DESC;

-- Total vote share percentage of a Party

SELECT Party, SUM(Total_Votes) AS 'Party Total Votes',
	SUM(SUM(Total_Votes)) OVER() AS 'Total Votes', 
	CAST(SUM(Total_Votes) * 100.0 /(SUM(SUM(Total_Votes)) OVER()) AS DECIMAL(10,2)) AS 'Vote Share Percentage'
FROM constituencywise_details
GROUP BY Party
ORDER BY SUM(Total_Votes) DESC;

-- Method 2

WITH Party_Votes AS (
    SELECT 
        Party,
        SUM(Total_Votes) AS Total_Party_Votes
    FROM constituencywise_details
    GROUP BY Party
),
All_Votes1 AS (
    SELECT SUM(Total_Votes) AS All_Votes FROM constituencywise_details
)

SELECT 
    p.Party,
    p.Total_Party_Votes,
    t.All_Votes,
    CAST(p.Total_Party_Votes * 100.0 / t.All_Votes AS DECIMAL(10,2)) AS Vote_Share_Percentage
FROM Party_Votes p
CROSS JOIN All_Votes1 t
ORDER BY Vote_Share_Percentage DESC;


-- Total vote share percentage of a Party in a specific state:

WITH PartyStateVotes AS (
    SELECT 
        cd.Party,
        s.State,
        SUM(cd.Total_Votes) AS TotalPartyVotes
    FROM constituencywise_details cd
    JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states s ON sr.State_ID = s.State_ID
    GROUP BY cd.Party, s.State
),
TotalStateVotes AS (
    SELECT 
        s.State,
        SUM(cd.Total_Votes) AS TotalVotesInState
    FROM constituencywise_details cd
    JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states s ON sr.State_ID = s.State_ID
    GROUP BY s.State
)
SELECT 
    p.State,
    p.Party,
    p.TotalPartyVotes,
    t.TotalVotesInState,
    CAST(p.TotalPartyVotes * 100.0 / t.TotalVotesInState AS DECIMAL(10,2)) AS VoteSharePercentage
FROM PartyStateVotes p
INNER JOIN TotalStateVotes t ON p.State = t.State
WHERE p.State = 'Rajasthan'
ORDER BY p.State, VoteSharePercentage DESC;

-- Total vote share percentage of a Alliance:

WITH Party_Votes AS (
    SELECT 
        pr.Alliance,
        SUM(cd.Total_Votes) AS Total_Alliance_Votes
    FROM constituencywise_details cd
	JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
	JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
    GROUP BY Alliance
),
All_Votes1 AS (
    SELECT SUM(Total_Votes) AS All_Votes FROM constituencywise_details
)

SELECT 
    p.Alliance,
    p.Total_Alliance_Votes,
    t.All_Votes,
    CAST(p.Total_Alliance_Votes * 100.0 / t.All_Votes AS DECIMAL(10,2)) AS Vote_Share_Percentage
FROM Party_Votes p
CROSS JOIN All_Votes1 t
ORDER BY Vote_Share_Percentage DESC;

-- Total vote share percentage of an Alliance in a specific state:

WITH AllianceStateVotes AS (
    SELECT 
        pr.Alliance,
        s.State,
        SUM(cd.Total_Votes) AS TotalAllianceVotes
    FROM constituencywise_details cd
    JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
	JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states s ON sr.State_ID = s.State_ID
    GROUP BY pr.Alliance, s.State
),
TotalStateVotes AS (
    SELECT 
        s.State,
        SUM(cd.Total_Votes) AS TotalVotesInState
    FROM constituencywise_details cd
    JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states s ON sr.State_ID = s.State_ID
    GROUP BY s.State
)
SELECT 
    p.State,
    p.Alliance,
    p.TotalAllianceVotes,
    t.TotalVotesInState,
    CAST(p.TotalAllianceVotes * 100.0 / t.TotalVotesInState AS DECIMAL(10,2)) AS VoteSharePercentage
FROM AllianceStateVotes p
INNER JOIN TotalStateVotes t ON p.State = t.State
WHERE p.State = 'Rajasthan'
ORDER BY p.State, VoteSharePercentage DESC;

-- Total number of Trailing Candidates by Party

SELECT cd.Party, COUNT(sr.Trailing_Candidate) AS 'Total Trailing Candidates'
FROM constituencywise_results cr
JOIN constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
WHERE sr.Trailing_Candidate = cd.Candidate
GROUP BY cd.Party
ORDER BY [Total Trailing Candidates] DESC;

-- Total number of Trailing Candidates by Alliance

SELECT pr.Alliance, COUNT(sr.Trailing_Candidate) AS TotalTrailingCandidates
FROM constituencywise_results cr
JOIN constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
WHERE sr.Trailing_Candidate = cd.Candidate 
GROUP BY pr.Alliance
ORDER BY TotalTrailingCandidates DESC;


-- Top 10 Closest Contests

SELECT TOP 10
    cr.Constituency_Name, 
    cr.Winning_Candidate, 
    cr.Party_ID, 
    cr.Margin, 
    s.State
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE cr.Margin != 0
ORDER BY cr.Margin ASC;

-- Top 10 Party-wise Average Margin of Victory (Parties with 7 or more seats):

SELECT 
    TOP 10
	p.Party, p.Won,
    AVG(c.Margin) AS Avg_Margin 
FROM 
    constituencywise_results c
JOIN 
    partywise_results p ON c.Party_ID = p.Party_ID 

WHERE p.Won > 6
GROUP BY 
    p.Party, p.Won
ORDER BY 
    Avg_Margin DESC;

-- TOP 10 Constituency-wise NOTA Votes Analysis:

SELECT TOP 10
    cr.Constituency_Name, 
    cd.Total_Votes AS NOTA_Votes, 
    CAST(cd.of_Votes AS DECIMAL(10,2)) AS NOTA_Percentage
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID 
WHERE 
    cd.Candidate = 'NOTA' 
ORDER BY 
    NOTA_Percentage DESC;

-- Identify swing constituencies (where the margin of victory is less than 5%) and analyze party performance in these constituencies:

	SELECT 
    cr.Constituency_Name,  
    cr.Winning_Candidate, 
    cr.Margin,
	pr.Party
FROM 
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID 
WHERE 
    cr.Margin < (cr.Total_Votes * 0.05) 
ORDER BY 
    cr.Margin ASC;

-- better

	SELECT 
    cr.Constituency_Name,  
    cr.Winning_Candidate, 
    cr.Margin,
	pr.Party,
	ROW_NUMBER() OVER(PARTITION BY pr.Party ORDER BY cr.Margin) AS Cumulative_Count_by_Party
FROM 
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID 
WHERE 
    cr.Margin < (cr.Total_Votes * 0.05) 
ORDER BY 
    cr.Margin ASC;

-- analyze party performance in these constituencies:

	SELECT 
	pr.Party,
	COUNT(cr.Margin) AS Total_Seats
FROM 
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID 
WHERE 
    cr.Margin < (cr.Total_Votes * 0.05) 
GROUP BY pr.Party
ORDER BY Total_Seats desc;
