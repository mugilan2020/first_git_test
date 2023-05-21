-- without recursion
with 
t1 as (select deptno,job,rank()over(partition by deptno order by c desc , job) r
from (select deptno,job,count(1) c from emp group by deptno,job) sq),
t2 as (select deptno,job,dense_rank() over(order by deptno) dr from emp),
t3 as (select e.deptno,e.job,case when e.deptno =10 then 1 else 
1+(select count(distinct a.deptno) from emp a where a.job=e.job and a.deptno<e.deptno) end as pc,e.dr
from t2 e),
t4 as (select deptno,count(distinct job) hc from t3 where pc=dr group by deptno)
select t4.deptno,t4.hc,t1.job from t4,t1
where t4.deptno=t1.deptno and r=1;
/

--with recursion 

with t (d,j) as(select deptno d,job j from emp where deptno=10
                union all
                select e.deptno,e.job from emp e,t 
                where e.job=t.j and e.deptno>t.d),
t1 as (select d,count(distinct j)c from t group by d order by 1),
t2 as (select deptno,job,row_number()over(partition by deptno order by c desc,job)r from (select deptno,job,count(1) c from emp group by deptno,job))
select t2.deptno,t2.job,t1.c from t1,t2 where t1.d=t2.deptno and t2.r=1;