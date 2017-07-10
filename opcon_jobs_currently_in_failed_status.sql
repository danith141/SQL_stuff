select sn.skdname as 'Schedule Name',
	sm.jobname as 'Job Name',
	CONVERT(VARCHAR(20),cast(sm.startstamp -2 as datetime), 108) as 'Start Time',  --make time be (108) hh:mm:ss instead of (114) hh:mm:ss:mmm 
	CONVERT(VARCHAR(20),cast(sm.termstamp-2 as datetime), 108) as 'Finish Time',
	CONVERT(VARCHAR(20), (CAST(sm.termstamp as datetime) - CAST(sm.startstamp as datetime)),114) AS 'Run Time',
	termdesc as 'Term code'
from smaster as sm
left join sname as sn on sm.skdid = sn.skdid
where CONVERT(VARCHAR(20), CAST(skddate -2 as datetime) , 101) = CONVERT(VARCHAR(20), GETDATE(), 101) 
and jobstatus = 910