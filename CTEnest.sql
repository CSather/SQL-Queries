with July (refname, lskinid)
as (	
select
	refname,
	lskinid
from lskin l 
join hproduct_lskin on l.lskinid = frn_lskinid
	and frn_hproductid = 2
join dnis d on l.lskinid = d.add_lskinid
join archive.dbo.xcall_2014 on cf_frn_dnisid = d.dnisid
	and tz_date between '2014-07-01' and '2014-07-31'
group by refname, lskinid
having round(sum(leminutes),2) > 800
),
		
	August (refname, lskinid)
	as (
	select
		refname,
		lskinid
	from July j`
		join dnis d on j.lskinid = d.add_lskinid
		join archive.dbo.xcall_2014 on cf_frn_dnisid = d.dnisid
			and tz_date between '2014-08-01' and '2014-08-31'
	group by refname, lskinid
	having round(sum(leminutes),2) > 800
	),
	
		September (refname, lskinid)
		as (
		select 
			refname, 
			lskinid 
		from August a
			join dnis d on a.lskinid = d.add_lskinid
			join archive.dbo.xcall_2014 on cf_frn_dnisid = d.dnisid
				and tz_date between '2014-09-01' and '2014-09-30'
		group by refname, lskinid
		having round(sum(leminutes),2) > 800
		),
			
			October (refname, lskinid)
			as (
			select 
				refname, 
				lskinid 
			from September s
				join dnis d on s.lskinid = d.add_lskinid
				join archive.dbo.xcall_2014 on cf_frn_dnisid = d.dnisid
					and tz_date between '2014-10-01' and '2014-10-31'
			group by refname, lskinid
			having round(sum(leminutes),2) > 800
			),
	
				November (refname, lskinid)
				as (
				select 
					refname, 
					lskinid 
				from October o
					join dnis d on o.lskinid = d.add_lskinid
					join archive.dbo.xcall_2014 on cf_frn_dnisid = d.dnisid
						and tz_date between '2014-11-01' and '2014-11-30'
				group by refname, lskinid
				having round(sum(leminutes),2) > 800
				),
	
					December (refname, lskinid)
					as (
					select 
						refname, 
						lskinid 
					from November n
						join dnis d on n.lskinid = d.add_lskinid
						join archive.dbo.xcall_2014 on cf_frn_dnisid = d.dnisid
							and tz_date between '2014-12-01' and '2014-12-31'
					group by refname, lskinid
					having round(sum(leminutes),2) > 800
					),
	
						January (refname, lskinid)
						as (
						select 
							refname, 
							lskinid 
						from December de
							join dnis d on de.lskinid = d.add_lskinid
							join archive.dbo.xcall_2015 on cf_frn_dnisid = d.dnisid
								and tz_date between '2015-01-01' and '2015-01-31'
						group by refname, lskinid
						having round(sum(leminutes),2) > 800
						),
	
							February (refname, lskinid)
							as (
							select 
								refname, 
								lskinid 
							from January j
								join dnis d on j.lskinid = d.add_lskinid
								join archive.dbo.xcall_2015 on cf_frn_dnisid = d.dnisid
									and tz_date between '2015-02-01' and '2015-02-28'
							group by refname, lskinid
							having round(sum(leminutes),2) > 800
							)
	
							select refname, lskinid from February