SELECT sn.skdname AS 'Schedule Name',
h.JOBNAME,
CAST(h.jstart -2 AS datetime) AS 'Start Time',
CAST(h.jterm -2 AS datetime) AS 'Finish Time',
CONVERT(VARCHAR(20), (CAST(h.jterm as datetime) - CAST(h.jstart as datetime)),114) AS 'Run Time',
js.ESTRUNTIME,
h.jdesc
FROM history as h
LEFT JOIN sname as sn
ON h.skdid = sn.skdid
LEFT JOIN JSKD AS js
ON h.JOBNAME = js.JOBNAME
--join History on History.Freqname = js.freqname
WHERE CONVERT(VARCHAR(20), CAST(h.jstart -2 as datetime) , 101) = CONVERT(VARCHAR(20), GETDATE(), 101)
--and h.freqname = js.freqname --h.JOBNAME = ''
and h.jmach not like '%Schedule Info%'
and h.skdid = js.skdid
--and (h.jdesc like '%07' or h.jdesc like '%03')  --If you want to find stuff that failed
ORDER BY h.jstart

--select * from jskd where jobname like '%stg_data%'
--select * from history where CONVERT(VARCHAR(20), CAST(history.jstart -2 as datetime) , 101) = CONVERT(VARCHAR(20), GETDATE(), 101) and skdid = 71
---select * from history where CONVERT(VARCHAR(20), CAST(history.jstart -2 as datetime) , 101) = CONVERT(VARCHAR(20), GETDATE(), 101) and jobname like '%results%'
--select * from sname
--select * from history where JDESC  = '0000000001'
/*
select distinct sname.skdname, history.jobname, CAST(history.jstart -2 AS datetime) AS 'Start Time', CAST(history.jterm -2 AS datetime) AS 'Finish Time', jskd.estruntime from history 
inner join sname
on history.skdid = sname.skdid
inner join jskd
on history.jobname = jskd.jobname
where CONVERT(VARCHAR(20), CAST(history.jstart -2 as datetime) , 101) = CONVERT(VARCHAR(20), GETDATE(), 101) and history.jmach not like '%Schedule Info%'
order by 'Start Time'
*/
