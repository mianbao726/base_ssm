-- 0-清理 zy_z_temp_mix_family_info 表不重要字段，只留下姓名、身份证、区级人均收入、区级档次、收件日期，effdate（所在月份）六列信息，其他都删除。
update zy_z_temp_mix_family_info t 
set t.ANA  = NULL,
t.`ANA_GB变更备案时间` = NULL,
t.`ANA_GB备案时间`=NULL,
t.`ANA_GB收件时间`=NULL,
t.`ANA_GB终止时间`=NULL,
t.`ANA_处理方式`=NULL,
t.`ANA_所属分类`=NULL,
t.`ANA_新增或变更`=NULL,
t.`ANA_时间图`=NULL,
t.`ANA_补贴最终生效时间`=NULL,
t.apply002_code=NULL,
t.apply002_StartDate=NULL,
t.apply003_code=NULL,
t.apply003_count=NULL,
t.apply003_StartDate=NULL,
t.apply003_StopDate=NULL,
t.Qingkuang=NULL,
t.`GB号`=NULL,
t.GBStop=NULL,
t.GBStopReason=NULL,
t.`GB人口数`=NULL,
t.`GB家庭人口数`=NULL,
t.`GB家庭人均月收入`=NULL,
t.`GB家庭类型`=NULL,
t.`GB特殊情况`=NULL,
t.`GB租金比例`=NULL,
t.familyid=NULL,
t.familycode=NULL;


-- 1-为mix家庭查找familycode ----------------------

		update zy_z_temp_mix_family_info set familycode = null;

		update zy_z_temp_mix_family_info t set familycode = (
			select DISTINCT s.familycode
			from zy_base_family_subsidy        s,
					 zy_base_family_member_sub     m,
					 zy_base_family_subsidy_member r
			where s.id=r.subsidyid and r.memberid =m.id and r.issecurity='YES'
					 and m.idcard=t.CardID 
					 and s.qualificationcode in('applytype_001','applytype_002')
    );
		
		select DISTINCT CardID,name from zy_z_temp_mix_family_info where familycode is null;

		-- 412722193712282017	袁智祥
		-- 432926194712020513	魏愈彪
		-- 11010819330325002X	毛景兰

		-- 为其他找不到 familycode 的家庭
		update zy_z_temp_mix_family_info i 
		set i.familycode=( select familynumber familycode from zy_biz_family_info where CERTIFICATIONNUMBER = i.cardid /*or name = i.name*/ LIMIT 1) 
		where i.familycode is null;
		
		select DISTINCT CardID,name from zy_z_temp_mix_family_info where familycode is null;

		-- 为 袁智祥 添加家庭code （因为袁智祥 查不到记录）
		update zy_z_temp_mix_family_info i 
		set i.familycode='AJBJZFBZ5416822'
		where i.name='袁智祥' and Effdate='2015-12-01';



-- 1-为pure家庭查找familycode --------------- 
/*
		update zy_z_temp_pure_family_info set familycode = null;

		update zy_z_temp_pure_family_info t set familycode = (
			select DISTINCT s.familycode
			from zy_base_family_subsidy        s,
					 zy_base_family_member_sub     m,
					 zy_base_family_subsidy_member r
			where s.id=r.subsidyid and r.memberid =m.id and r.issecurity='YES'
					 and m.idcard=t.CardID 
					 and s.qualificationcode in('applytype_001','applytype_002') limit 1
    );
*/		

		-- 为其他找不到 familycode 的家庭
/*		update zy_z_temp_pure_family_info i 
		set i.familycode=( select familynumber familycode from zy_biz_family_info where CERTIFICATIONNUMBER = i.cardid or name = i.name LIMIT 1) 
		where i.familycode is null;

		select * from zy_z_temp_pure_family_info where familycode is null;
*/





-- 1.5 检查、核对 台账基本信息

update zy_z_temp_mix_family_info t set `GB号`= (
		select max(RECORDCODE) from zy_base_family_subsidy 
		where familycode = t.familycode
		and qualificationcode = 'applytype_002' 
);

update zy_z_temp_mix_family_info t set `GB家庭人口数`= (
		select ENSUREPERSON from zy_base_family_subsidy 
		where RECORDCODE = t.`GB号`
);

update zy_z_temp_mix_family_info t set `GB租金比例`= (
		select RATIO from zy_base_family_subsidy 
		where RECORDCODE = t.`GB号`
);
update zy_z_temp_mix_family_info t set `GB家庭人均月收入`= (
		select FAMILYMONTHAVG from zy_base_family_subsidy 
		where RECORDCODE = t.`GB号`
);

update zy_z_temp_mix_family_info t set `GB家庭类型`= (
		select d.DICTNAME from zy_base_family_subsidy s,zy_eos_dict_entry d 
		where s.RECORDCODE = t.`GB号` and d.dicttypeid='FAMILY_INCOME110106_NEW' and s.SUBSIDYLEVEL = d.dictid
);

-- FAMILY_INCOME110106_NEW
-- 0	低保家庭
-- 1	优抚家庭
-- 2	低收入家庭
-- 3	特困分散供养家庭

update zy_z_temp_mix_family_info t set `GB特殊情况`= (
		select d.DICTNAME from zy_base_family_subsidy s,zy_eos_dict_entry d 
		where s.RECORDCODE = t.`GB号` and d.dicttypeid='bizfamily_applytype_002' and s.LOWENSURESIGN = d.dictid
);
-- 	1	家庭有重残人员
-- 	2	家庭有患大病人员
-- 	3	家庭成员均为60周岁以上老人且无子女



-- 开始按区补贴新政检查区级补贴档次：
-- 1人家庭; 民政部门认定的城市最低生活保障家庭、分散供养的特困人员  95%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  from zy_z_temp_mix_family_info 
		where DistRatio != '95' 
		and GB家庭人口数 = 1 
		and (`GB家庭类型`='民政部门认定的城市最低生活保障家庭,分散供养的特困人员')
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭; 民政部门认定的城市低收入家庭,且无特殊情况  90%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 1 
		and (`GB家庭类型`='民政部门认定的城市低收入家庭') and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭; 民政部门认定的城市低收入家庭，有特殊情况  95%   -- 不用考虑特殊情况，因为已经加在档次中了
/*select * 
from zy_z_temp_mix_family_info 
where DistRatio != '95' 
	and GB家庭人口数 = 1 
	and (`GB家庭类型`='民政部门认定的城市低收入家庭') and `GB特殊情况` is not NULL;*/


-- 1人家庭;  人均月收入2000元及以下的家庭,且无特殊情况  80%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '80' 
		and GB家庭人口数 = 1 
		and GB家庭人均月收入 <= 2000
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入2000元及以下的家庭,有特殊情况  90%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 1 
		and GB家庭人均月收入 <= 2000
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入2000~3000元的家庭,且无特殊情况  60%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '60' 
		and GB家庭人口数 = 1 
		and (GB家庭人均月收入 > 2000) and (GB家庭人均月收入 <= 3000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入2000~3000元的家庭,有特殊情况  80%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '80' 
		and GB家庭人口数 = 1 
		and (GB家庭人均月收入 > 2000) and (GB家庭人均月收入 <= 3000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入3000~4000元的家庭,且无特殊情况  40%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '40' 
		and GB家庭人口数 = 1 
		and (GB家庭人均月收入 > 3000) and (GB家庭人均月收入 <= 4000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入3000~4000元的家庭,有特殊情况  60%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '60' 
		and GB家庭人口数 = 1 
		and (GB家庭人均月收入 > 3000) and (GB家庭人均月收入 <= 4000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入4000~5000元的家庭,且无特殊情况  20%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '20' 
		and GB家庭人口数 = 1 
		and (GB家庭人均月收入 > 4000) and (GB家庭人均月收入 <= 5000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 1人家庭;  人均月收入4000~5000元的家庭,有特殊情况  40%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '40' 
		and GB家庭人口数 = 1 
		and (GB家庭人均月收入 > 4000) and (GB家庭人均月收入 <= 5000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;



--  以下为2人家庭 ------------------------------


-- 2人家庭; 民政部门认定的城市最低生活保障家庭、分散供养的特困人员  95%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '95' 
		and GB家庭人口数 = 2 
		and (`GB家庭类型`='民政部门认定的城市最低生活保障家庭,分散供养的特困人员')
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭; 民政部门认定的城市低收入家庭,且无特殊情况  90%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 2 
		and (`GB家庭类型`='民政部门认定的城市低收入家庭') 
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭; 民政部门认定的城市低收入家庭，有特殊情况  90%  -- 即使有特殊情况，也按照 90发放
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 2 
		and (`GB家庭类型`='民政部门认定的城市低收入家庭') 
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;


-- 2人家庭;  人均月收入1400元及以下的家庭,且无特殊情况  80%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '80' 
		and GB家庭人口数 = 2 
		and GB家庭人均月收入 <= 1400
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭;  人均月收入1400元及以下的家庭,有特殊情况  90%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 2 
		and GB家庭人均月收入 <= 1400
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭;  人均月收入1400~2000元的家庭,且无特殊情况  60%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '60' 
		and GB家庭人口数 = 2 
		and (GB家庭人均月收入 > 1400) and (GB家庭人均月收入 <= 2000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员' 
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭;  均月收入1400~2000元的家庭,有特殊情况  80%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '80' 
		and GB家庭人口数 = 2 
		and (GB家庭人均月收入 > 1400) and (GB家庭人均月收入 <= 2000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭;  人均月收入2000~2600元的家庭,且无特殊情况  40%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '40' 
		and GB家庭人口数 = 2 
		and (GB家庭人均月收入 > 2000) and (GB家庭人均月收入 <= 2600)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭;  人均月收入2000~2600元的家庭,有特殊情况  60%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '60' 
		and GB家庭人口数 = 2 
		and (GB家庭人均月收入 > 2000) and (GB家庭人均月收入 <= 2600)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;


-- 2人家庭;  人均月收入2600~3200元的家庭,且无特殊情况  20%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '20' 
		and GB家庭人口数 = 2 
		and (GB家庭人均月收入 > 2600) and (GB家庭人均月收入 <= 3200)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 2人家庭;  人均月收入2600~3200元的家庭,有特殊情况  40%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '40' 
		and GB家庭人口数 = 2 
		and (GB家庭人均月收入 > 2600) and (GB家庭人均月收入 <= 3200)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;




--  以下为3人家庭 ------------------------------

-- 3人家庭; 民政部门认定的城市最低生活保障家庭、分散供养的特困人员  95%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '95' 
		and GB家庭人口数 = 3  
		and `GB家庭类型`='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭; 民政部门认定的城市低收入家庭,且无特殊情况  90%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 3  
		and `GB家庭类型`='民政部门认定的城市低收入家庭' 
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭; 民政部门认定的城市低收入家庭，有特殊情况  90% -- 即使有特殊情况，也按照 90发放
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 3  
		and `GB家庭类型`='民政部门认定的城市低收入家庭' and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;


-- 3人家庭;  人均月收入1200元及以下的家庭,且无特殊情况  80%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '80' 
		and GB家庭人口数 = 3  
		and GB家庭人均月收入 <= 1200
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭;  人均月收入1200元及以下的家庭,有特殊情况  90%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '90' 
		and GB家庭人口数 = 3  
		and GB家庭人均月收入 <= 1200
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭;  人均月收入1200~1600元的家庭,且无特殊情况  60%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '60' 
		and GB家庭人口数 = 3  
		and (GB家庭人均月收入 > 1200) and (GB家庭人均月收入 <= 1600)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭;  均月收入1200~1600元的家庭,有特殊情况  80%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '80' 
		and GB家庭人口数 = 3  
		and (GB家庭人均月收入 > 1200) and (GB家庭人均月收入 <= 1600)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭;  人均月收入1600~2000元的家庭,且无特殊情况  40%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '40' 
		and GB家庭人口数 = 3  
		and (GB家庭人均月收入 > 1600) and (GB家庭人均月收入 <= 2000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭;  人均月收入1600~2000元的家庭,有特殊情况  60%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '60' 
		and GB家庭人口数 = 3  
		and (GB家庭人均月收入 > 1600) and (GB家庭人均月收入 <= 2000)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;


-- 3人家庭;  人均月收入2000~2400元的家庭,且无特殊情况  20%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`   
		from zy_z_temp_mix_family_info 
		where DistRatio != '20' 
		and GB家庭人口数 = 3  
		and (GB家庭人均月收入 > 2000) and (GB家庭人均月收入 <= 2400)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is NULL
)
GROUP BY `GB号`
having  c <= 1;

-- 3人家庭;  人均月收入2000~2400元的家庭,有特殊情况  40%
select `GB号`,Name,CardID,count(*) c from zy_z_temp_mix_family_info where `GB号` in (
		select `GB号`  
		from zy_z_temp_mix_family_info 
		where DistRatio != '40' 
		and GB家庭人口数 = 3  
		and (GB家庭人均月收入 > 2000) and (GB家庭人均月收入 <= 2400)
		and `GB家庭类型` !='民政部门认定的城市低收入家庭' 
		and `GB家庭类型` !='民政部门认定的城市最低生活保障家庭,分散供养的特困人员'
		and `GB特殊情况` is not NULL
)
GROUP BY `GB号`
having  c <= 1;




-- 2 缩减数据规模---
              

-- 身份证
-- DROP TABLE IF EXISTS zy_1base_family_member_sub_smart;               
-- create table zy_1base_family_member_sub_smart as select * from zy_base_family_member_sub t where t.IDCARD in (select cardid from zy_z_temp_mix_family_info z1 union  select cardid from zy_z_temp_pure_family_info z2);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1base_family_subsidy_smart;
-- create table zy_1base_family_subsidy_smart  as select * from zy_base_family_subsidy t where t.FAMILYCODE in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1base_family_subsidy_member_smart;
-- create table zy_1base_family_subsidy_member_smart  as select * from zy_base_family_subsidy_member  t where t.FAMILYCODE in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 选择以 保障资格号码为准，虽然也可以用 经办人身份证办理，但是考虑到人可能会过世，所以还是以保障资格号码为准
-- DROP TABLE IF EXISTS zy_1biz_dist_checkpersion_smart;
-- create table zy_1biz_dist_checkpersion_smart  as select * from zy_biz_dist_checkpersion  t where t.family_record_num in (select RECORDCODE from zy_1base_family_subsidy_smart t);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_changeinfo_smart; 
-- create table zy_1biz_family_changeinfo_smart  as select * from zy_biz_family_changeinfo t where t.FAMILYNUMBER in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

  
-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_datalockinfo_smart;
-- create table zy_1biz_family_datalockinfo_smart  as select * from zy_biz_family_datalockinfo  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);


		-- 基于上表结果1biz_family_datalockinfo_smart
		-- DROP TABLE IF EXISTS zy_1biz_family_datalockdetail_smart; 
		-- create table zy_1biz_family_datalockdetail_smart  as select * from zy_biz_family_datalockdetail  t where t.LOCKID in (select id from zy_1biz_family_datalockinfo_smart);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_info_smart; 
-- create table zy_1biz_family_info_smart  as select * from zy_biz_family_info  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_member_smart;
-- create table zy_1biz_family_member_smart  as select * from zy_biz_family_member  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);


-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_subsidy_smart; 
-- create table zy_1biz_family_subsidy_smart  as select * from zy_biz_family_subsidy  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 家庭编号 （合同信息表）
DROP TABLE IF EXISTS zy_1biz_later_family_contractinfo_smart; 
create table zy_1biz_later_family_contractinfo_smart  as select * from zy_biz_later_family_contractinfo  t where t.REFFAMILYNUM in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 基于上表结果1biz_later_family_contractinfo_smart  （合同明细信息表）
DROP TABLE IF EXISTS zy_1biz_later_family_pub_contract_smart; 
create table zy_1biz_later_family_pub_contract_smart  as select * from zy_biz_later_family_pub_contract  t where t.refcontractid in (select id from zy_1biz_later_family_contractinfo_smart);

-- 家庭编号
 DROP TABLE IF EXISTS zy_1biz_family_recheck_family_smart; 
 create table zy_1biz_family_recheck_family_smart  as select * from zy_biz_family_recheck_family   t where t.FAMILYNUMBER in (select familycode from zy_z_temp_mix_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);
		    
-- 基于上表结果1biz_family_recheck_family_smart
 DROP TABLE IF EXISTS zy_1biz_family_rechecklockinfo_smart; 
 create table zy_1biz_family_rechecklockinfo_smart  as select * from zy_biz_family_rechecklockinfo  t where t.refid in (select id from zy_1biz_family_recheck_family_smart);

-- 基于上表结果zy_1biz_family_rechecklockinfo_smart
-- DROP TABLE IF EXISTS zy_1biz_family_rechecklockdetail_smart;  
-- create table zy_1biz_family_rechecklockdetail_smart  as select * from zy_biz_family_rechecklockdetail  t where t.LOCKID in (select id from zy_1biz_family_rechecklockinfo_smart);


-- 基于 1biz_dist_checkPersion_smart 表的 apply_personid， 因为 9.12 市里的邮件里说了两个字段间的关联关系
-- DROP TABLE IF EXISTS zy_1t_bzf_check_family_member_room_smart; 
-- create table zy_1t_bzf_check_family_member_room_smart  as select * from zy_t_bzf_check_family_member_room  t where t.buyer_IDNO in (select apply_personid from zy_1biz_dist_checkPersion_smart);

-- 选择以 保障资格号码为准
-- DROP TABLE IF EXISTS zy_1view_biz_later_house_rent_smart; 
-- create table zy_1view_biz_later_house_rent_smart  as select * from zy_view_biz_later_house_rent  t where t.registernum in (select RECORDCODE from zy_1base_family_subsidy_smart t);

-- 选择以 familycode为准， 交租金信息 （因为太多，加了2个过滤条件）
   DROP TABLE IF EXISTS zy_1view_house_rent_smart; 
   create table zy_1view_house_rent_smart  as select * from zy_view_house_rent  t where ZJYEARMONTH >= '2015-12' and PRACTICALMONEY > 0 and moneydatebegin >= '2015-12' and t.reffamilynum in (select familycode from zy_base_family_subsidy t);

-- 选择以 familycode为准，为准
   DROP TABLE IF EXISTS zy_1view_house_rent_bt_v_ratio_smart;
   create table zy_1view_house_rent_bt_v_ratio_smart  as select * from zy_view_house_rent_bt_v_ratio  t where  moneydatebegin >= '2015-12' and t.reffamilynum in (select familycode from zy_base_family_subsidy t);

-- 2.5 处理家庭的基础数据 -----------------------
-- 本查询执行的先决条件：
-- 1. zy_base_family_subsidy的 familycode 已经齐备。
-- 2. 3_3_mix家庭合同和交租和补贴表 已经生成
-- 3. 4_7_需要手工计算补贴的多合同家庭 表已经生成

-- 写在前面的情况总结，这个部分是后面的具体查询结果的总结，为了方便查看，写在了前面： 
-- 1. 有L(廉租资格)的 共260户  见 00_有廉租资格家庭
-- 	其中有一个GB的 		-- 248 户
-- 				新GB
-- 				老GB
-- 				老GB不换号转新GB
-- 	其中有多个GB的  
-- 				2个GB		-- 2户
-- 					情况1： 旧 + 旧
-- 					情况2： 旧 + 新
-- 					情况3： 新 + 新
-- 				>2个GB  -- 无
-- 	其中没有GB的		-- 10 户 

-- 2. 没有L的 共 2285户
-- 		没有GB的 		--   15 		
-- 		有1个GB的		-- 2251
-- 		有2个GB的		--   19
-- 		超过2个GB的	-- 		无 
-- 3. 8户身份证不同，但家庭编号一样（4组familycode）







-- 处理过程

-- 因为smart 表是 “市区都符合” + “纯区级” 两部分家庭都有的资格信息，所以，只能重新创建tmp_ana_baseSub，ana 表示 Analysis， sub代表资格
DROP TABLE IF EXISTS tmp_ana_baseSub;
create table tmp_ana_baseSub  as select * from zy_base_family_subsidy t where t.FAMILYCODE in (select familycode from zy_z_temp_mix_family_info z1);


update zy_z_temp_mix_family_info set `ANA`='';
update zy_z_temp_mix_family_info set `ANA_所属分类`=NULL;
update zy_z_temp_mix_family_info set `ANA_处理方式`=NULL;
update zy_z_temp_mix_family_info set `ANA_时间图`=NULL;
update zy_z_temp_mix_family_info set `ANA_新增或变更`= NULL;
update zy_z_temp_mix_family_info set `ANA_GB收件时间`=NULL;
update zy_z_temp_mix_family_info set `ANA_GB备案时间`=NULL;
update zy_z_temp_mix_family_info set `ANA_GB变更备案时间`=NULL;
update zy_z_temp_mix_family_info set `ANA_补贴最终生效时间`=NULL;


-- 1. 有L的 -- 260  select DISTINCT FAMILYCODE 			from tmp_ana_baseSub 			where ( qualificationcode='applytype_003' or qualificationcode='applytype_006') 	
						-- 创建表 00_有廉租资格家庭 用来保存所有具有（或曾经有）L资格的家庭。
						DROP  TABLE IF EXISTS 00_有廉租资格家庭;
						create  table 00_有廉租资格家庭 AS
						select *  
						from tmp_ana_baseSub 
						where FAMILYCODE in 		
										(	select DISTINCT FAMILYCODE 			from tmp_ana_baseSub 			where  ( qualificationcode='applytype_003' or qualificationcode='applytype_006')  		);
					
						-- 查询有L资格的家庭中，有0个GB资格、 1个GB资格、2个GB资格、多个GB资格的家庭。
						DROP  TABLE IF EXISTS 00_有廉租且有1个公租资格家庭;
						create  table 00_有廉租且有1个公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																	SELECT familycode from 
																		(
																				select DISTINCT FAMILYCODE,count(qualificationcode) c
																				from 00_有廉租资格家庭 
																				GROUP BY FAMILYCODE,qualificationcode
																				HAVING qualificationcode='applytype_002'  and  count(qualificationcode) = 1
																		) xx
																)
						ORDER BY FAMILYCODE,RECORDCODE;


						DROP  TABLE IF EXISTS 00_有廉租且有2个公租资格家庭;
						create  table 00_有廉租且有2个公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																	SELECT familycode from 
																		(
																				select DISTINCT FAMILYCODE,count(qualificationcode) c
																				from 00_有廉租资格家庭 
																				GROUP BY FAMILYCODE,qualificationcode
																				HAVING qualificationcode='applytype_002'  and  count(qualificationcode) = 2
																		) xx
																)
						ORDER BY FAMILYCODE,RECORDCODE;	
						
						DROP  TABLE IF EXISTS 00_有廉租且有3个以上公租资格家庭;
						create  table 00_有廉租且有3个以上公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																	SELECT familycode from 
																		(
																				select DISTINCT FAMILYCODE,count(qualificationcode) c
																				from 00_有廉租资格家庭 
																				GROUP BY FAMILYCODE,qualificationcode
																				HAVING qualificationcode='applytype_002'  and  count(qualificationcode) > 2
																		) xx
																)
						ORDER BY FAMILYCODE,RECORDCODE;		


						DROP  TABLE IF EXISTS 00_有廉租且有0个公租资格家庭;
						create  table 00_有廉租且有0个公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																select DISTINCT FAMILYCODE 
																from 00_有廉租资格家庭 
																)		
									and 		
									familycode not in (
																	select DISTINCT  FAMILYCODE 
																	from 00_有廉租且有1个公租资格家庭
																	UNION 
																	select DISTINCT  FAMILYCODE 
																	from 00_有廉租且有2个公租资格家庭
																	UNION 
																	select DISTINCT  FAMILYCODE 
																	from 00_有廉租且有3个以上公租资格家庭
																)
						ORDER BY FAMILYCODE,RECORDCODE;	

						update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='1.1 曾有廉租资格、没有GB资格' 
						where t.familycode in ( SELECT DISTINCT familycode from 00_有廉租且有0个公租资格家庭);

-- 2. 没有L的  -- 2285 
					
						-- 创建表 01_无廉租资格家庭 用来保存所有没有L资格的家庭。
						DROP  TABLE IF EXISTS 01_无廉租资格家庭;
						create  table 01_无廉租资格家庭 AS
							select *  
							from tmp_ana_baseSub 
							where FAMILYCODE not in 		
											(	select DISTINCT FAMILYCODE 			from tmp_ana_baseSub 			where  ( qualificationcode='applytype_003' or qualificationcode='applytype_006') 	);
						
						-- 查询有L资格的家庭中，有0个GB资格、 1个GB资格、2个GB资格、多个GB资格的家庭。
						DROP  TABLE IF EXISTS 01_无廉租且有1个公租资格家庭;
						create  table 01_无廉租且有1个公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																	SELECT familycode from 
																		(
																				select DISTINCT FAMILYCODE,count(qualificationcode) c
																				from 01_无廉租资格家庭 
																				GROUP BY FAMILYCODE,qualificationcode
																				HAVING qualificationcode='applytype_002'  and  count(qualificationcode) = 1
																		) xx
																)
						ORDER BY FAMILYCODE,RECORDCODE;


						DROP  TABLE IF EXISTS 01_无廉租且有2个公租资格家庭;
						create  table 01_无廉租且有2个公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																	SELECT familycode from 
																		(
																				select DISTINCT FAMILYCODE,count(qualificationcode) c
																				from 01_无廉租资格家庭 
																				GROUP BY FAMILYCODE,qualificationcode
																				HAVING qualificationcode='applytype_002'  and  count(qualificationcode) = 2
																		) xx
																)
						ORDER BY FAMILYCODE,RECORDCODE;	
						
						DROP  TABLE IF EXISTS 01_无廉租且有3个以上公租资格家庭;
						create  table 01_无廉租且有3个以上公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																	SELECT familycode from 
																		(
																				select DISTINCT FAMILYCODE,count(qualificationcode) c
																				from 01_无廉租资格家庭 
																				GROUP BY FAMILYCODE,qualificationcode
																				HAVING qualificationcode='applytype_002'  and  count(qualificationcode) > 2
																		) xx
																)
						ORDER BY FAMILYCODE,RECORDCODE;		


						DROP  TABLE IF EXISTS 01_无廉租且有0个公租资格家庭;
						create  table 01_无廉租且有0个公租资格家庭 AS
						select * 
						from  tmp_ana_baseSub
						where 
									familycode in (
																select DISTINCT FAMILYCODE 
																from 01_无廉租资格家庭 
																)		
									and 		
									familycode not in (
																	select DISTINCT  FAMILYCODE 
																	from 01_无廉租且有1个公租资格家庭
																	UNION 
																	select DISTINCT  FAMILYCODE 
																	from 01_无廉租且有2个公租资格家庭
																	UNION 
																	select DISTINCT  FAMILYCODE 
																	from 01_无廉租且有3个以上公租资格家庭
																)
						ORDER BY FAMILYCODE,RECORDCODE;	

						update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='2.1 未曾有廉租资格、没有GB资格' 
						where t.familycode in ( SELECT DISTINCT familycode from 01_无廉租且有0个公租资格家庭);


-- 3. 2户家庭变更过主申请人，即一个家庭有两个身份证号。
--  		
		DROP  TABLE IF EXISTS 02_更换过主申请人的家庭;
		create  table 02_更换过主申请人的家庭 AS		
		select * from zy_z_temp_mix_family_info 
		where familycode in ( 
							select familycode from 
						(select familycode,count(DISTINCT cardid) c from zy_z_temp_mix_family_info GROUP BY familycode  ORDER BY c desc)	zz 
						where zz.c >1)	ORDER BY familycode;
		
-- 变更主申请人的2户家庭，他们都变更过档次：
-- 魏愈彪	432926194712020513 
-- 朱三妹	431129195102120022

-- 袁智祥	412722193712282017
-- 朱妹		412722194206162025



-- applytype_001	保障性住房
-- applytype_002	公租补贴资格
-- applytype_003	廉租补贴资格
-- applytype_004	限价商品房
-- applytype_005	经济适用房
-- applytype_006	廉租房资格
-- applytype_007	市场租房补贴资格

-- --------------------------------------------------------------------------------------------------------------------

-- 更新 zy_z_temp_mix_family_info 的ANA 字段
update zy_z_temp_mix_family_info set ANA='';

update zy_z_temp_mix_family_info set ANA='有廉租和0个公租资格'
where familycode in ( select DISTINCT familycode from 00_有廉租且有0个公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='有廉租和1个公租资格'
where familycode in ( select DISTINCT familycode from 00_有廉租且有1个公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='有廉租和2个公租资格'
where familycode in ( select DISTINCT familycode from 00_有廉租且有2个公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='有廉租和3个及以上公租资格'
where familycode in ( select DISTINCT familycode from 00_有廉租且有3个以上公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='无廉租和0个公租资格'
where familycode in ( select DISTINCT familycode from 01_无廉租且有0个公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='无廉租和1个公租资格'
where familycode in ( select DISTINCT familycode from 01_无廉租且有1个公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='无廉租和2个公租资格'
where familycode in ( select DISTINCT familycode from 01_无廉租且有2个公租资格家庭) ;

update zy_z_temp_mix_family_info set ANA='无廉租和3个及以上公租资格'
where familycode in ( select DISTINCT familycode from 01_无廉租且有3个以上公租资格家庭) ;


-- ---------------------------------------------------------------------------------------------------------------------
-- 更新 zy_z_temp_mix_family_info 的情况表
/*
update zy_z_temp_mix_family_info set Qingkuang='';

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 没有合同家庭 '),`ANA_处理方式`='不予处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%X1-没有合同信息%') ;

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 没有缴纳过租金家庭 '),`ANA_处理方式`='不予处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%X3-没有缴租金记录%') ;


update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 需手工计算家庭'),`ANA_处理方式`='人工处理' 
where cardid in ( select DISTINCT cardid from 4_7_需要手工计算补贴的多合同家庭) ;

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 资格正被锁定家庭'),`ANA_处理方式`='不予处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%X5-该家庭资格目前正被锁定补贴暂缓处理%') ;

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 屏蔽王志雨和李丕元只具备纯区级补贴的家庭'),`ANA_处理方式`='不予处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%X7-对王志雨和李丕元两个只具备纯区级补贴的家庭做屏蔽处理%') ;

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 需手工计算家庭'),`ANA_处理方式`='人工处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%复杂-有多份合同%') ;

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 需手工计算家庭'),`ANA_处理方式`='人工处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%X6-暂缓处理手工定档发生过多次档次变更的家庭%') ;

update zy_z_temp_mix_family_info set Qingkuang=concat(Qingkuang,' 需手工计算家庭'),`ANA_处理方式`='人工处理' 
where cardid in ( select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表 where 筛查结果 like '%X4-多次发生过档次变更%') ;

*/


-- ----------------------------------------------------------------------------------------------
-- 分析：
-- 0级目录
select count(DISTINCT familycode) from zy_z_temp_mix_family_info;

-- 1级目录
select count(DISTINCT familycode) from 00_有廉租资格家庭; -- LEVEL 1
select count(DISTINCT familycode) from 01_无廉租资格家庭;	-- LEVEL 2

-- 2级目录
select count(DISTINCT familycode) from 00_有廉租且有0个公租资格家庭; -- LEVEL 1.1
select count(DISTINCT familycode) from 00_有廉租且有1个公租资格家庭; -- LEVEL 1.2
select count(DISTINCT familycode) from 00_有廉租且有2个公租资格家庭; -- LEVEL 1.3
select count(DISTINCT familycode) from 00_有廉租且有3个以上公租资格家庭; -- LEVEL 1.4

select count(DISTINCT familycode) from 01_无廉租且有0个公租资格家庭;	-- LEVEL 2.1
select count(DISTINCT familycode) from 01_无廉租且有1个公租资格家庭;	-- LEVEL 2.2
select count(DISTINCT familycode) from 01_无廉租且有2个公租资格家庭;	-- LEVEL 2.3
select count(DISTINCT familycode) from 01_无廉租且有3个以上公租资格家庭; -- LEVEL 2.4

-- 3级目录

		-- LEVEL 1.2.1 有L的1个GB家庭，GB收件时间在新政前
					select count(DISTINCT familycode) from 00_有廉租且有1个公租资格家庭 where  qualificationcode='applytype_002' /* and STATE='QUASTATE_001'*/ and  receivedate < '2015-11-16' ; -- LEVEL 1.2.1
					-- 确定为变更家庭： -- LEVEL 1.2.1
					update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='1.2.1 有L的1个GB家庭，GB收件时间在新政前',`ANA_时间图`='GB收件 -> 新政' 
					where t.familycode in (
					select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where  qualificationcode='applytype_002' /* and STATE='QUASTATE_001'*/ and  receivedate < '2015-11-16') ; -- LEVEL 1.2.1
				
		-- LEVEL 1.2.2 有L的1个GB家庭，GB收件时间在新政后
					select count(DISTINCT familycode) from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16' ; -- LEVEL 1.2.2
					-- 有分支，后续处理 -- LEVEL 1.2.2

		-- LEVEL 1.3.1 有L的2个GB家庭，当前有效GB收件时间在新政“前”
					select count(DISTINCT familycode) from 00_有廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE < '2015-11-16' ORDER BY RECEIVEDATE; -- LEVEL 1.3.1 
					-- 确定为变更家庭：
					update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='1.3.1 有L的2个GB家庭，当前有效GB收件时间在新政前',`ANA_时间图`='GB收件 -> 新政' 
					where t.familycode in (
					select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where  qualificationcode='applytype_002' /*and STATE='QUASTATE_001'*/ and receivedate < '2015-11-16') ; -- LEVEL 1.3.1 
		-- LEVEL 1.3.2 有L的2个GB家庭，当前有效GB收件时间在新政“后”
					select count(DISTINCT familycode) from 00_有廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE >= '2015-11-16' ORDER BY RECEIVEDATE; -- LEVEL 1.3.2 
					-- 有分支，后续处理 -- LEVEL 1.3.2


		-- LEVEL 2.2.1 无L的1个GB家庭，新政“前”
					select count(DISTINCT familycode) from 01_无廉租且有1个公租资格家庭 where  qualificationcode='applytype_002' and  receivedate < '2015-11-16' ; -- LEVEL 2.2.1
					-- 确定为变更家庭：
					update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='2.2.1 无L的1个GB家庭，GB收件在新政“前”',`ANA_时间图`='GB收件 -> 新政' 
					where t.familycode in (
					select DISTINCT familycode from 01_无廉租且有1个公租资格家庭 where  qualificationcode='applytype_002' /*and STATE='QUASTATE_001'*/ and receivedate < '2015-11-16') ; -- LEVEL 2.2.1
		
		-- LEVEL 2.2.2 无L的1个GB家庭，新政“后”				
					select count(DISTINCT familycode) from 01_无廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16' ; -- LEVEL 2.2.2
					-- 确定为新增家庭：
					update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='2.2.2 无L的1个GB家庭，GB收件在新政“后”',`ANA_时间图`='新政 -> GB收件' 
					where t.familycode in (
					select DISTINCT familycode from 01_无廉租且有1个公租资格家庭 where  qualificationcode='applytype_002' /*and STATE='QUASTATE_001'*/ and receivedate >= '2015-11-16') ; -- LEVEL 2.2.1

		-- LEVEL 2.3.1 无L的2个GB家庭，当前有效GB收件时间在新政“前”
				select count(DISTINCT familycode) from 01_无廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE < '2015-11-16' ORDER BY RECEIVEDATE; -- LEVEL 2.3.1 
				-- 确定为变更家庭：
				update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='2.3.1 无L的2个GB家庭，当前GB收件在新政“前”',`ANA_时间图`='GB收件 -> 新政' 
				where t.familycode in (
				select DISTINCT familycode from 01_无廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE < '2015-11-16' ORDER BY RECEIVEDATE) ; -- LEVEL 2.3.1

		-- LEVEL 2.3.2 无L的2个GB家庭，当前有效GB收件时间在新政“后”		
				-- 如果旧GB的终止时间不在新GB收件之后，就按新备案
				select count(DISTINCT familycode) from 01_无廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE >= '2015-11-16' ORDER BY RECEIVEDATE; -- LEVEL 2.3.2 

-- 4级目录
	-- LEVEL 1.2.2.1  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的	
  select count(DISTINCT(FAMILYCODE)) 
	from 00_有廉租且有1个公租资格家庭 
	where 
			 familycode in (
												 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
											)
			 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
			 and state != 'QUASTATE_001'  ;
	-- 有分支，后续处理 -- LEVEL 1.2.2.1.2

	-- LEVEL 1.2.2.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“有效”的	
  select count(DISTINCT(FAMILYCODE)) 
	from 00_有廉租且有1个公租资格家庭 
	where 
			 familycode in (
												 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
											)
			 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
			 and state = 'QUASTATE_001' ; 
				
	
	update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='1.2.2.2 有L的1个GB家庭，GB收件时间在新政后，L资格当前“有效”',`ANA_时间图`='新政 -> GB收件 -> 当前廉租资格依旧生效中' 
	where t.familycode in ( select DISTINCT FAMILYCODE  
													from 00_有廉租且有1个公租资格家庭 
													where 
															 familycode in (
																								 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
																							)
															 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
															 and state = 'QUASTATE_001' 
												);	
		
	-- LEVEL 1.3.2.1  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的	
  select count(DISTINCT(FAMILYCODE)) 
	from 00_有廉租且有2个公租资格家庭 
	where 
			 familycode in (
												 select DISTINCT familycode from  00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
											)
			 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
			 and state != 'QUASTATE_001';  
		-- 有分支，后续处理

	-- LEVEL 1.3.2.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“有效”的	
  select count(DISTINCT(FAMILYCODE)) 
	from 00_有廉租且有2个公租资格家庭 
	where 
			 familycode in (
												 select DISTINCT familycode from  00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
											)
			 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
			 and state = 'QUASTATE_001';  

	update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='1.3.2.2 有L的2个GB家庭，GB收件时间在新政后，L资格当前“有效”',`ANA_时间图`='新政 -> GB收件 -> 当前廉租资格依旧生效中' 
	where t.familycode in ( select DISTINCT FAMILYCODE 
													from 00_有廉租且有2个公租资格家庭 
													where 
															 familycode in (
																								 select DISTINCT familycode from  00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
																							)
															 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
															 and state = 'QUASTATE_001' 
												);


	--  LEVEL 2.3.2.1 无L的2个GB家庭，当前有效GB收件时间在新政“后”,旧GB的终止时间在新GB收件之前	
  
		-- 查找旧GB的终止时间和新GB的收件时间：
				update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='2.3.2.1 无L的2个GB家庭，当前有效GB收件时间在新政“后”，旧GB的终止时间在新GB收件之前',`ANA_时间图`='新政 -> 旧GB终止 -> 新GB收件' 
				where t.familycode in (
				select DISTINCT FAMILYCODE 
				from (
							select familycode,max(TERMINATEDATE) term,MAX(RECEIVEDATE) rec from 01_无廉租且有2个公租资格家庭 t 
							where  t.familycode in (
																			select 	DISTINCT familycode	 from 01_无廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE >= '2015-11-16' ORDER BY RECEIVEDATE
																			)
										 and QUALIFICATIONCODE = 'applytype_002' 
							GROUP BY FAMILYCODE
						) t
				where t.term <= t.rec );

		--  LEVEL 2.3.2.2 无L的2个GB家庭，当前有效GB收件时间在新政“后”,缺少旧GB的终止时间			
				-- 缺少旧GB的终止时间,人工处理
				update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='2.3.2.2 无L的2个GB家庭，当前有效GB收件时间在新政“后”，缺少旧GB的终止时间',`ANA_时间图`='新政 -> 旧GB终止时间缺失？新GB收件' 
				where t.familycode in (
				select DISTINCT FAMILYCODE 
				from (
							select familycode,date(max(TERMINATEDATE)) term,date(MAX(RECEIVEDATE)) rec from 01_无廉租且有2个公租资格家庭 t 
							where  t.familycode in (
																			select 	DISTINCT familycode	 from 01_无廉租且有2个公租资格家庭 where QUALIFICATIONCODE = 'applytype_002' /*and STATE='QUASTATE_001'*/ and RECEIVEDATE >= '2015-11-16' ORDER BY RECEIVEDATE
																			)
										 and QUALIFICATIONCODE = 'applytype_002' 
							GROUP BY FAMILYCODE
						) s
				where s.term is null );

-- 5级目录

--  LEVEL 1.2.2.1.1  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政前”失效的
		select count(DISTINCT(FAMILYCODE)) 
		from 00_有廉租且有1个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is not null 
				 and TERMINATEDATE < '2015-11-16';

		update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_所属分类`='1.2.2.1.1  有L的1个GB家庭，GB收件时间在新政后，资格当前“无效”的，L资格在“新政前”失效',`ANA_新增或变更`='新增',`ANA_时间图`='L资格终止 -> 新政 -> GB收件' 
		where t.familycode in (
														select DISTINCT FAMILYCODE 
														from 00_有廉租且有1个公租资格家庭 
														where 
																 familycode in (
																									 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
																								)
																 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
																 and state != 'QUASTATE_001'  
																 and TERMINATEDATE is not null 
																 and TERMINATEDATE < '2015-11-16'
													);
--  LEVEL 1.2.2.1.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的
		select count(DISTINCT(FAMILYCODE)) 
		from 00_有廉租且有1个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is not null 
				 and TERMINATEDATE >= '2015-11-16';
		-- 有分支，后续处理 -- LEVEL 1.2.2.1.2

--  LEVEL 1.2.2.1.3  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格不知在什么时候失效的
		select count(DISTINCT(FAMILYCODE)) 
		from 00_有廉租且有1个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is null ;

		update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='1.2.2.1.3  有L的1个GB家庭，GB收件时间在新政后，L资格当前“无效”的，L资格不知在什么时候失效',`ANA_时间图`='？L终止时间未知  新政 -> GB收件' 
		where t.familycode in ( select DISTINCT FAMILYCODE 
														from 00_有廉租且有1个公租资格家庭 
														where 
																 familycode in (
																									 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
																								)
																 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
																 and state != 'QUASTATE_001'  
																 and TERMINATEDATE is null 
													 );
	
--  LEVEL 1.3.2.1.1  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政前”失效的
		select count(DISTINCT(FAMILYCODE)) 
		from 00_有廉租且有2个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is not null 
				 and TERMINATEDATE < '2015-11-16';
		-- 判断为新增
		update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='1.3.2.1.1  有L的2个GB家庭，GB收件时间在新政后，L资格当前“无效”的，L资格在“新政前”失效',`ANA_时间图`='L资格终止 -> 新政 -> 新GB收件' 
		where t.familycode in (
														select DISTINCT FAMILYCODE 
														from 00_有廉租且有2个公租资格家庭 
														where 
																 familycode in (
																									 select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
																								)
																 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
																 and state != 'QUASTATE_001'  
																 and TERMINATEDATE is not null 
																 and TERMINATEDATE < '2015-11-16'
													);

--  LEVEL 1.3.2.1.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的
		select count(DISTINCT(FAMILYCODE)) 
		from 00_有廉租且有2个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is not null 
				 and TERMINATEDATE >= '2015-11-16';
		-- 有分支，后续处理 -- LEVEL 1.3.2.1.2

--  LEVEL 1.3.2.1.3  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格不知在什么时候失效的
		select count(DISTINCT(FAMILYCODE)) 
		from 00_有廉租且有2个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is null ;
			
		update zy_z_temp_mix_family_info t set `ANA_处理方式`='人工处理',`ANA_所属分类`='1.3.2.1.3  有L的2个GB家庭，GB收件时间在新政后，L资格当前“无效”的，L资格不知在什么时候失效',`ANA_时间图`='？L终止时间未知  新政 -> GB收件' 
		where t.familycode in (
														select DISTINCT FAMILYCODE  
														from 00_有廉租且有2个公租资格家庭 
														where 
																 familycode in (
																									 select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
																								)
																 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
																 and state != 'QUASTATE_001'  
																 and TERMINATEDATE is null); 


-- 6级目录

	--  LEVEL 1.2.2.1.2下属：  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间早于/晚于/等于GB收件时间
		-- 本节的结果为 tmp_deleteme1 表
		DROP  TABLE IF EXISTS tmp_deleteme1;
		create  table tmp_deleteme1 AS
		select FAMILYCODE,date(max(TERMINATEDate)) LTermDate 
		from 00_有廉租且有1个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有1个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.2.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is not null 
				 and TERMINATEDATE >= '2015-11-16'
		GROUP BY familycode;

		ALTER TABLE `tmp_deleteme1` ADD COLUMN `GB_receivedate`  date NULL ;
		
		update tmp_deleteme1 t 
		set t.GB_receivedate = ( 	SELECT date(receivedate) from 00_有廉租且有1个公租资格家庭 
															where qualificationcode = 'applytype_002' and t.familycode = 00_有廉租且有1个公租资格家庭.familycode
														);

		select count(DISTINCT familycode) from tmp_deleteme1 where LTermDate < GB_receivedate; -- LEVEL 1.2.2.1.2.1  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“早于”GB收件时间
					update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='1.2.2.1.2.1  有L的1个GB家庭，GB收件时间在新政后，L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“早于”GB收件时间',`ANA_时间图`='新政 -> L资格终止 -> GB收件' 
					where t.familycode in ( select DISTINCT familycode from tmp_deleteme1 where LTermDate < GB_receivedate);
		select count(DISTINCT familycode) from tmp_deleteme1 where LTermDate > GB_receivedate; -- LEVEL 1.2.2.1.2.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间
					-- 有分支，后续处理 -- LEVEL 1.2.2.1.2.2
		select count(DISTINCT familycode) from tmp_deleteme1 where LTermDate = GB_receivedate; -- LEVEL 1.2.2.1.2.3  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“等于”GB收件时间
					update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='1.2.2.1.2.3  有L的1个GB家庭，GB收件时间在新政后，L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“等于”GB收件时间',`ANA_时间图`='新政 -> L资格终止 == GB收件' 
					where t.familycode in ( select DISTINCT familycode from tmp_deleteme1 where LTermDate = GB_receivedate);

	--  LEVEL 1.3.2.1.2下属  有L的“2个”GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间早于/晚于/等于GB收件时间
		-- 本节的结果为 tmp_deleteme2 表
		DROP  TABLE IF EXISTS tmp_deleteme2;
		create  table tmp_deleteme2 AS
		select FAMILYCODE,date(max(TERMINATEDate)) LTermDate 
		from 00_有廉租且有2个公租资格家庭 
		where 
				 familycode in (
													 select DISTINCT familycode from 00_有廉租且有2个公租资格家庭 where qualificationcode='applytype_002' and  receivedate >= '2015-11-16'  -- LEVEL 1.3.2
												)
				 and (qualificationcode='applytype_003' or qualificationcode='applytype_006') -- 廉租补贴资格
				 and state != 'QUASTATE_001'  
				 and TERMINATEDATE is not null 
				 and TERMINATEDATE >= '2015-11-16'
		GROUP BY familycode;

		ALTER TABLE `tmp_deleteme2` ADD COLUMN `GB_receivedate`  date NULL ;
		
		update tmp_deleteme2 t 
		set t.GB_receivedate = ( 	SELECT max(date(receivedate)) from 00_有廉租且有2个公租资格家庭 
															where qualificationcode = 'applytype_002' and t.familycode = 00_有廉租且有2个公租资格家庭.familycode
														);

		select count(DISTINCT familycode) from tmp_deleteme2 where LTermDate < GB_receivedate; -- LEVEL 1.3.2.1.2.1  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“早于”GB收件时间
				update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='1.3.2.1.2.1  有L的2个GB家庭，GB收件时间在新政后，L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“早于”GB收件时间',`ANA_时间图`='新政 -> L资格终止 == GB收件' 
				where t.familycode in ( select DISTINCT familycode from tmp_deleteme2 where LTermDate < GB_receivedate);
		select count(DISTINCT familycode) from tmp_deleteme2 where LTermDate > GB_receivedate; -- LEVEL 1.3.2.1.2.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间
				-- 有分支，后续处理 -- LEVEL 1.3.2.1.2.2
		select count(DISTINCT familycode) from tmp_deleteme2 where LTermDate = GB_receivedate; -- LEVEL 1.3.2.1.2.3  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“等于”GB收件时间
				update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='新增',`ANA_所属分类`='1.3.2.1.2.3  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“等于”GB收件时间',`ANA_时间图`='新政 -> L资格终止 == GB收件' 
				where t.familycode in ( select DISTINCT familycode from tmp_deleteme2 where LTermDate = GB_receivedate);

-- 7级目录

			-- LEVEL 1.2.2.1.2.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间
						ALTER TABLE `tmp_deleteme1` ADD COLUMN `GB_BeiAnDate`  date NULL ;
					
						update tmp_deleteme1 t 
						set t.GB_BeiAnDate = ( 	SELECT date(max(UPDATEDATE)) from zy_biz_family_subsidy s
																			where 
																								s.QUALIFICATIONNUMBER = 'applytype_002' 
																						and s.state = 'QUASTATE_001'
																						and t.familycode = s.familynumber
																		);
						select count(DISTINCT familycode)  from tmp_deleteme1 
						where 		LTermDate > GB_receivedate
									and LTermDate < GB_BeiAnDate; -- LEVEL 1.2.2.1.2.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间
						
						-- ！！！ LTermDate > GB_receivedate 是本节需要处理的问题
						
						-- LEVEL 1.2.2.1.2.2.1  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间,"GB变更备案"时间早于L终止时间						
								update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='人工处理',`ANA_所属分类`='1.2.2.1.2.2.1  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“晚于”GB收件时间，"GB变更备案"时间早于L终止时间',`ANA_时间图`='新政 -> GB收件 -> GB变更备案 -> L资格终止' 
								where t.familycode in (
																					select DISTINCT FAMILYCODE 
																					from tmp_deleteme1 
																					where  LTermDate > GB_receivedate  and  GB_receivedate < GB_BeiAnDate and GB_BeiAnDate < LTermDate
																			);
						-- LEVEL 1.2.2.1.2.2.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间,"GB变更备案"时间等于L终止时间						
								update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='1.2.2.1.2.2.2  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“晚于”GB收件时间，"GB变更备案"时间等于L终止时间',`ANA_时间图`='新政 -> GB收件 -> L资格终止 == GB变更备案' 
								where t.familycode in (
																					select DISTINCT FAMILYCODE 
																					from tmp_deleteme1 
																					where  LTermDate > GB_receivedate  and  GB_receivedate < GB_BeiAnDate and GB_BeiAnDate = LTermDate
																			);		
						-- LEVEL 1.2.2.1.2.2.3  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间,"GB变更备案"时间晚于L终止时间						
								update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='1.2.2.1.2.2.3  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“晚于”GB收件时间，"GB变更备案"时间晚于L终止时间',`ANA_时间图`='新政 -> GB收件 -> L资格终止 -> GB变更备案' 
								where t.familycode in (
																					select DISTINCT FAMILYCODE 
																					from tmp_deleteme1 
																					where  LTermDate > GB_receivedate  and   GB_receivedate < GB_BeiAnDate and LTermDate < GB_BeiAnDate
																			);		

			-- LEVEL 1.3.2.1.2.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间
						ALTER TABLE `tmp_deleteme2` ADD COLUMN `GB_BeiAnDate`  date NULL ;
					
						update tmp_deleteme2 t 
						set t.GB_BeiAnDate = ( 	SELECT date(max(UPDATEDATE)) from zy_biz_family_subsidy s
																			where 
																								s.QUALIFICATIONNUMBER = 'applytype_002' 
																						/*and s.state = 'QUASTATE_001'*/
																						and t.familycode = s.familynumber
																		);
						select * from tmp_deleteme2 where LTermDate > GB_receivedate; -- LEVEL 1.3.2.1.2.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间
		
						-- ！！！ LTermDate > GB_receivedate 是本节需要处理的问题
						
						-- LEVEL 1.3.2.1.2.2.1  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间,"GB变更备案"时间早于L终止时间						
								update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='人工处理',`ANA_所属分类`='1.3.2.1.2.2.1  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“晚于”GB收件时间，"GB变更备案"时间早于L终止时间',`ANA_时间图`='新政 -> GB收件 -> GB变更备案 -> L资格终止' 
								where t.familycode in (
																					select DISTINCT FAMILYCODE 
																					from tmp_deleteme2 
																					where  LTermDate > GB_receivedate  and  GB_receivedate < GB_BeiAnDate and GB_BeiAnDate < LTermDate
																			);
						-- LEVEL 1.3.2.1.2.2.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间,"GB变更备案"时间等于L终止时间						
								update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='1.3.2.1.2.2.2  有L的2个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“晚于”GB收件时间，"GB变更备案"时间等于L终止时间',`ANA_时间图`='新政 -> GB收件 -> L资格终止 == GB变更备案' 
								where t.familycode in (
																					select DISTINCT FAMILYCODE 
																					from tmp_deleteme2 
																					where  LTermDate > GB_receivedate  and  GB_receivedate < GB_BeiAnDate and GB_BeiAnDate = LTermDate
																			);		
						-- LEVEL 1.2.2.1.2.2.3  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的,L终止时间“晚于”GB收件时间,"GB变更备案"时间晚于L终止时间						
								update zy_z_temp_mix_family_info t set `ANA_处理方式`='系统处理',`ANA_新增或变更`='变更',`ANA_所属分类`='1.3.2.1.2.2.3  有L的1个GB家庭，GB收件时间在新政后,L资格当前“无效”的，L资格在“新政后”失效的，L终止时间“晚于”GB收件时间，"GB变更备案"时间晚于L终止时间',`ANA_时间图`='新政 -> GB收件 -> L资格终止 -> GB变更备案' 
								where t.familycode in (
																					select DISTINCT FAMILYCODE 
																					from tmp_deleteme2 
																					where  LTermDate > GB_receivedate  and   GB_receivedate < GB_BeiAnDate and GB_BeiAnDate > LTermDate
																			);		

-- ANA_GB收件时间
update zy_z_temp_mix_family_info t set ANA_GB收件时间 = ( select max(receivedate) from tmp_ana_basesub where qualificationcode = 'applytype_002' and t.familycode=familycode);
-- ANA_GB备案时间
update zy_z_temp_mix_family_info t set ANA_GB备案时间 = ( select max(RECORDDATE) from tmp_ana_basesub where qualificationcode = 'applytype_002' and t.familycode=familycode);
-- ANA_GB变更备案时间
-- ！！！2015-11-16日新政发文后，只要他来做过成功的公租补贴资格的操作，就当作是GB变更备案时间 
update zy_z_temp_mix_family_info t set ANA_GB变更备案时间 = ( 
																															select min(s.updatedate) 
																															from zy_biz_family_subsidy s,zy_biz_family_info i 
																															where s.FAMILYNUMBER = i.FAMILYNUMBER
																															and t.familycode = s.FAMILYNUMBER
																															and s.QUALIFICATIONNUMBER = 'applytype_002' 
																															and s.updatedate >= '2015-11-1' 
																															and s.state = 'QUASTATE_001'
																															and  s.BIZNUM = i.BIZNUM and i.biztype='BIZ002'
																															and (i.APPROVESTATE = 'QUASTATE_001' or i.APPROVESTATE = 'applystop_record' or i.APPROVESTATE = 'workover') -- 此变更为"有效"或“已备案”
																															);


update zy_z_temp_mix_family_info t set `ANA_补贴最终生效时间` = ANA_GB变更备案时间 where `ANA_新增或变更`='变更';
update zy_z_temp_mix_family_info t set `ANA_补贴最终生效时间` = ANA_GB收件时间 where `ANA_新增或变更`='新增';
-- 如果上述方法 ANA_补贴最终生效时间 依然为 null，那么只能用手工收件时间填充到ANA_补贴最终生效时间了。
update zy_z_temp_mix_family_info t set `ANA_补贴最终生效时间` = `EffDate` where  `ANA_补贴最终生效时间` is null;
update zy_z_temp_mix_family_info set `ANA_补贴最终生效时间` = '2015-12-1' 
where `ANA_补贴最终生效时间`< '2015-12-1' and  `ANA_补贴最终生效时间`>='2015-11-1';


-- 2017年3月10日，因为无非过滤出租房面积小于50平米，并且转新GB资格前按廉租资格领补贴的家庭，经过协商，改变策略：
-- 由上面的算法过滤出“系统（由市里数据库）找出的生效时间”、与人工台账时间不一致的220户家庭，交给高光部门人工确认最终生效日期，除了这220户以外，其他人都按照人工台账时间为准。

--  整理  2015-11月递交申请的人，升级为 2015-12-1 .
update zy_z_temp_mix_family_info set `ANA_补贴最终生效时间` = '2015-12-1' 
where `ANA_补贴最终生效时间`< '2015-12-1' and  `ANA_补贴最终生效时间`>='2015-11-1';


-- 提前做 验证6 区里人工录入月份 与 ANA_补贴最终生效时间 不一致的
	SELECT DISTINCT '算法生效时间->人工录入', CardID,`name`,EffDate '区里人工录入月份',`ANA_补贴最终生效时间`  
	from zy_z_temp_mix_family_info where EXTRACT(YEAR_MONTH FROM `ANA_补贴最终生效时间`) < EXTRACT(YEAR_MONTH FROM EffDate) 
	and EffDate='2017-2';
	
	SELECT DISTINCT '人工录入->算法生效时间', `CardID`,`name`,EffDate '区里人工录入月份',`ANA_补贴最终生效时间`  
	from zy_z_temp_mix_family_info 
	where EXTRACT(YEAR_MONTH FROM `ANA_补贴最终生效时间`) > EXTRACT(YEAR_MONTH FROM EffDate)  
	and EffDate='2017-2';
	
	
update `zy_z_temp_mix_family_info` set `ANA_补贴最终生效时间` = `EffDate` 
where cardid not in 
(
'110108196304228944',
'110108196705193711',
'110108198106027331',
'110108196304053435',
'11010819610902273X',
'110108196406075424',
'110101197007073026',
'110101197306073026',
'11010219570814113X',
'110102195906121519',
'110102196304283320',
'110102196308093030',
'110102196411032498',
'110102196802070440',
'110102198012293059',
'110102198307081512',
'110102198402030836',
'110103195901221859',
'110103196105040357',
'110103197003150031',
'11010419590114161X',
'110104196105311256',
'110104198108272028',
'110105196309253613',
'110105197708061533',
'110107196505102719',
'110107198110023417',
'110108193508071420',
'110108195310040038',
'110108195501155727',
'110108195501186056',
'110108195507183155',
'110108195509192741',
'110108195510306013',
'110108195709134247',
'110108195711175419',
'110108195805070052',
'110108195807272213',
'110108195810055412',
'110108195904176039',
'110108196107202761',
'110108196112215436',
'11010819620601001X',
'110108196206257645',
'11010819621109414X',
'110108196306212217',
'110108196311026072',
'110108196411102714',
'110108196412282251',
'110108196603222235',
'110108196605264922',
'110108196606152738',
'11010819660927575X',
'110108196612103123',
'11010819661214681X',
'110108196705266028',
'110108196707256018',
'110108196710020081',
'110108196802208639',
'11010819680607632X',
'110108196901212756',
'110108196903112759',
'110108196907212757',
'110108196909236314',
'11010819691127271X',
'110108197002146817',
'110108197012254977',
'110108197101067313',
'110108197107180034',
'110108197110280714',
'110108197301021432',
'110108197304155719',
'110108197307050410',
'110108197308184939',
'110108197411163757',
'110108197510319323',
'110108197804016344',
'110108197905089315',
'110108197907015731',
'110108198002065739',
'110108198004025415',
'110108198004074225',
'110108198006168612',
'110108198010071442',
'110108198106270016',
'110108198107080038',
'11010819811010271X',
'110108198201212236',
'110108198202089735',
'110108198212265413',
'110108198301174628',
'110108198304178616',
'110108198307043418',
'110108198307224913',
'110108198403232753',
'110108198405193735',
'110108198406283425',
'110108198503220418',
'110108198504186012',
'110108198508219715',
'11010819851207271X',
'110108198606264915',
'110108198608219712',
'110108198609262712',
'110108198610182226',
'110108198702236826',
'110108198708234952',
'110108198711083120',
'110108198802098619',
'110108198903049728',
'110108199202242714',
'110108199303192736',
'110108199607310447',
'110109196302271822',
'110109197309234615',
'110111197507023036',
'110111197811180036',
'110111198004220817',
'110221197107167311',
'110221198307152848',
'11022319790327601X',
'110224196206221824',
'110224197002241238',
'110225196406032231',
'110227198907171848',
'110229198202102220',
'120101198104211554',
'130324197803242133',
'130705197303083044',
'131082198302280433',
'13243519550321172X',
'132438195911115314',
'132438196508262810',
'133031196801034213',
'152624198207060129',
'152801197003020610',
'152824197008150320',
'220882195207180523',
'222302195007081531',
'230103195103084826',
'230103195604242431',
'230306196101154725',
'230524196506020024',
'230827194809024053',
'232103196807125565',
'320721197612252476',
'370205197710267518',
'370921197111023616',
'371312198707226234',
'410781197504123114',
'41272819891020685X',
'420881196902194412',
'420984198301125634',
'421002197907121016',
'430403194905232017',
'452523196907150037',
'522401198402213817',
'610121198511136733',
'110101197006063547',
'110101197102210551',
'110102195903282333',
'110102195912280487',
'110102196310070022',
'110105199010125434',
'110107197606200646',
'11010819561107141X',
'110108195704082337',
'110108195907046336',
'110108196401132717',
'110108196403232738',
'110108196706255806',
'110108196803080059',
'110108196904196317',
'110108197010266106',
'110108197104209321',
'110108197107305714',
'110108197210145480',
'110108197212142726',
'110108197611122714',
'110108197902184229',
'110108197911031419',
'110108198101270922',
'11010819820306541X',
'110108198204142739',
'11010819820701541X',
'110108198304032713',
'110108198311069717',
'110108198404302733',
'110108198502262712',
'110108198508052740',
'110108198606254274',
'110108198702130933',
'110108198709119737',
'110108198812041413',
'110109196610272528',
'110111198510206129',
'142723197701251812',
'152224195307060024',
'210702195810240026',
'220821197810239223',
'410827195106170271',
'110102197508123315',
'110102198406120038',
'110108195808045717',
'110108195906235506',
'110108196611272718',
'110108198302230927',
'110108196503266337',
'110108199303230050',
'110108198607160421'
);


-- ANA_GB终止时间
-- ！第一步：找出所有GB资格都为终止状态的家庭
-- ！第二步：每个家庭选取“最晚终止的GB资格时间” 作为GB终止时间。
		DROP  TABLE IF EXISTS tmp_deleteme3;
		create  table  tmp_deleteme3 AS  -- 家里有终止GB的家庭
		select DISTINCT FAMILYCODE from tmp_ana_basesub  where QUALIFICATIONCODE = 'applytype_002' and  state !='QUASTATE_001';  
		
		delete from tmp_deleteme3 where familycode in 
		(	select DISTINCT familycode 
				from tmp_ana_basesub 
				where FAMILYCODE in 
										(select DISTINCT FAMILYCODE 
											from tmp_ana_basesub  
											where QUALIFICATIONCODE = 'applytype_002' and  state !='QUASTATE_001'
										) 
				and QUALIFICATIONCODE = 'applytype_002' and  state ='QUASTATE_001' 
		);
		
		select * from tmp_ana_basesub where FAMILYCODE in (select FAMILYCODE from tmp_deleteme3) and QUALIFICATIONCODE = 'applytype_002' ORDER BY familycode;
		
		UPDATE zy_z_temp_mix_family_info t set ANA_GB终止时间 = 
		(select date(max(TERMINATEDate))
		from tmp_ana_basesub 
		where 
					FAMILYCODE in (select DISTINCT FAMILYCODE from tmp_deleteme3) 
			and QUALIFICATIONCODE = 'applytype_002'
			and t.familycode = FAMILYCODE);




-- !!! biznum 和 BIZtype 很重要！ biznum 是业务编号，biztype 是业务类型
/* BIZ001	资格申请
BIZ002	资格变更
BIZ003	资格终止
BIZ004	三房轮候申请
BIZ005	承租人变更
BIZ006	市场租赁补贴与公租补贴资格转换


change_type
change_type001	主申请人基本信息变更（一级变更）
change_type002	住房收入资产变更（二级变更）
change_type003	增加新生儿(二级变更）
change_type004	增减家庭成员(三级变更）
change_type005	特殊(优先)情况变更（三级变更）
change_type006	保障方式变更租金转实物（三级变更）
change_type007	优先变更（三级变更）
change_type008	保障方式变更经转限（三级变更）
change_type009	其它家庭成员信息变更（二级变更）
change_type010	租金补贴档次变更（二级变更）
change_type011	配租户型变更（二级变更）
change_type012	廉租补贴金额变更（三级变更）

QUASTATE_001	有效
QUASTATE_010	无效

select DISTINCT ANA from zy_z_temp_mix_family_info where `ANA_处理方式` is null;	*/



-- 3 算法 --------------------

-- mix家庭 与 合同基本信息对应表
DROP  TABLE IF EXISTS 3_0_mix家庭合同基本信息表;
create table 3_0_mix家庭合同基本信息表 as 
SELECT
zy_z_temp_mix_family_info.CardID,
zy_z_temp_mix_family_info.`Name`,
zy_z_temp_mix_family_info.familycode,
zy_z_temp_mix_family_info.ANA,
zy_z_temp_mix_family_info.`ANA_所属分类`,
zy_z_temp_mix_family_info.`ANA_处理方式`,
zy_z_temp_mix_family_info.`ANA_时间图`,
zy_z_temp_mix_family_info.`ANA_新增或变更`,
zy_z_temp_mix_family_info.`ANA_GB收件时间`,
zy_z_temp_mix_family_info.`ANA_GB备案时间`,
zy_z_temp_mix_family_info.`ANA_GB变更备案时间`,
zy_z_temp_mix_family_info.`ANA_补贴最终生效时间`,
zy_z_temp_mix_family_info.`ANA_GB终止时间`,
zy_z_temp_mix_family_info.type,
zy_z_temp_mix_family_info.CityRatio,
zy_z_temp_mix_family_info.DistRatio,
zy_z_temp_mix_family_info.EffDate,
zy_z_temp_mix_family_info.RecDate, -- add 2017-2-16
zy_z_temp_mix_family_info.remark, -- add 2017-2-16
zy_z_temp_mix_family_info.IncomeMonthly,
zy_z_temp_mix_family_info.valid,
zy_1biz_later_family_contractinfo_smart.BEGINDATE con_BEGINDATE,
zy_1biz_later_family_contractinfo_smart.ENDDATE con_ENDDATE,
zy_1biz_later_family_contractinfo_smart.CONTRACTTYPE con_CONTRACTTYPE,
zy_1biz_later_family_contractinfo_smart.CONTRACTSTATE con_CONTRACTSTATE,
zy_1biz_later_family_contractinfo_smart.TENANTNAME con_TENANTNAME,
zy_1biz_later_family_contractinfo_smart.id con_CONID 
FROM
zy_z_temp_mix_family_info
LEFT JOIN zy_1biz_later_family_contractinfo_smart ON zy_z_temp_mix_family_info.familycode = zy_1biz_later_family_contractinfo_smart.REFFAMILYNUM
;

-- begin 增加一条“筛查结果记录”
ALTER TABLE `3_0_mix家庭合同基本信息表` ADD COLUMN `筛查结果`  varchar(1000) NULL DEFAULT '';
-- end 增加一条“筛查结果记录”

-- begin 对没有合同信息的家庭做标记 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
SELECT familycode,count(DISTINCT con_conid) c from 3_0_mix家庭合同基本信息表 GROUP BY familycode;

update 3_0_mix家庭合同基本信息表 t set t.筛查结果=concat(t.筛查结果,'X1-没有合同信息') where familycode in (
	select DISTINCT familycode 
	from zy_deleteme
	where c = 0
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对没有合同信息的家庭做标记 


-- begin 有多份合同的家庭做标记。 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
SELECT familycode,count(DISTINCT con_CONID) c from 3_0_mix家庭合同基本信息表 where 3_0_mix家庭合同基本信息表.con_CONID is not null GROUP BY familycode order by c desc;

update 3_0_mix家庭合同基本信息表 t set t.筛查结果=concat(t.筛查结果,'X2复杂-有多份合同') where familycode in (
	select DISTINCT familycode 
	from zy_deleteme
	where c > 1
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对没有合同信息的家庭做标记 

DROP  TABLE IF EXISTS 3_1_mix家庭合同具体信息表;
create table 3_1_mix家庭合同具体信息表 as 
SELECT
3_0_mix家庭合同基本信息表.*,
zy_1biz_later_family_pub_contract_smart.ITEMNAME condetail_项目名称,
zy_1biz_later_family_pub_contract_smart.CONTRACTNUM condetail_CONTRACTNUM,
zy_1biz_later_family_pub_contract_smart.HOUSEADDRESS condetail_HOUSEADDRESS,
zy_1biz_later_family_pub_contract_smart.BASEMONEY condetail_BASEMONEY,
zy_1biz_later_family_pub_contract_smart.STRUCTUREAREA condetail_STRUCTUREAREA,
zy_1biz_later_family_pub_contract_smart.MOTHMONEY condetail_MONTHMONEY,
zy_1biz_later_family_pub_contract_smart.VALUEADDMONEY condetail_VALUEADDMONEY,
zy_1biz_later_family_pub_contract_smart.MONTHWITHHOLDMONEY condetail_MONTHWITHHOLDMONEY,
zy_1biz_later_family_pub_contract_smart.WITHHOLDNAME condetail_WITHHOLDNAME,
zy_1biz_later_family_pub_contract_smart.WITHHOLDNUM condetail_WITHHOLDNUM,
zy_1biz_later_family_pub_contract_smart.REGISTERNUM condetail_REGISTERNUM,
zy_1biz_later_family_pub_contract_smart.RENTALWITHHOLDDATE condetail_RENTALWITHHOLDDATE
FROM 
3_0_mix家庭合同基本信息表 
LEFT JOIN zy_1biz_later_family_pub_contract_smart ON 3_0_mix家庭合同基本信息表.con_CONID = zy_1biz_later_family_pub_contract_smart.REFCONTRACTID; 



DROP  TABLE IF EXISTS 3_2_mix家庭合同和交租表;
create table 3_2_mix家庭合同和交租表 as 
SELECT
3_1_mix家庭合同具体信息表.*,
zy_1view_house_rent_smart.ZJYEARMONTH 					rent_ZJYEARMONTH ,
zy_1view_house_rent_smart.RENTALDATE                   rent_RENTALDATE ,
zy_1view_house_rent_smart.PAYABLEMONEY                 rent_PAYABLEMONEY ,
zy_1view_house_rent_smart.RECEIVABLEMONEY              rent_RECEIVABLEMONEY ,
zy_1view_house_rent_smart.PRACTICALMONEY               rent_PRACTICALMONEY ,
zy_1view_house_rent_smart.RECEIVEDDATE                 rent_RECEIVEDDATE ,
zy_1view_house_rent_smart.WITHHOLDBANK                 rent_WITHHOLDBANK ,
zy_1view_house_rent_smart.WITHHOLDBANKNUM              rent_WITHHOLDBANKNUM ,
zy_1view_house_rent_smart.RENTALSTATE                  rent_RENTALSTATE ,
zy_1view_house_rent_smart.MONEYDATEBEGIN               rent_MONEYDATEBEGIN ,
zy_1view_house_rent_smart.MONEYDATEEND                 rent_MONEYDATEEND ,
zy_1view_house_rent_smart.ITEMNAME                     rent_ITEMNAME ,
zy_1view_house_rent_smart.TENANTNAME                   rent_TENANTNAME ,
zy_1view_house_rent_smart.TENANTCERTIFICATENUM         rent_TENANTCERTIFICATENUM ,
zy_1view_house_rent_smart.REFFAMILYNUM                 rent_REFFAMILYNUM ,
zy_1view_house_rent_smart.REFCONID                     rent_REFCONID
FROM 
3_1_mix家庭合同具体信息表 
LEFT JOIN zy_1view_house_rent_smart ON 
		3_1_mix家庭合同具体信息表.condetail_REGISTERNUM 	= zy_1view_house_rent_smart.registernum 
and 3_1_mix家庭合同具体信息表.con_CONID 							= zy_1view_house_rent_smart.REFCONID ; 


-- begin 对没有缴费记录的家庭做标记 ， 前提是该家庭有合同。 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
select familycode,`name`,sum(rent_PRACTICALMONEY) c from 3_2_mix家庭合同和交租表 GROUP BY familycode order by c;

update 3_2_mix家庭合同和交租表 t set t.筛查结果=concat(t.筛查结果,' X3-没有缴租金记录.') where familycode in (
	select DISTINCT familycode 
	from zy_deleteme
	where c = 0 or c is NULL
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对没有合同信息的家庭做标记 



DROP  TABLE IF EXISTS 3_3_mix家庭合同和交租和补贴表;
create table 3_3_mix家庭合同和交租和补贴表 as 
SELECT
3_2_mix家庭合同和交租表.*,
zy_1view_house_rent_bt_v_ratio_smart.RATIO								  			 sub_RATIO ,
zy_1view_house_rent_bt_v_ratio_smart.PAYABLEMONEY                 sub_PAYABLEMONEY,
zy_1view_house_rent_bt_v_ratio_smart.RECEIVABLEMONEY              sub_RECEIVABLEMONEY ,
zy_1view_house_rent_bt_v_ratio_smart.WITHHOLDBANKNUM              sub_WITHHOLDBANKNUM ,
zy_1view_house_rent_bt_v_ratio_smart.WITHHOLDBANK                 sub_WITHHOLDBANK ,
zy_1view_house_rent_bt_v_ratio_smart.RENTALSTATE                  sub_RENTALSTATE ,
zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEBEGIN               sub_MONEYDATEBEGIN ,
zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEEND               	 sub_MONEYDATEEND ,
zy_1view_house_rent_bt_v_ratio_smart.REFCONID                     sub_REFCONID 
FROM 
3_2_mix家庭合同和交租表 
LEFT JOIN zy_1view_house_rent_bt_v_ratio_smart ON 
3_2_mix家庭合同和交租表.condetail_REGISTERNUM = zy_1view_house_rent_bt_v_ratio_smart.registernum 
and 3_2_mix家庭合同和交租表.con_CONID = zy_1view_house_rent_bt_v_ratio_smart.REFCONID
and 3_2_mix家庭合同和交租表.rent_MONEYDATEBEGIN = zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEBEGIN;  
-- and 3_2_mix家庭合同和交租表.rent_MONEYDATEEND = zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEEND; 



-- begin 对档次多次发生过变化的家庭做标记。 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
select familynumber, recordcode, count(DISTINCT(ratio)) DiffRatioNum from zy_biz_family_subsidy 
where 
     zy_biz_family_subsidy.QUALIFICATIONNUMBER='applytype_002' 
 and state ='QUASTATE_001' 
 and zy_biz_family_subsidy.RecordDate > '2015-11-16' -- 2017.2.8 只计算发生在2015-11-16月之后的变更
GROUP BY familynumber
order by DiffRatioNum desc;

update 3_3_mix家庭合同和交租和补贴表 t set t.筛查结果=concat(t.筛查结果,' X4-多次发生过档次变更.') where familycode in (
	select DISTINCT(familynumber) from zy_deleteme where DiffRatioNum > 1
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对档次多次发生过变化的家庭做标记。 


-- /*
-- begin 对区里收入水平不一致的做出标记。 
-- DROP  TABLE IF EXISTS zy_deleteme;

-- 找出市里记录的平均月收入备用
-- create table zy_deleteme as 
-- select familycode, recordcode,FAMILYMONTHAVG 
-- from zy_1base_family_subsidy_smart  
-- where zy_1base_family_subsidy_smart.FAMILYCODE in (select FAMILYCODE from zy_z_temp_mix_family_info);

-- create table deleteme2 as 

-- select familycode, effdate,imcomemonthly 
-- from zy_z_temp_mix_family_info  
-- where zy_1base_family_subsidy_smart.FAMILYCODE in (select FAMILYCODE from zy_z_temp_mix_family_info);
-- GROUP BY familycode 
-- ORDER BY effdate
-- LIMIT 1

-- update 3_3_mix家庭合同和交租和补贴表 t set t.筛查结果=concat(t.筛查结果,' X5-月人均收入不符.') 
-- where familycode in (
-- 	select DISTINCT(familynumber) from zy_deleteme where DiffRatioNum > 1
-- );

-- DROP  TABLE IF EXISTS zy_deleteme;
-- end 对区里收入水平不一致的做出标记。 
-- */


-- begin 对手工处理档次变更过的暂时做屏蔽处理。 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
select familycode,count(DISTINCT DistRatio) c from `3_3_mix家庭合同和交租和补贴表` GROUP BY familycode ORDER BY c desc;

update 3_3_mix家庭合同和交租和补贴表 t set t.筛查结果=concat(t.筛查结果,' X6-暂缓处理手工定档发生过多次档次变更的家庭') where familycode in (
	select familycode from zy_deleteme where c > 1
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对手工处理档次变更过的暂时做屏蔽处理。 



-- begin 对王志雨\李丕元 两个只具备纯区级补贴的家庭做屏蔽处理。 

update 3_3_mix家庭合同和交租和补贴表 t set t.筛查结果=concat(t.筛查结果,' X7-对王志雨和李丕元两个只具备纯区级补贴的家庭做屏蔽处理') 
where cardid in (
	'110108196210193744',-- 王志雨
	'110102197201201112',	-- 李丕元
	'110106194307040013' -- 武天保
);
-- end 对王志雨\李丕元 两个只具备纯区级补贴的家庭做屏蔽处理。。 



-- begin 对被锁定家庭资格的处理 
update 3_3_mix家庭合同和交租和补贴表 t set t.筛查结果=concat(t.筛查结果,' X5-该家庭资格目前正被锁定补贴暂缓处理') where t.condetail_REGISTERNUM in (
	SELECT RECORDCODE from zy_1biz_family_recheck_family_smart  
	where 
	ID in (select REFID from zy_1biz_family_rechecklockinfo_smart where locksate = 'lockstat_001') -- 锁定中状态的
	and ( RECHECKSUBSIDY='applytype_001' or RECHECKSUBSIDY='applytype_002' )
);
-- end 对被锁定家庭资格的处理 


-- 3_4_简单家庭补贴信息已剔除早于资格生效的记录 保存 情况最简单的家庭补贴清单，简单就是精简，即正常交租金、没有多份合同，档次也没变过等等，
DROP 					 TABLE IF EXISTS 3_4_简单家庭补贴信息已剔除早于资格生效的记录;
create table 3_4_简单家庭补贴信息已剔除早于资格生效的记录 as 
select * from 3_3_mix家庭合同和交租和补贴表 
where 筛查结果 =''
					-- and  rent_MONEYDATEBEGIN > DATE_ADD(IF(EffDate>=con_begindate,EffDate,con_begindate),INTERVAL 1 MONTH);
and  rent_MONEYDATEBEGIN >= IF(`ANA_补贴最终生效时间`>=con_begindate,`ANA_补贴最终生效时间`,con_begindate);


-- ------ 计算补贴 --------------------
DROP 					 TABLE IF EXISTS 3_5_简单家庭补贴发放精简信息;
create table 3_5_简单家庭补贴发放精简信息 AS
SELECT
CardID ,
`Name` ,
`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,
IncomeMonthly ,
DistRatio ,
sub_RATIO ,
condetail_BASEMONEY ,
rent_PRACTICALMONEY ,
sub_PAYABLEMONEY ,
rent_MONEYDATEBEGIN ,
rent_MONEYDATEEND ,
EffDate ,
`condetail_项目名称` ,
condetail_HOUSEADDRESS ,
condetail_VALUEADDMONEY ,
condetail_MONTHMONEY ,
condetail_STRUCTUREAREA ,
condetail_REGISTERNUM ,
condetail_WITHHOLDNAME ,
condetail_WITHHOLDNUM
FROM
`3_4_简单家庭补贴信息已剔除早于资格生效的记录`
order by CardID,rent_MONEYDATEBEGIN;

ALTER TABLE `3_5_简单家庭补贴发放精简信息` ADD COLUMN `sub_qu`  varchar(255) NULL   AFTER `rent_PRACTICALMONEY` ;
ALTER TABLE `3_5_简单家庭补贴发放精简信息` ADD COLUMN `diff_sub` varchar(255) NULL  AFTER `sub_PAYABLEMONEY` ;

-- 高光提出另外一种核算方法，档次差额*房租（60平米内的）
ALTER TABLE `3_5_简单家庭补贴发放精简信息` ADD COLUMN `diff_sub_2`  varchar(255) NULL  AFTER `diff_sub` ; -- 高光提出另外一种核算方法，档次差额*房租（60平米内的）
ALTER TABLE `3_5_简单家庭补贴发放精简信息` ADD COLUMN `LZ_info`  varchar(255) NULL  AFTER `diff_sub_2` ; -- 用于查找是否是按照廉租补贴发放的补贴

update `3_5_简单家庭补贴发放精简信息`  
set 
	sub_qu=round((IF(condetail_STRUCTUREAREA>60,60,condetail_STRUCTUREAREA)* condetail_MONTHMONEY * (DistRatio/100.0)),2),
	diff_sub=IF(sub_PAYABLEMONEY is null,0,round(sub_qu - sub_PAYABLEMONEY,2)),
	diff_sub_2= round( 
					IF(sub_RATIO is null ,0,((DistRatio-sub_RATIO)/100.0))  *  -- 比例 
					IF(condetail_STRUCTUREAREA>60,60,condetail_STRUCTUREAREA) * condetail_MONTHMONEY-- 面积
				,2);


-- 判断这个家庭是否收到的补贴是 廉租补贴 或者疑似廉租补贴 （面积 大于 50 平面，市里补贴按照 50*单位租金*比例 发放的，肯定就是廉租补贴）
update `3_5_简单家庭补贴发放精简信息` set LZ_info=NULL;
update `3_5_简单家庭补贴发放精简信息`  
set 
	LZ_info=IF(
							abs(sub_PAYABLEMONEY - condetail_MONTHMONEY * sub_RATIO / 100.0 * IF(condetail_STRUCTUREAREA>=50,50.0,0))
							<= 0.02,'确定是按廉租补贴发放（>50平米）',NULL); 


-- 房屋面积大于 60 平米，并且市里补贴金额是按照最低60平米上限发放的，视为公租补贴发放。
update `3_5_简单家庭补贴发放精简信息`  
set 
	LZ_info=IF(
							abs(sub_PAYABLEMONEY - condetail_MONTHMONEY * sub_RATIO / 100.0 * IF(condetail_STRUCTUREAREA>=60,60.0,0))
							<= 0.02,'确定是按公租补贴发放（>60平米）',NULL)
where LZ_info is null;


-- 房屋面积小于 50 平米，并且该家庭没有廉租房资格记录的，视为具备公租房补贴，视为市里按公租房补贴发放补贴。
update `3_5_简单家庭补贴发放精简信息`  
set 
	LZ_info='确定是按公租补贴发放（无廉租资格）'
where CardID in (SELECT DISTINCT CardID from zy_z_temp_mix_family_info WHERE apply003_code is NULL) and LZ_info is null;


-- 房屋面积小于 50 平米，并且该家庭有廉租房资格记录的，并且没有公租补贴记录的，视为廉租房补贴。
update `3_5_简单家庭补贴发放精简信息`  
set 
	LZ_info='确定是按廉租补贴发放（无公租资格）'
where CardID in (SELECT DISTINCT CardID from zy_z_temp_mix_family_info WHERE apply003_code is NOT NULL  and  apply002_code is  NULL ) and LZ_info is null;

-- 房屋面积小于 50 平米，并且该家庭即有廉租房资格记录的也有公租补贴记录的，视为疑似廉租房补贴。
update `3_5_简单家庭补贴发放精简信息`  
set 
	LZ_info='疑似廉租补贴发放（曾有公租、廉租资格，需进一步细查）'
where CardID in (SELECT DISTINCT CardID from zy_z_temp_mix_family_info WHERE apply003_code is NOT NULL  and  apply002_code is  not NULL ) and LZ_info is null;



DROP TABLE IF EXISTS 3_6_简单家庭补贴发放精简信息_中文;
create table 3_6_简单家庭补贴发放精简信息_中文 AS
SELECT
DISTINCT CardID 身份证,
`Name` 姓名,
`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,
IncomeMonthly 人均月收入,
DistRatio 区级档次,
sub_RATIO 市级档次,
condetail_BASEMONEY 应付租金,
rent_PRACTICALMONEY 实付租金,
sub_qu 区级补贴发放金额,
sub_PAYABLEMONEY 市级补贴发放金额,
diff_sub 市区两级补贴差额,
diff_sub_2 市区档次差乘租金,
LZ_info 补贴情况分析,
rent_MONEYDATEBEGIN 交租期限开始时间,
rent_MONEYDATEEND 交租期限截止时间,
EffDate 区里人工台账收录月份,
`condetail_项目名称` 项目名称,
condetail_HOUSEADDRESS 地址,
condetail_VALUEADDMONEY 家具租金,
condetail_MONTHMONEY 单位面积月租金,
condetail_STRUCTUREAREA 建筑面积,
condetail_REGISTERNUM 资格编号,
condetail_WITHHOLDNAME 开户行,
condetail_WITHHOLDNUM 账号
FROM
`3_5_简单家庭补贴发放精简信息`

GROUP BY CardID,rent_MONEYDATEBEGIN
order by CardID,rent_MONEYDATEBEGIN;

DROP TABLE IF EXISTS 3_7_简单家庭补贴情况异常;
create table 3_7_简单家庭补贴情况异常 AS
select * from 3_6_简单家庭补贴发放精简信息_中文 
where (ABS(市区两级补贴差额-市区档次差乘租金)>0.02);-- and 补贴情况分析 != '确定是按廉租补贴发放（>50平米）'; 



-- select * from 3_6_简单家庭补贴发放精简信息_中文 where  补贴情况分析 = '确定是按廉租补贴发放（>50平米）'; 


-- 4 处理多合同家庭 ----------

-- 对多份合同的家庭进行处理

-- 1. 区分“没换过房子的家庭” 和 “换过房子的家庭”

-- 1.1 找出有多份合同的家庭
DROP TABLE IF EXISTS 4_0_多合同家庭清单;  
create table 4_0_多合同家庭清单 AS
select DISTINCT CardID,Name,`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,familycode  from 3_3_mix家庭合同和交租和补贴表 where 筛查结果='X2复杂-有多份合同';

-- 1.2 取得他们多份合同的具体信息
DROP TABLE IF EXISTS 4_1_多合同家庭合同概要信息;  
create table 4_1_多合同家庭合同概要信息 AS
SELECT
4_0_多合同家庭清单.*,
zy_1biz_later_family_contractinfo_smart.ID,
zy_1biz_later_family_contractinfo_smart.BEGINDATE,
zy_1biz_later_family_contractinfo_smart.ENDDATE,
zy_1biz_later_family_contractinfo_smart.CONTRACTSIGDATE
FROM 
4_0_多合同家庭清单 
LEFT JOIN zy_1biz_later_family_contractinfo_smart ON 
		4_0_多合同家庭清单.familycode 	= zy_1biz_later_family_contractinfo_smart.REFFAMILYNUM;

-- 去掉重复数据
DROP TABLE IF EXISTS 4_2_无重复的多合同家庭合同概要信息;  
create table 4_2_无重复的多合同家庭合同概要信息 AS
SELECT
DISTINCT ID,CardID,Name,familycode,BEGINDATE,ENDDATE,CONTRACTSIGDATE
FROM 
4_1_多合同家庭合同概要信息
ORDER BY CardID;


-- 获得各个合同的具体信息
DROP TABLE IF EXISTS 4_3_多合同具体信息;  
create table 4_3_多合同具体信息 AS
SELECT
4_2_无重复的多合同家庭合同概要信息.*,
zy_1biz_later_family_pub_contract_smart.houseaddress,
zy_1biz_later_family_pub_contract_smart.mothmoney,
zy_1biz_later_family_pub_contract_smart.basemoney,
zy_1biz_later_family_pub_contract_smart.STRUCTUREAREA, 
zy_1biz_later_family_pub_contract_smart.CONTRACTNUM,
zy_1biz_later_family_pub_contract_smart.WITHHOLDNAME,
zy_1biz_later_family_pub_contract_smart.WITHHOLDNUM
FROM 
4_2_无重复的多合同家庭合同概要信息 
LEFT JOIN zy_1biz_later_family_pub_contract_smart ON 
		4_2_无重复的多合同家庭合同概要信息.ID = zy_1biz_later_family_pub_contract_smart.REFCONTRACTID
ORDER BY cardid;


DROP TABLE IF EXISTS 4_4_家庭不同房子套数; 
create table 4_4_家庭不同房子套数 AS
select cardid,Name,count(DISTINCT houseaddress) c from 4_3_多合同具体信息  GROUP BY cardid ORDER BY c desc;

-- c > 1 or c = 0  因为有些房子地址是空的，所以这部分家庭也不靠谱，应该归到 4_5_换过房子的家庭 继续核查
DROP TABLE IF EXISTS 4_5_换过房子的家庭; 
create table 4_5_换过房子的家庭 AS
select * from 4_3_多合同具体信息 where cardid in (select cardid from 4_4_家庭不同房子套数 where c>1 or c=0) ORDER BY cardid; 


-- c = 1
DROP TABLE IF EXISTS 4_6_多合同但地址一样没换过房子的家庭; 
create table 4_6_多合同但地址一样没换过房子的家庭 AS
select * from 4_3_多合同具体信息 where cardid in (select cardid from 4_4_家庭不同房子套数 where c=1) ORDER BY cardid; 





-- --------------------  对 4_5_换过房子的家庭 进行处理，用加 mark 的方式

				ALTER TABLE `4_5_换过房子的家庭`
				ADD COLUMN `mark`  varchar(2000) NULL;

				-- 标识 8户 房屋面积没发生过变化的家庭， 即不是真正换过房子的。

				update 4_5_换过房子的家庭 SET mark = '房屋面积没发生过变化的家庭，不是真正换过房子的'
				where Cardid 
				in 
				(
					select Cardid from 
					(
						select count(DISTINCT STRUCTUREAREA) c ,Cardid
						from 4_5_换过房子的家庭 
						GROUP BY Cardid 
					)  xx 
					where xx.c = 1 
				);

				-- 标识 27 户 补贴新政实施后没换过房子的家庭，（即2015年12月之前换过房子，2015年12月1日新政实施后没换过房子的家庭）。
				update 4_5_换过房子的家庭 SET mark = '补贴新政实施后没换过房子的家庭'
				where Cardid 
				in 
				(
					select Cardid from 
					(
						select max(begindate) c ,Cardid,mark
						from 4_5_换过房子的家庭 
						GROUP BY Cardid 
					)  xx 
						where xx.c < '2015-12' and xx.mark is null
				);

				-- 剩下的 10户 为需手工核查的家庭

				update 4_5_换过房子的家庭 SET mark = '需手工核查的家庭'
				where Cardid 
				in 
				(
					select Cardid from 
					(
						select max(begindate) c ,Cardid,mark
						from 4_5_换过房子的家庭 
						GROUP BY Cardid 
					)  xx 
						where xx.c >= '2015-12' and xx.mark is null
				);
			
-- ------------------  创建所有的 需要用算法再次生成补贴的家庭 （4_5_换过房子的家庭 != '需手工核查的家庭' 和 4_6_多合同但地址一样没换过房子的家庭）

DROP TABLE IF EXISTS 4_7_需要手工计算补贴的多合同家庭;
create table 4_7_需要手工计算补贴的多合同家庭 as 
select  * from 4_5_换过房子的家庭 where mark = '需手工核查的家庭' ;

SELECT DISTINCT cardid,name from 4_7_需要手工计算补贴的多合同家庭;


DROP TABLE IF EXISTS 4_8_多合同系统算补贴家庭id清单; 
create table 4_8_多合同系统算补贴家庭id清单 as
(SELECT DISTINCT cardid from 4_5_换过房子的家庭 where mark != '需手工核查的家庭')
union  
(SELECT DISTINCT cardid from 4_6_多合同但地址一样没换过房子的家庭 );




-- 以上已经获得了 多合同里情况比较简单的（没真正换过房子的家庭）的 cardid，下面就要建立这些家庭的 family_info 表，按照 家庭-交租-补贴-合同的顺序来关联他们。

DROP TABLE IF EXISTS 4_9_需要系统算的多合同家庭基本信息; 
create table 4_9_需要系统算的多合同家庭基本信息 as 
SELECT DISTINCT CardID,name,`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,IncomeMonthly,type,DistRatio,CityRatio,EffDate,RecDate,valid,familycode,remark 
from zy_z_temp_mix_family_info 
where CardID in (SELECT DISTINCT CardID from 4_8_多合同系统算补贴家庭id清单 ) ;

-- !!! 4_9_需要系统算的多合同家庭基本信息 里有 重复的记录，6户人家档次没变，但是收入变更过。

DROP TABLE IF EXISTS 4_a_需要系统算的多合同家庭和租金信息; 
create table 4_a_需要系统算的多合同家庭和租金信息 as 
SELECT
4_9_需要系统算的多合同家庭基本信息.*,
zy_1view_house_rent_smart.ZJYEARMONTH 					rent_ZJYEARMONTH ,
zy_1view_house_rent_smart.RENTALDATE                   rent_RENTALDATE ,
zy_1view_house_rent_smart.PAYABLEMONEY                 rent_PAYABLEMONEY ,
zy_1view_house_rent_smart.RECEIVABLEMONEY              rent_RECEIVABLEMONEY ,
zy_1view_house_rent_smart.PRACTICALMONEY               rent_PRACTICALMONEY ,
zy_1view_house_rent_smart.RECEIVEDDATE                 rent_RECEIVEDDATE ,
zy_1view_house_rent_smart.WITHHOLDBANK                 rent_WITHHOLDBANK ,
zy_1view_house_rent_smart.WITHHOLDBANKNUM              rent_WITHHOLDBANKNUM ,
zy_1view_house_rent_smart.RENTALSTATE                  rent_RENTALSTATE ,
zy_1view_house_rent_smart.MONEYDATEBEGIN               rent_MONEYDATEBEGIN ,
zy_1view_house_rent_smart.MONEYDATEEND                 rent_MONEYDATEEND ,
zy_1view_house_rent_smart.ITEMNAME                     rent_ITEMNAME ,
zy_1view_house_rent_smart.TENANTNAME                   rent_TENANTNAME ,
zy_1view_house_rent_smart.TENANTCERTIFICATENUM         rent_TENANTCERTIFICATENUM ,
zy_1view_house_rent_smart.REFFAMILYNUM                 rent_REFFAMILYNUM ,
zy_1view_house_rent_smart.REFCONID                     rent_REFCONID
FROM 
4_9_需要系统算的多合同家庭基本信息 
LEFT JOIN zy_1view_house_rent_smart ON 
		4_9_需要系统算的多合同家庭基本信息.familycode 	= zy_1view_house_rent_smart.REFFAMILYNUM ; 


			/* 因为 130404195212103036	张炳熙 同一个 id 有两个 familycode， 所以 用下面的sql 可知，只有张丙熙的记录有问题，其他家庭都正常
			select cardid,name,count(*) c from 4_a_需要系统算的多合同家庭和租金信息 GROUP BY cardid ORDER BY c desc
			*/

DROP TABLE IF EXISTS 4_b_需要系统算的多合同家庭和租金和补贴信息; 
create table 4_b_需要系统算的多合同家庭和租金和补贴信息 as 
SELECT
4_a_需要系统算的多合同家庭和租金信息.*,
zy_1view_house_rent_bt_v_ratio_smart.RATIO								  			 sub_RATIO ,
zy_1view_house_rent_bt_v_ratio_smart.PAYABLEMONEY                 sub_PAYABLEMONEY,
zy_1view_house_rent_bt_v_ratio_smart.RECEIVABLEMONEY              sub_RECEIVABLEMONEY ,
zy_1view_house_rent_bt_v_ratio_smart.WITHHOLDBANKNUM              sub_WITHHOLDBANKNUM ,
zy_1view_house_rent_bt_v_ratio_smart.WITHHOLDBANK                 sub_WITHHOLDBANK ,
zy_1view_house_rent_bt_v_ratio_smart.RENTALSTATE                  sub_RENTALSTATE ,
zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEBEGIN               sub_MONEYDATEBEGIN ,
zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEEND               	 sub_MONEYDATEEND ,
zy_1view_house_rent_bt_v_ratio_smart.REFCONID                     sub_REFCONID 
FROM 
4_a_需要系统算的多合同家庭和租金信息
LEFT JOIN zy_1view_house_rent_bt_v_ratio_smart 
ON ( 
4_a_需要系统算的多合同家庭和租金信息.familycode = zy_1view_house_rent_bt_v_ratio_smart.REFFAMILYNUM 
and 4_a_需要系统算的多合同家庭和租金信息.rent_REFFAMILYNUM = zy_1view_house_rent_bt_v_ratio_smart.REFFAMILYNUM 
and 4_a_需要系统算的多合同家庭和租金信息.rent_REFCONID = zy_1view_house_rent_bt_v_ratio_smart.REFCONID 
and 4_a_需要系统算的多合同家庭和租金信息.rent_MONEYDATEBEGIN = zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEBEGIN);  
-- and 4_a_需要系统算的多合同家庭和租金信息.rent_MONEYDATEEND = zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEEND; 



DROP TABLE IF EXISTS 4_c_需要系统算的多合同家庭和租金和补贴和合同概要信息; 
create table 4_c_需要系统算的多合同家庭和租金和补贴和合同概要信息 as 
SELECT
4_b_需要系统算的多合同家庭和租金和补贴信息.*,
zy_1biz_later_family_contractinfo_smart.BEGINDATE con_BEGINDATE,
zy_1biz_later_family_contractinfo_smart.ENDDATE con_ENDDATE,
zy_1biz_later_family_contractinfo_smart.CONTRACTTYPE con_CONTRACTTYPE,
zy_1biz_later_family_contractinfo_smart.CONTRACTSTATE con_CONTRACTSTATE,
zy_1biz_later_family_contractinfo_smart.TENANTNAME con_TENANTNAME,
zy_1biz_later_family_contractinfo_smart.id con_CONID 
FROM
4_b_需要系统算的多合同家庭和租金和补贴信息
LEFT OUTER JOIN zy_1biz_later_family_contractinfo_smart on 4_b_需要系统算的多合同家庭和租金和补贴信息.rent_REFCONID = zy_1biz_later_family_contractinfo_smart.ID
;



DROP TABLE IF EXISTS 4_d_需要系统算的多合同家庭和租金和补贴和合同详细信息; 
create table 4_d_需要系统算的多合同家庭和租金和补贴和合同详细信息 as 
SELECT
4_c_需要系统算的多合同家庭和租金和补贴和合同概要信息.*,
zy_1biz_later_family_pub_contract_smart.ITEMNAME condetail_项目名称,
zy_1biz_later_family_pub_contract_smart.CONTRACTNUM condetail_CONTRACTNUM,
zy_1biz_later_family_pub_contract_smart.HOUSEADDRESS condetail_HOUSEADDRESS,
zy_1biz_later_family_pub_contract_smart.BASEMONEY condetail_BASEMONEY,
zy_1biz_later_family_pub_contract_smart.STRUCTUREAREA condetail_STRUCTUREAREA,
zy_1biz_later_family_pub_contract_smart.MOTHMONEY condetail_MONTHMONEY,
zy_1biz_later_family_pub_contract_smart.VALUEADDMONEY condetail_VALUEADDMONEY,
zy_1biz_later_family_pub_contract_smart.MONTHWITHHOLDMONEY condetail_MONTHWITHHOLDMONEY,
zy_1biz_later_family_pub_contract_smart.WITHHOLDNAME condetail_WITHHOLDNAME,
zy_1biz_later_family_pub_contract_smart.WITHHOLDNUM condetail_WITHHOLDNUM,
zy_1biz_later_family_pub_contract_smart.REGISTERNUM condetail_REGISTERNUM,
zy_1biz_later_family_pub_contract_smart.RENTALWITHHOLDDATE condetail_RENTALWITHHOLDDATE
FROM 
4_c_需要系统算的多合同家庭和租金和补贴和合同概要信息, zy_1biz_later_family_pub_contract_smart where  4_c_需要系统算的多合同家庭和租金和补贴和合同概要信息.con_CONID = zy_1biz_later_family_pub_contract_smart.REFCONTRACTID; 


 -- 去掉重复记录
DROP TABLE IF EXISTS 4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息; 
create table 4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息 as 
SELECT 
DISTINCT CardID,
name,
`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,
IncomeMonthly,
type,
DistRatio,
CityRatio,
EffDate,
RecDate,
valid,
familycode,
remark,
rent_ZJYEARMONTH,
rent_RENTALDATE,
rent_PAYABLEMONEY,
rent_RECEIVABLEMONEY,
rent_PRACTICALMONEY,
rent_RECEIVEDDATE,
rent_WITHHOLDBANK,
rent_WITHHOLDBANKNUM,
rent_RENTALSTATE,
rent_MONEYDATEBEGIN,
rent_MONEYDATEEND,
rent_ITEMNAME,
rent_TENANTNAME,
rent_TENANTCERTIFICATENUM,
rent_REFFAMILYNUM,
rent_REFCONID,
sub_RATIO,
sub_PAYABLEMONEY,
sub_RECEIVABLEMONEY,
sub_WITHHOLDBANKNUM,
sub_WITHHOLDBANK,
sub_RENTALSTATE,
sub_MONEYDATEBEGIN,
sub_MONEYDATEEND,
sub_REFCONID,
con_BEGINDATE,
con_ENDDATE,
con_CONTRACTTYPE,
con_CONTRACTSTATE,
con_TENANTNAME,
con_CONID,
condetail_项目名称,
condetail_CONTRACTNUM,
condetail_HOUSEADDRESS,
condetail_BASEMONEY,
condetail_STRUCTUREAREA,
condetail_MONTHMONEY,
condetail_VALUEADDMONEY,
condetail_MONTHWITHHOLDMONEY,
condetail_WITHHOLDNAME,
condetail_WITHHOLDNUM,
condetail_REGISTERNUM,
condetail_RENTALWITHHOLDDATE
from 4_d_需要系统算的多合同家庭和租金和补贴和合同详细信息;


ALTER TABLE `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息` ADD COLUMN `筛查结果`  varchar(255) NULL  AFTER `IncomeMonthly` ; -- 用于查找是否是按照廉租补贴发放的补贴


-- 判断这个家庭是否收到的补贴是 廉租补贴 或者疑似廉租补贴 （面积 大于 50 平面，市里补贴按照 50*单位租金*比例 发放的，肯定就是廉租补贴）
update `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息` set 筛查结果=NULL;
update `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息`  
set 
	筛查结果=IF(
							abs(sub_PAYABLEMONEY - condetail_MONTHMONEY * sub_RATIO / 100.0 * IF(condetail_STRUCTUREAREA>=50,50.0,0))
							<= 0.02,'确定是按廉租补贴发放（>50平米）',NULL); 


-- 房屋面积大于 60 平米，并且市里补贴金额是按照最低60平米上限发放的，视为公租补贴发放。
update `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息`  
set 
	筛查结果=IF(
							abs(sub_PAYABLEMONEY - condetail_MONTHMONEY * sub_RATIO / 100.0 * IF(condetail_STRUCTUREAREA>=60,60.0,0))
							<= 0.02,'确定是按公租补贴发放（>60平米）',NULL)
where 筛查结果 is null;


-- 房屋面积小于 50 平米，并且该家庭没有廉租房资格记录的，视为具备公租房补贴，视为市里按公租房补贴发放补贴。
update `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息`  
set 
	筛查结果='确定是按公租补贴发放（无廉租资格）'
where CardID in (SELECT DISTINCT CardID from zy_z_temp_mix_family_info WHERE apply003_code is NULL) and 筛查结果 is null;


-- 房屋面积小于 50 平米，并且该家庭有廉租房资格记录的，并且没有公租补贴记录的，视为廉租房补贴。
update `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息`  
set 
	筛查结果='确定是按廉租补贴发放（无公租资格）'
where CardID in (SELECT DISTINCT CardID from zy_z_temp_mix_family_info WHERE apply003_code is NOT NULL  and  apply002_code is  NULL ) and 筛查结果 is null;

-- 房屋面积小于 50 平米，并且该家庭即有廉租房资格记录的也有公租补贴记录的，视为疑似廉租房补贴。
update `4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息`  
set 
	筛查结果='疑似廉租补贴发放（曾有公租、廉租资格，需进一步细查）'
where CardID in (SELECT DISTINCT CardID from zy_z_temp_mix_family_info WHERE apply003_code is NOT NULL  and  apply002_code is  not NULL ) and 筛查结果 is null;


DROP  TABLE IF EXISTS 4_f_多合同补贴中已剔除早于资格生效的补贴信息;
create table 4_f_多合同补贴中已剔除早于资格生效的补贴信息 AS
select * from 4_e_需要系统算的多合同家庭和租金和补贴和合同详细且无重复的信息 t 
where 
-- rent_MONEYDATEBEGIN > DATE_ADD(IF(EffDate>=con_begindate,EffDate,con_begindate),INTERVAL 1 MONTH)
rent_MONEYDATEBEGIN >= IF(`ANA_补贴最终生效时间`>=con_begindate,`ANA_补贴最终生效时间`,con_begindate) 
order by cardid,rent_moneydatebegin;



-- ------ 计算补贴 --------------------
DROP 					 TABLE IF EXISTS 4_g_需要系统算的多合同家庭补贴报告;
create table 4_g_需要系统算的多合同家庭补贴报告 AS
SELECT
CardID ,
`Name` ,
`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,
IncomeMonthly ,
DistRatio ,
sub_RATIO ,
condetail_BASEMONEY ,
rent_PRACTICALMONEY ,
sub_PAYABLEMONEY ,
rent_MONEYDATEBEGIN ,
rent_MONEYDATEEND ,
EffDate ,
`筛查结果`,
`condetail_项目名称` ,
condetail_HOUSEADDRESS ,
condetail_VALUEADDMONEY ,
condetail_MONTHMONEY ,
condetail_STRUCTUREAREA ,
condetail_REGISTERNUM ,
condetail_WITHHOLDNAME ,
condetail_WITHHOLDNUM 
FROM
`4_f_多合同补贴中已剔除早于资格生效的补贴信息`
order by CardID,rent_MONEYDATEBEGIN;

ALTER TABLE `4_g_需要系统算的多合同家庭补贴报告` ADD COLUMN `sub_qu` varchar(255) NULL   AFTER `rent_PRACTICALMONEY` ;
ALTER TABLE `4_g_需要系统算的多合同家庭补贴报告` ADD COLUMN `diff_sub` varchar(255) NULL  AFTER `sub_PAYABLEMONEY` ;

-- 高光提出另外一种核算方法，档次差额*房租（60平米内的）
ALTER TABLE `4_g_需要系统算的多合同家庭补贴报告` ADD COLUMN `diff_sub_2`  varchar(255) NULL  AFTER `diff_sub` ; -- 高光提出另外一种核算方法，档次差额*房租（60平米内的）


update `4_g_需要系统算的多合同家庭补贴报告`  
set 
	sub_qu=round((IF(condetail_STRUCTUREAREA>60,60,condetail_STRUCTUREAREA)* condetail_MONTHMONEY * (DistRatio/100.0)),2),
	diff_sub=IF(sub_PAYABLEMONEY is null,0,round(sub_qu - sub_PAYABLEMONEY,2)),
	diff_sub_2= round( 
					IF(sub_RATIO is null ,0,((DistRatio-sub_RATIO)/100.0))  *  -- 比例 
					IF(condetail_STRUCTUREAREA>60,60,condetail_STRUCTUREAREA) * condetail_MONTHMONEY-- 面积
				,2);





DROP TABLE IF EXISTS 4_g_需要系统算的多合同家庭补贴报告_中文;
create table 4_g_需要系统算的多合同家庭补贴报告_中文 AS
SELECT
DISTINCT `4_g_需要系统算的多合同家庭补贴报告`.CardID 身份证,
`4_g_需要系统算的多合同家庭补贴报告`.`Name` 姓名,
`ANA` ,
`ANA_所属分类` ,
`ANA_处理方式` ,
`ANA_时间图` ,
`ANA_新增或变更` ,
`ANA_GB收件时间` ,
`ANA_GB备案时间` ,
`ANA_GB变更备案时间` ,
`ANA_补贴最终生效时间` ,
`ANA_GB终止时间` ,
`4_g_需要系统算的多合同家庭补贴报告`.IncomeMonthly 人均月收入,
`4_g_需要系统算的多合同家庭补贴报告`.DistRatio 区级档次,
`4_g_需要系统算的多合同家庭补贴报告`.sub_RATIO 市级档次,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_BASEMONEY 应付租金,
`4_g_需要系统算的多合同家庭补贴报告`.rent_PRACTICALMONEY 实付租金,
`4_g_需要系统算的多合同家庭补贴报告`.sub_qu 区级补贴发放金额,
`4_g_需要系统算的多合同家庭补贴报告`.sub_PAYABLEMONEY 市级补贴发放金额,
`4_g_需要系统算的多合同家庭补贴报告`.diff_sub 市区两级补贴差额,
`4_g_需要系统算的多合同家庭补贴报告`.diff_sub_2 市区档次差乘租金,
`4_g_需要系统算的多合同家庭补贴报告`.`筛查结果` 补贴情况分析,
`4_g_需要系统算的多合同家庭补贴报告`.rent_MONEYDATEBEGIN 交租期限开始时间,
`4_g_需要系统算的多合同家庭补贴报告`.rent_MONEYDATEEND 交租期限截止时间,
`4_g_需要系统算的多合同家庭补贴报告`.EffDate 区里人工录入月份,
`4_g_需要系统算的多合同家庭补贴报告`.`condetail_项目名称` 项目名称,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_HOUSEADDRESS 地址,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_VALUEADDMONEY 家具租金,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_MONTHMONEY 单位面积月租金,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_STRUCTUREAREA 建筑面积,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_REGISTERNUM 资格编号,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_WITHHOLDNAME 开户行,
`4_g_需要系统算的多合同家庭补贴报告`.condetail_WITHHOLDNUM 账号
FROM
`4_g_需要系统算的多合同家庭补贴报告`
GROUP BY CardID,rent_MONEYDATEBEGIN
order by CardID,rent_MONEYDATEBEGIN;


DROP TABLE IF EXISTS 4_h_需要系统算的多合同家庭异常情况;
create table 4_h_需要系统算的多合同家庭异常情况 AS
select * from 4_g_需要系统算的多合同家庭补贴报告_中文 
where ABS(市区两级补贴差额 - 市区档次差乘租金) > 0.02;  -- and 补贴情况分析 != '确定是按廉租补贴发放（>50平米）'; 


-- 5 最后检查“起始”和“终止”情况 ---------------------

select count(*) from 3_6_简单家庭补贴发放精简信息_中文  ;
-- 11012
select count(*) from 4_g_需要系统算的多合同家庭补贴报告_中文  ;
-- 1802



SELECT * from 3_6_简单家庭补贴发放精简信息_中文 where  补贴情况分析 like '%确定是按廉租补贴发放%' ORDER BY 补贴情况分析;
SELECT * from 4_g_需要系统算的多合同家庭补贴报告_中文 where   补贴情况分析 like '%确定是按廉租补贴发放%' ORDER BY 补贴情况分析;
select * from  zy_z_temp_mix_family_info where  remark is not null or valid=0;


-- 市区两级资格被取消的：
-- 110105196812258112	AJBJZFBZ5272503 张春光	否	16.5	市级95%区级95%	申请人已故16.11资格取消
-- 110108196002114714  AJBJZFBZ5393798	贾卫兵	否	16.3	市级95%区级95%	16.11自愿终止


select * from  zy_base_family_subsidy where familycode in ('AJBJZFBZ5272503','AJBJZFBZ5393798') and qualificationcode='applytype_002';


-- 找出所有已经取消的 GB资格的家庭
-- 所有的（含自动处理和手工处理的）有公租资格取消记录的家庭
DROP  TABLE IF EXISTS 5_0_有取消GB资格记录的家庭;
create table 5_0_有取消GB资格记录的家庭 as
select * from  zy_base_family_subsidy where familycode in (select familycode from zy_z_temp_mix_family_info ) 
and qualificationcode='applytype_002' and  state='QUASTATE_010'  ;-- and TERMINATEDATE < '2015-12';


DROP  TABLE IF EXISTS 5_1_系统生成名单里取消GB资格记录的家庭详细信息;
create table 5_1_系统生成名单里取消GB资格记录的家庭详细信息 as
					-- 自动处理中，简单家庭 有公租资格取消记录的家庭
select FAMILYCODE,RECORDCODE,RECORDDATE,TERMINATEDATE,TERMINATEREASON,ZZDX,SUBSIDYLOCKSTATE,SUBSIDYLOCKDATE from zy_base_family_subsidy 
where 
		FAMILYCODE in 
							(select DISTINCT FAMILYCODE from 3_4_简单家庭补贴信息已剔除早于资格生效的记录 
								where familycode in 
																(select FAMILYCODE from 5_0_有取消GB资格记录的家庭)
							) 
		and qualificationcode='applytype_002' -- and STATE='QUASTATE_010'

union 
					-- 自动处理中，多合同家庭 有公租资格取消记录的家庭
select  FAMILYCODE,RECORDCODE,RECORDDATE,TERMINATEDATE,TERMINATEREASON,ZZDX,SUBSIDYLOCKSTATE,SUBSIDYLOCKDATE  from zy_base_family_subsidy 
where 
		FAMILYCODE in 
							(select DISTINCT FAMILYCODE from 4_9_需要系统算的多合同家庭基本信息 
								where familycode in 
																(select FAMILYCODE from 5_0_有取消GB资格记录的家庭)
							)
		and qualificationcode='applytype_002'; -- and STATE='QUASTATE_010';




ALTER TABLE `5_1_系统生成名单里取消GB资格记录的家庭详细信息` ADD COLUMN `终止原因`  varchar(100) NULL;
ALTER TABLE `5_1_系统生成名单里取消GB资格记录的家庭详细信息` ADD COLUMN `Name`  varchar(100) NULL;
ALTER TABLE `5_1_系统生成名单里取消GB资格记录的家庭详细信息` ADD COLUMN `CardId`  varchar(100) NULL;
ALTER TABLE `5_1_系统生成名单里取消GB资格记录的家庭详细信息` ADD COLUMN `发补贴起始月份`  varchar(100) NULL;
ALTER TABLE `5_1_系统生成名单里取消GB资格记录的家庭详细信息` ADD COLUMN `最后一次发补贴月份`  varchar(100) NULL;

update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `终止原因`=(select b.dictname from zy_eos_dict_entry b where b.dictid= a.TERMINATEREASON);
update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `Name`=(select name from zy_z_temp_mix_family_info b where b.familycode = a.FAMILYCODE);
update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `Cardid`=(select CardID from zy_z_temp_mix_family_info b where b.familycode = a.FAMILYCODE);

update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `发补贴起始月份`=NULL;
update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `最后一次发补贴月份`=NULL;

update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `发补贴起始月份`=(select MIN(rent_moneydatebegin) from 3_4_简单家庭补贴信息已剔除早于资格生效的记录 b where b.familycode = a.FAMILYCODE and b.sub_PAYABLEMONEY>0 GROUP BY familycode )
where cardid in (select DISTINCT cardid from 3_4_简单家庭补贴信息已剔除早于资格生效的记录);

update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `最后一次发补贴月份`=(select max(rent_moneydatebegin) from 3_4_简单家庭补贴信息已剔除早于资格生效的记录 b where b.familycode = a.FAMILYCODE and b.sub_PAYABLEMONEY>0 GROUP BY familycode )
where cardid in (select DISTINCT cardid from 3_4_简单家庭补贴信息已剔除早于资格生效的记录);

update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `发补贴起始月份`=(select MIN(rent_moneydatebegin) from 4_f_多合同补贴中已剔除早于资格生效的补贴信息 b where b.familycode = a.FAMILYCODE and b.sub_PAYABLEMONEY>0 GROUP BY familycode )
where cardid in (select DISTINCT cardid from 4_f_多合同补贴中已剔除早于资格生效的补贴信息);

update 5_1_系统生成名单里取消GB资格记录的家庭详细信息 a set `最后一次发补贴月份`=(select max(rent_moneydatebegin) from 4_f_多合同补贴中已剔除早于资格生效的补贴信息 b where b.familycode = a.FAMILYCODE and b.sub_PAYABLEMONEY>0 GROUP BY familycode )
where cardid in (select DISTINCT cardid from 4_f_多合同补贴中已剔除早于资格生效的补贴信息);



-- 查询带有终止记录的情况
select Name,cardid,FAMILYCODE,Recordcode,TERMINATEDATE,`发补贴起始月份`,`最后一次发补贴月份`,`终止原因`,ZZDX,SUBSIDYLOCKSTATE,SUBSIDYLOCKDATE 
from 5_1_系统生成名单里取消GB资格记录的家庭详细信息 
ORDER BY FAMILYCODE,RECORDCODE,TERMINATEDATE;

-- 需仔细验证的GB终止家庭
DROP  TABLE IF EXISTS 5_2_需仔细验证的GB终止家庭;
create table 5_2_需仔细验证的GB终止家庭 as
select Name,cardid,FAMILYCODE,Recordcode,TERMINATEDATE,`发补贴起始月份`,`最后一次发补贴月份`,`终止原因`,ZZDX,SUBSIDYLOCKSTATE,SUBSIDYLOCKDATE 
from 5_1_系统生成名单里取消GB资格记录的家庭详细信息 
where CardId in (select cardid from 5_1_系统生成名单里取消GB资格记录的家庭详细信息 where  TERMINATEDATE is null or ( TERMINATEDATE > `发补贴起始月份` and TERMINATEDATE < `最后一次发补贴月份`));



-- 生成最终报告 ---------------------------------
DROP  TABLE IF EXISTS 6_0_汇报_all;
create table 6_0_汇报_all
select '多合同' `标志` ,4_g_需要系统算的多合同家庭补贴报告_中文.* from 4_g_需要系统算的多合同家庭补贴报告_中文 
-- where 身份证 in (select cardid from 5_1_系统生成名单里取消GB资格记录的家庭详细信息)
UNION 
select '单合同' `标志` ,3_6_简单家庭补贴发放精简信息_中文.* from  3_6_简单家庭补贴发放精简信息_中文;
-- where 身份证 in (select cardid from 5_1_系统生成名单里取消GB资格记录的家庭详细信息);

-- 去掉市级没发补贴的记录。
delete  from 6_0_汇报_all where 市级补贴发放金额 is null;


-- 处理异常情况： 
-- 1. 修改 张虹霞 为 崔燕
update 6_0_汇报_all SET 姓名='崔燕' where 身份证='110108196403111848';

-- 2. 修改 王秀芳 为 张秀芳
update 6_0_汇报_all SET 姓名='张秀芳' where 身份证='110108196404272280';	

-- 3. 110108197408201820	丁静 是 2016年4月由廉租变为公租的，之前mix_family_info 表里错写成了 2月 注意数据。
delete from 6_0_汇报_all where 身份证='110108197408201820' and 交租期限开始时间='2016-3-5';
update  6_0_汇报_all SET `区里人工录入月份`='2016-4-1' where 身份证='110108197408201820';

-- 4. 110109197010082522	周生苓	2016.5月由廉租转为公租，6月缴纳的那笔钱为补发，见雪南发的文件。
			-- 110103196104030640	徐春兰 这两个人的两笔补贴需要高光手工核实一下：
DROP  TABLE IF EXISTS 6_1_汇报_需手工处理的两笔补贴;
create table 6_1_汇报_需手工处理的两笔补贴 as
select * from 6_0_汇报_all 
where 
		( 身份证='110109197010082522'  and  交租期限开始时间='2016-6-15') 
	OR ( 身份证='110103196104030640'  and  交租期限开始时间='2016-5-20') ;

-- 从最终确认列表中删除这两条记录
delete from 6_0_汇报_all where 
		( 身份证='110109197010082522'  and  交租期限开始时间='2016-6-15') 
	OR ( 身份证='110103196104030640'  and  交租期限开始时间='2016-5-20') ;


-- 对 6_0_汇报_all 去掉“补贴情况分析”的字段
alter table 6_0_汇报_all drop column 补贴情况分析;   



-- 验证是否市区两级补贴差额 不一致。
select * from 6_0_汇报_all where ABS(市区两级补贴差额-市区档次差乘租金)> 0.02; 


--  1 个家庭 (110102196212163313	何连增) 区级档次比市级档次低，应该核查。
select * from 6_0_汇报_all where 市区两级补贴差额<-0.01;

DROP  TABLE IF EXISTS 6_2_汇报_区里补贴档次低于市级的1户家庭;
create table 6_2_汇报_区里补贴档次低于市级的1户家庭 AS
select * from 6_0_汇报_all where 市区两级补贴差额<-0.01;
delete from 6_0_汇报_all where 市区两级补贴差额<-0.01;
select * from 6_0_汇报_all where 市区两级补贴差额=-0.01;
select DISTINCT 身份证,姓名,区级档次,市级档次,区里人工录入月份 from 6_2_汇报_区里补贴档次低于市级的1户家庭 where 市区两级补贴差额<-0.01;



-- 统计 6_0_汇报_all
select DISTINCT 身份证 from 6_0_汇报_all;  	-- 1315个家庭
select count(*) from 6_0_汇报_all;					-- 11265笔补贴
select SUM(市区两级补贴差额) from 6_0_汇报_all;					-- 3961343.00 元补贴



select DISTINCT cardid from 3_3_mix家庭合同和交租和补贴表;  -- 2549户
select DISTINCT 身份证 from 6_0_汇报_all;  	-- 1315个家庭
select DISTINCT 身份证 from 6_2_汇报_区里补贴档次低于市级的1户家庭;  	-- 0个家庭
-- 5户锁定
-- 354户未租到房子，即只有资格没有房子，更谈不上补贴。	
--  705户租到了房子，但是从来没有缴过租金的家庭，目前无需计算补贴。
-- 42户需要手工计算
-- 128户

DROP  TABLE IF EXISTS 6_3_汇报_未出现在补贴名单中的交租家庭;
create table 6_3_汇报_未出现在补贴名单中的交租家庭 AS
select DISTINCT cardid,name  from 3_3_mix家庭合同和交租和补贴表 
where 筛查结果 ='' and cardid not in (select DISTINCT 身份证 from 6_0_汇报_all)
union
select cardid,name from 4_9_需要系统算的多合同家庭基本信息
where CardID not in (select DISTINCT 身份证 from 6_0_汇报_all);


select count(*) from 6_3_汇报_未出现在补贴名单中的交租家庭;



--  整理  2015-11月递交申请的人，升级为 2015-12-1 .
update `6_0_汇报_all` set `ANA_补贴最终生效时间` = '2015-12-1' 
where `ANA_补贴最终生效时间`< '2015-12-1' and  `ANA_补贴最终生效时间`>='2015-11-1';

ALTER TABLE `6_0_汇报_all` ADD COLUMN `家庭编号`  varchar(100) NULL;
update `6_0_汇报_all` t set `家庭编号`= (select DISTINCT familycode from zy_z_temp_mix_family_info where t.`身份证`=cardid);


-- 各种验证：
-- 验证1： ANA_补贴最终生效时间 < 2015-12-1
		SELECT * from `6_0_汇报_all` where `ANA_补贴最终生效时间`< '2015-12-1'; 
-- 验证2： ANA_补贴最终生效时间 为 NULL  -- 25 户 没有通过算法找到 ANA_补贴最终生效时间
		SELECT '没有通过算法找到补贴最终生效时间',t.*  from `6_0_汇报_all` t where `ANA_补贴最终生效时间` is NULL ;
-- 验证3	 ANA_补贴最终生效时间
		SELECT * from `6_0_汇报_all` where `交租期限开始时间` < `ANA_补贴最终生效时间` ;
-- 验证4  补贴发放金额 的两种算法结果 不同的 9户
		SELECT '补贴发放金额 的两种算法结果不同',t.* from `6_0_汇报_all` t where ABS(`市区两级补贴差额`-`市区档次差乘租金`)>0.02 and `区级档次`!=`市级档次` order BY 身份证;
		-- 这部分人是 超出 60 平米，市里按照廉租补贴发放的，所以区里对市里按廉租发放的月份，不予发放。
		-- 需要删除这部分人的补贴
		delete from `6_0_汇报_all` where ABS(50.0*`单位面积月租金`*`市级档次`/100.0 - `市级补贴发放金额`) <= 0.02 and `建筑面积`> 50.01;
-- 验证5  人均月收入与市级档次矛盾的家庭
	-- 个例： 110108196404272280	张秀芳  这个人不用管了，这个人是当初退到街道让街道做变更，以为当月能交上来的，结果没交上来后来忘了删了的
	DELETE from `6_0_汇报_all` where 身份证='110108196404272280';
-- 验证6 区里人工录入月份 与 ANA_补贴最终生效时间 不一致的
	SELECT DISTINCT '算法生效时间->人工录入', `身份证`,`姓名`,`ANA_新增或变更`,`ANA_GB收件时间`,`ANA_GB变更备案时间`,`ANA_补贴最终生效时间`,`区里人工录入月份`  from `6_0_汇报_all` where EXTRACT(YEAR_MONTH FROM `ANA_补贴最终生效时间`) < EXTRACT(YEAR_MONTH FROM `区里人工录入月份`) ORDER BY `ANA_新增或变更` DESC;
	
	SELECT DISTINCT '人工录入->算法生效时间', `身份证`,`姓名`,`ANA_新增或变更`,`ANA_GB收件时间`,`ANA_GB变更备案时间`,`ANA_补贴最终生效时间`,`区里人工录入月份`  from `6_0_汇报_all` where EXTRACT(YEAR_MONTH FROM `ANA_补贴最终生效时间`) > EXTRACT(YEAR_MONTH FROM `区里人工录入月份`) ORDER BY `ANA_新增或变更` DESC;
	

-- 验证7 检验两种算法的金额是否有差异
	SELECT * from 6_0_汇报_all where ABS(`市区两级补贴差额`-`市区档次差乘租金`) > 0.02; 
				 -- 检验 是否有 < 0  的情况
	-- 消除因四舍五入造成的 -0.01元的情况
	SELECT * from 6_0_汇报_all where `市区两级补贴差额` < 0 or `市区档次差乘租金`  < 0  ORDER BY `市区两级补贴差额`;
	update 6_0_汇报_all set `市区两级补贴差额` = 0 where `市区两级补贴差额`= -0.01;
	
-- 验证8 检验一个家庭编号对应两个身份证的
	select * from `6_0_汇报_all` where `家庭编号` in (
		select DISTINCT `家庭编号` from (
		select count(DISTINCT `身份证`) c, `家庭编号` from 6_0_汇报_all GROUP BY  `家庭编号` ORDER BY c desc
		) t where  t.c > 1
	) ORDER BY `家庭编号`,`身份证`;


-- 验证9 检验GB资格被终止的家庭
	select * from `6_0_汇报_all` where `ANA_GB终止时间` is not null;
	delete from `6_0_汇报_all` where EXTRACT(YEAR_MONTH FROM `ANA_GB终止时间`) <= EXTRACT(YEAR_MONTH FROM '交租期限开始时间');




-- 总结  
	SELECT '2015年12月公租补贴新政以来同时具备市区两级公租补资格家庭总数目',count(DISTINCT FAMILYCODE) from zy_z_temp_mix_family_info;  -- 1404 户	
	-- 2620


-- 找出台账中变更过家庭主申请人的家庭
	select * 
	from zy_z_temp_mix_family_info s
	where familycode in (
		select familycode from (
			select familycode,count(DISTINCT `Name`) c from zy_z_temp_mix_family_info 
			GROUP BY familycode 
			having c > 1
		) t
	) ORDER BY s.familycode,s.effdate;

select * from `6_0_汇报_all` where `身份证` = '432926194712020513' or `身份证` = '431129195102120022' ;
select * from `6_0_汇报_all` where `身份证` = '412722193712282017' or `身份证` = '412722194206162025' ;
	-- select DISTINCT `筛查结果` from 3_3_mix家庭合同和交租和补贴表

	SELECT '发放补贴差额总户数',count(DISTINCT 家庭编号) from `6_0_汇报_all` where `市区两级补贴差额` != 0 ;  -- 1404 户
	select '发放补贴差额总笔数',COUNT(*) from `6_0_汇报_all` where `市区两级补贴差额` != 0 ; -- 12093
	SELECT '发放补贴差额总金额',SUM(`市区两级补贴差额`) from  `6_0_汇报_all`; -- 5029010.57

	
--  生成最终汇报
-- 发补贴的清单
	select `身份证`,`姓名`,`标志`,`ANA_所属分类` '资格情况分类',`ANA_新增或变更` '家庭类型', `ANA_补贴最终生效时间` '符合新政GB资格生效月份',`ANA_GB终止时间` GB终止时间,`人均月收入`,
				`区级档次`,`市级档次`,`应付租金`,`实付租金`,`区级补贴发放金额`,`市级补贴发放金额`,`市区两级补贴差额`,`交租期限开始时间` 补贴月份（缴租月份，即补贴发放的前月）,
				`项目名称`,`地址`,`家具租金`,`单位面积月租金`,`建筑面积`,`资格编号`,`家庭编号`,`开户行`,`账号`
	from `6_0_汇报_all` where `市区两级补贴差额` != 0 
	ORDER BY `交租期限开始时间`,`身份证`;

-- 不发补贴的清单
	select DISTINCT  `name` 姓名, Cardid '身份证',familycode '系统家庭编号',`ANA_新增或变更` '家庭类型',`筛查结果` '被排除原因'
	from  3_3_mix家庭合同和交租和补贴表 
	where familycode not in (select DISTINCT `家庭编号` from 6_0_汇报_all )
	ORDER BY `筛查结果`,familycode,Cardid;  -- 1218	

-- 为了便于业务部门人工核验，改变 排序方式：
	select `身份证`,`姓名`,`标志`,`ANA_所属分类`,`ANA_时间图`,`ANA_新增或变更` '家庭类型', `ANA_补贴最终生效时间` '符合新政GB资格生效月份',`ANA_GB终止时间` GB终止时间,`人均月收入`,
				`区级档次`,`市级档次`,`应付租金`,`实付租金`,`区级补贴发放金额`,`市级补贴发放金额`,`市区两级补贴差额`,`交租期限开始时间` 补贴月份（缴租月份，即补贴发放的前月）,
				`项目名称`,`地址`,`家具租金`,`单位面积月租金`,`建筑面积`,`资格编号`,`家庭编号`,`开户行`,`账号`
	from `6_0_汇报_all` where `市区两级补贴差额` != 0 
	and 1 = 0
	ORDER BY `标志`,`ANA_所属分类`,`身份证`,`交租期限开始时间`;


select count(DISTINCT `家庭编号`) from `6_0_汇报_all` where `市区两级补贴差额` != 0 ;

select `标志` 合同情况,`ANA_所属分类` '资格情况', count(DISTINCT `家庭编号`) '家庭户数',count(*) '补贴笔数',round(SUM(`市区两级补贴差额`),2) '补贴总额' from `6_0_汇报_all` where `市区两级补贴差额` != 0 
GROUP BY `标志`,`ANA_所属分类`;

-- 需要业务部门 仔细核对的 记录，有的是因为市级档次缺失，有的是因为补贴两种算法结果有差别。
select * from 3_7_简单家庭补贴情况异常
UNION 
SELECT * from 4_h_需要系统算的多合同家庭异常情况;


select * from 6_0_汇报_all where   `市区两级补贴差额` < 0 ;

-- -----------------------------------------------------------------------------------------



update zy_z_temp_pure_family_info set `GXGLH号` = null;
update zy_z_temp_pure_family_info set `GXGLH家庭人口数` = null;
update zy_z_temp_pure_family_info set `GXGLH家庭人均月收入` = null;
update zy_z_temp_pure_family_info set `GXGLH家庭类型` = null;
update zy_z_temp_pure_family_info set `GXGLH特殊情况` = null;


-- 1-为pure家庭查找familycode ----------------------

		update zy_z_temp_pure_family_info set familycode = null;

		update zy_z_temp_pure_family_info t set familycode = (
			select DISTINCT s.familycode
			from zy_base_family_subsidy        s,
					 zy_base_family_member_sub     m,
					 zy_base_family_subsidy_member r
			where s.id=r.subsidyid and r.memberid =m.id and r.issecurity='YES'
					 and m.idcard=t.CardID 
					 and s.qualificationcode in('applytype_001','applytype_002') limit 1
    );
		
		select DISTINCT CardID,name from zy_z_temp_pure_family_info where familycode is null;



		-- 为其他找不到 familycode 的家庭
		update zy_z_temp_pure_family_info i 
		set i.familycode=( select familynumber familycode from zy_biz_family_info where CERTIFICATIONNUMBER = i.cardid /*or name = i.name*/ LIMIT 1) 
		where i.familycode is null;
		
		select DISTINCT CardID,name from zy_z_temp_pure_family_info where familycode is null;




-- 1.5 检查、核对 台账基本信息

update zy_z_temp_pure_family_info t set `GXGLH号`= (
		select max(RECORDCODE) from zy_base_family_subsidy 
		where familycode = t.familycode
		and qualificationcode = 'applytype_001' 
);

update zy_z_temp_pure_family_info t set `GXGLH家庭人口数`= (
		select ENSUREPERSON from zy_base_family_subsidy 
		where RECORDCODE = t.`GXGLH号`
);

update zy_z_temp_pure_family_info t set `GXGLH家庭人均月收入`= (
		select FAMILYMONTHAVG from zy_base_family_subsidy 
		where RECORDCODE = t.`GXGLH号`
);

-- 对于applytype_001(GX和GLH来说，家庭类型为空) select * from zy_base_family_subsidy where QUALIFICATIONCODE='applytype_001' and SUBSIDYLEVEL is not null
-- update zy_z_temp_pure_family_info t set `GXGLH家庭类型`= (
-- 	select d.DICTNAME from zy_base_family_subsidy s,zy_eos_dict_entry d 
-- 	where s.RECORDCODE = t.`GXGLH号` and d.dicttypeid='FAMILY_INCOME110106_NEW' and s.SUBSIDYLEVEL = d.dictid
-- );



-- 问题 出在 数据库字段里，多个特殊情况是用 ','号分隔的，有时候是“,7”,有时候是 "4,5"，如果用 like，就需要区分“1”和”10“，
-- 所以，我只考虑“大病”、“重残”、“60周岁老无子女”、“分散供养的特困人员” 这四种情况。
-- 3- 重残家庭
update zy_z_temp_pure_family_info t set `GXGLH特殊情况` = '';

--  重度残疾人员 
update zy_z_temp_pure_family_info t,zy_base_family_subsidy s set t.`GXGLH特殊情况` = concat(t.`GXGLH特殊情况`,'重度残疾人员,')
where s.RECORDCODE = t.`GXGLH号` and find_in_set('3',s.LOWENSURESIGN ) > 0; 

--  患大病或做过大手术人员 
update zy_z_temp_pure_family_info t,zy_base_family_subsidy s set t.`GXGLH特殊情况` = concat(t.`GXGLH特殊情况`,'患大病或做过大手术人员,')
where s.RECORDCODE = t.`GXGLH号` and find_in_set('4',s.LOWENSURESIGN ) > 0; 

--  分散供养的特困人员 
update zy_z_temp_pure_family_info t,zy_base_family_subsidy s set t.`GXGLH特殊情况` = concat(t.`GXGLH特殊情况`,'分散供养的特困人员,')
where s.RECORDCODE = t.`GXGLH号` and find_in_set('8',s.LOWENSURESIGN ) > 0; 

select * from zy_z_temp_pure_family_info t where t.`GXGLH特殊情况` != '' ORDER BY t.`GXGLH特殊情况`;
 
-- bizfamily_applytype_001 dictid
-- bizfamily_applytype_001	1	60周岁（含）以上老人
-- bizfamily_applytype_001	2	经认定的其他家庭
-- bizfamily_applytype_001	3	重度残疾人员
-- bizfamily_applytype_001	4	患大病或做过大手术人员
-- bizfamily_applytype_001	5	优抚对象（含复转军人、复员军人）
-- bizfamily_applytype_001	6	省部级以上劳动模范家庭
-- bizfamily_applytype_001	7	三房轮候家庭
-- bizfamily_applytype_001	8	分散供养的特困人员
-- bizfamily_applytype_001	9	见义勇为
-- bizfamily_applytype_001	10	计划生育特殊困难家庭



-- 检查1人家庭现在人均收入 < 2400, 但是没在停发名单中的家庭。

select DISTINCT CardID,`Name` /*,`Name`,`GXGLH家庭人口数`,`GXGLH家庭人均月收入`,IncomeMonthly */
from zy_z_temp_pure_family_info 
where `GXGLH家庭人口数` = 1 
		and (`GXGLH家庭人均月收入` < 2400 or  `GXGLH家庭人均月收入` > 5000)
		and CardID not in (select DISTINCT `身份证` from zy_z_temp_pure_list_stop)
		and cardid in (select DISTINCT  `身份证` from zy_z_temp_pure_list);
-- 结论：159户(1人家庭)市里人均收入数据< 2400或者 > 5000,仍然在 纯区级名单里，有问题 		

-- 检查2人家庭现在人均收入 < 2400, 但是没在停发名单中的家庭。
select DISTINCT CardID,`Name` /*`GXGLH家庭人口数`,`GXGLH家庭人均月收入`,IncomeMonthly*/ 
from zy_z_temp_pure_family_info 
where `GXGLH家庭人口数` = 2  
		and (`GXGLH家庭人均月收入` < 2400 or  `GXGLH家庭人均月收入` > 3200)
		and CardID not in (select DISTINCT `身份证` from zy_z_temp_pure_list_stop)
		and cardid in (select DISTINCT  `身份证` from zy_z_temp_pure_list);
-- 结论：30户(2人家庭)市里人均收入数据< 2400或者 > 3200,仍然在 纯区级名单里，有问题 		

-- 检查3人家庭不应该出现在纯区级名单中
select DISTINCT CardID,`Name` /*`GXGLH家庭人口数`,`GXGLH家庭人均月收入`,IncomeMonthly*/ 
from zy_z_temp_pure_family_info 
where `GXGLH家庭人口数` = 3;
-- 结论：3户(3人家庭)不应该出现在纯区级名单中，有问题 		







-- 2 缩减数据规模---
              

-- 身份证
-- DROP TABLE IF EXISTS zy_1base_family_member_sub_smart;               
-- create table zy_1base_family_member_sub_smart as select * from zy_base_family_member_sub t where t.IDCARD in (select cardid from zy_z_temp_pure_family_info z1 union  select cardid from zy_z_temp_pure_family_info z2);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1base_family_subsidy_smart;
-- create table zy_1base_family_subsidy_smart  as select * from zy_base_family_subsidy t where t.FAMILYCODE in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1base_family_subsidy_member_smart;
-- create table zy_1base_family_subsidy_member_smart  as select * from zy_base_family_subsidy_member  t where t.FAMILYCODE in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 选择以 保障资格号码为准，虽然也可以用 经办人身份证办理，但是考虑到人可能会过世，所以还是以保障资格号码为准
-- DROP TABLE IF EXISTS zy_1biz_dist_checkpersion_smart;
-- create table zy_1biz_dist_checkpersion_smart  as select * from zy_biz_dist_checkpersion  t where t.family_record_num in (select RECORDCODE from zy_1base_family_subsidy_smart t);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_changeinfo_smart; 
-- create table zy_1biz_family_changeinfo_smart  as select * from zy_biz_family_changeinfo t where t.FAMILYNUMBER in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

  
-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_datalockinfo_smart;
-- create table zy_1biz_family_datalockinfo_smart  as select * from zy_biz_family_datalockinfo  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);


		-- 基于上表结果1biz_family_datalockinfo_smart
		-- DROP TABLE IF EXISTS zy_1biz_family_datalockdetail_smart; 
		-- create table zy_1biz_family_datalockdetail_smart  as select * from zy_biz_family_datalockdetail  t where t.LOCKID in (select id from zy_1biz_family_datalockinfo_smart);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_info_smart; 
-- create table zy_1biz_family_info_smart  as select * from zy_biz_family_info  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_member_smart;
-- create table zy_1biz_family_member_smart  as select * from zy_biz_family_member  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);


-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_subsidy_smart; 
-- create table zy_1biz_family_subsidy_smart  as select * from zy_biz_family_subsidy  t where t.FAMILYNUMBER in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 家庭编号 （合同信息表）
-- DROP TABLE IF EXISTS zy_1biz_later_family_contractinfo_smart; 
-- create table zy_1biz_later_family_contractinfo_smart  as select * from zy_biz_later_family_contractinfo  t where t.REFFAMILYNUM in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);

-- 基于上表结果1biz_later_family_contractinfo_smart  （合同明细信息表）
-- DROP TABLE IF EXISTS zy_1biz_later_family_pub_contract_smart; 
-- create table zy_1biz_later_family_pub_contract_smart  as select * from zy_biz_later_family_pub_contract  t where t.refcontractid in (select id from zy_1biz_later_family_contractinfo_smart);

-- 家庭编号
-- DROP TABLE IF EXISTS zy_1biz_family_recheck_family_smart; 
-- create table zy_1biz_family_recheck_family_smart  as select * from zy_biz_family_recheck_family   t where t.FAMILYNUMBER in (select familycode from zy_z_temp_pure_family_info z1 union  select familycode from zy_z_temp_pure_family_info z2);
		    
-- 基于上表结果1biz_family_recheck_family_smart
-- DROP TABLE IF EXISTS zy_1biz_family_rechecklockinfo_smart; 
-- create table zy_1biz_family_rechecklockinfo_smart  as select * from zy_biz_family_rechecklockinfo  t where t.refid in (select id from zy_1biz_family_recheck_family_smart);

-- 基于上表结果zy_1biz_family_rechecklockinfo_smart
-- DROP TABLE IF EXISTS zy_1biz_family_rechecklockdetail_smart;  
-- create table zy_1biz_family_rechecklockdetail_smart  as select * from zy_biz_family_rechecklockdetail  t where t.LOCKID in (select id from zy_1biz_family_rechecklockinfo_smart);


-- 基于 1biz_dist_checkPersion_smart 表的 apply_personid， 因为 9.12 市里的邮件里说了两个字段间的关联关系
-- DROP TABLE IF EXISTS zy_1t_bzf_check_family_member_room_smart; 
-- create table zy_1t_bzf_check_family_member_room_smart  as select * from zy_t_bzf_check_family_member_room  t where t.buyer_IDNO in (select apply_personid from zy_1biz_dist_checkPersion_smart);

-- 选择以 保障资格号码为准
-- DROP TABLE IF EXISTS zy_1view_biz_later_house_rent_smart; 
-- create table zy_1view_biz_later_house_rent_smart  as select * from zy_view_biz_later_house_rent  t where t.registernum in (select RECORDCODE from zy_1base_family_subsidy_smart t);

-- 选择以 familycode为准， 交租金信息 （因为太多，加了2个过滤条件）
--   DROP TABLE IF EXISTS zy_1view_house_rent_smart; 
--   create table zy_1view_house_rent_smart  as select * from zy_view_house_rent  t where ZJYEARMONTH >= '2015-12' and PRACTICALMONEY > 0 and moneydatebegin >= '2015-12' and t.reffamilynum in (select familycode from zy_base_family_subsidy t);

-- 选择以 familycode为准，为准
--   DROP TABLE IF EXISTS zy_1view_house_rent_bt_v_ratio_smart;
--   create table zy_1view_house_rent_bt_v_ratio_smart  as select * from zy_view_house_rent_bt_v_ratio  t where  moneydatebegin >= '2015-12' and t.reffamilynum in (select familycode from zy_base_family_subsidy t);

-- 2.5 处理家庭的基础数据 -----------------------
-- 本查询执行的先决条件：
-- 1. zy_base_family_subsidy的 familycode 已经齐备。
-- 2. 3_3_pure家庭合同和交租和补贴表 已经生成
-- 3. 4_7_需要手工计算补贴的多合同家庭 表已经生成

-- 写在前面的情况总结，这个部分是后面的具体查询结果的总结，为了方便查看，写在了前面： 
-- 1. 有L(廉租资格)的 共260户  见 00_有廉租资格家庭
-- 	其中有一个GB的 		-- 248 户
-- 				新GB
-- 				老GB
-- 				老GB不换号转新GB
-- 	其中有多个GB的  
-- 				2个GB		-- 2户
-- 					情况1： 旧 + 旧
-- 					情况2： 旧 + 新
-- 					情况3： 新 + 新
-- 				>2个GB  -- 无
-- 	其中没有GB的		-- 10 户 

-- 2. 没有L的 共 2285户
-- 		没有GB的 		--   15 		
-- 		有1个GB的		-- 2251
-- 		有2个GB的		--   19
-- 		超过2个GB的	-- 		无 
-- 3. 8户身份证不同，但家庭编号一样（4组familycode）







-- 处理过程


-- 3 算法 --------------------
DROP  TABLE IF EXISTS pure_0_0_家庭表;
create table pure_0_0_家庭表 as 
SELECT DISTINCT CardID, `Name`,familycode,`GXGLH号`,`GXGLH家庭人口数`,`GXGLH家庭人均月收入`
FROM
zy_z_temp_pure_family_info
;

select count(*) c from pure_0_0_家庭表 GROUP BY familycode ORDER BY c desc ;


ALTER TABLE `pure_0_0_家庭表` ADD COLUMN `资格开始月份`  date NULL ;
ALTER TABLE `pure_0_0_家庭表` ADD COLUMN `资格结束月份`  date NULL ;

update pure_0_0_家庭表 t set `资格开始月份` = (select min(effDate) from zy_z_temp_pure_family_info i where i.cardid = t.cardid);
update pure_0_0_家庭表 t set `资格结束月份` = (select min(停发月份) from zy_z_temp_pure_list_stop i where i.`身份证` = t.cardid);



-- pure家庭 与 合同基本信息对应表
DROP  TABLE IF EXISTS pure_1_0_家庭合同基本信息表;
create table pure_1_0_家庭合同基本信息表 as 
SELECT
s.*,
t.BEGINDATE con_BEGINDATE,
t.ENDDATE con_ENDDATE,
t.CONTRACTTYPE con_CONTRACTTYPE,
t.CONTRACTSTATE con_CONTRACTSTATE,
t.TENANTNAME con_TENANTNAME,
t.id con_CONID 
FROM
pure_0_0_家庭表 s
LEFT JOIN zy_1biz_later_family_contractinfo_smart t ON s.familycode = t.REFFAMILYNUM
;

-- begin 增加一条“筛查结果记录”
ALTER TABLE `pure_1_0_家庭合同基本信息表` ADD COLUMN `筛查结果`  varchar(1000) NULL DEFAULT '';
-- end 增加一条“筛查结果记录”

-- begin 对没有合同信息的家庭做标记 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
SELECT familycode,count(DISTINCT con_conid) c from pure_1_0_家庭合同基本信息表 GROUP BY familycode;

update pure_1_0_家庭合同基本信息表 t set t.筛查结果=concat(t.筛查结果,'X1-没有合同信息') where familycode in (
	select DISTINCT familycode 
	from zy_deleteme
	where c = 0
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对没有合同信息的家庭做标记 



DROP  TABLE IF EXISTS pure_1_1_家庭合同具体信息表;
create table pure_1_1_家庭合同具体信息表 as 
SELECT
s.*,
t.ITEMNAME condetail_项目名称,
t.CONTRACTNUM condetail_CONTRACTNUM,
t.HOUSEADDRESS condetail_HOUSEADDRESS,
t.BASEMONEY condetail_BASEMONEY,
t.STRUCTUREAREA condetail_STRUCTUREAREA,
t.MOTHMONEY condetail_MONTHMONEY,
t.VALUEADDMONEY condetail_VALUEADDMONEY,
t.MONTHWITHHOLDMONEY condetail_MONTHWITHHOLDMONEY,
t.WITHHOLDNAME condetail_WITHHOLDNAME,
t.WITHHOLDNUM condetail_WITHHOLDNUM,
t.REGISTERNUM condetail_REGISTERNUM,
t.RENTALWITHHOLDDATE condetail_RENTALWITHHOLDDATE
FROM 
pure_1_0_家庭合同基本信息表 s
LEFT JOIN zy_1biz_later_family_pub_contract_smart t ON s.con_CONID = t.REFCONTRACTID; 



-- begin 对资格目前正被锁定的家庭做标记 
update pure_1_1_家庭合同具体信息表 t set t.筛查结果=concat(t.筛查结果,' X5-该家庭资格目前正被锁定补贴暂缓处理') 
where t.condetail_REGISTERNUM in (
	SELECT RECORDCODE from zy_1biz_family_recheck_family_smart  
	where 
	ID in (select REFID from zy_1biz_family_rechecklockinfo_smart where locksate = 'lockstat_001') -- 锁定中状态的
	and ( RECHECKSUBSIDY='applytype_001')
);
-- begin 对资格目前正被锁定的家庭做标记 

DROP  TABLE IF EXISTS pure_1_2家庭合同和交租表;
create table pure_1_2家庭合同和交租表 as 
SELECT
s.*,
t.ZJYEARMONTH 					rent_ZJYEARMONTH ,
t.RENTALDATE                   rent_RENTALDATE ,
t.PAYABLEMONEY                 rent_PAYABLEMONEY ,
t.RECEIVABLEMONEY              rent_RECEIVABLEMONEY ,
t.PRACTICALMONEY               rent_PRACTICALMONEY ,
t.RECEIVEDDATE                 rent_RECEIVEDDATE ,
t.WITHHOLDBANK                 rent_WITHHOLDBANK ,
t.WITHHOLDBANKNUM              rent_WITHHOLDBANKNUM ,
t.RENTALSTATE                  rent_RENTALSTATE ,
t.MONEYDATEBEGIN               rent_MONEYDATEBEGIN ,
t.MONEYDATEEND                 rent_MONEYDATEEND ,
t.ITEMNAME                     rent_ITEMNAME ,
t.TENANTNAME                   rent_TENANTNAME ,
t.TENANTCERTIFICATENUM         rent_TENANTCERTIFICATENUM ,
t.REFFAMILYNUM                 rent_REFFAMILYNUM ,
t.REFCONID                     rent_REFCONID
FROM 
pure_1_1_家庭合同具体信息表 s 
LEFT JOIN zy_1view_house_rent_smart t ON 
		s.condetail_REGISTERNUM 	= t.registernum 
and s.con_CONID 							= t.REFCONID ; 


-- begin 对没有缴费记录的家庭做标记 ， 前提是该家庭有合同。 
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
select familycode,`name`,sum(rent_PRACTICALMONEY) c from pure_1_2家庭合同和交租表 GROUP BY familycode order by c;

update pure_1_2家庭合同和交租表 t set t.筛查结果=concat(t.筛查结果,' X3-没有缴租金记录.') where familycode in (
	select DISTINCT familycode 
	from zy_deleteme
	where c = 0 or c is NULL
);
DROP  TABLE IF EXISTS zy_deleteme;
-- end 对没有合同信息的家庭做标记 



DROP  TABLE IF EXISTS pure_1_3_家庭合同和交租和补贴表;
create table pure_1_3_家庭合同和交租和补贴表 as 
SELECT
s.*,
t.RATIO								  			 sub_RATIO ,
t.PAYABLEMONEY                 sub_PAYABLEMONEY,
t.RECEIVABLEMONEY              sub_RECEIVABLEMONEY ,
t.WITHHOLDBANKNUM              sub_WITHHOLDBANKNUM ,
t.WITHHOLDBANK                 sub_WITHHOLDBANK ,
t.RENTALSTATE                  sub_RENTALSTATE ,
t.MONEYDATEBEGIN               sub_MONEYDATEBEGIN ,
t.MONEYDATEEND               	 sub_MONEYDATEEND ,
t.REFCONID                     sub_REFCONID 
FROM 
pure_1_2家庭合同和交租表 s
LEFT JOIN zy_1view_house_rent_bt_v_ratio_smart t ON 
s.condetail_REGISTERNUM = t.registernum 
and s.con_CONID = t.REFCONID
and s.rent_MONEYDATEBEGIN = t.MONEYDATEBEGIN;  
-- and pure_1_2家庭合同和交租表.rent_MONEYDATEEND = zy_1view_house_rent_bt_v_ratio_smart.MONEYDATEEND; 



-- 去掉在纯区级资格有效期以外的缴纳租金记录 ---- 
DROP  TABLE IF EXISTS pure_1_4_家庭合同和交租和补贴表_时间范围合理;
create table pure_1_4_家庭合同和交租和补贴表_时间范围合理 as 
SELECT * from `pure_1_3_家庭合同和交租和补贴表` where 
 EXTRACT(YEAR_MONTH FROM `rent_MONEYDATEBEGIN`) >= EXTRACT(YEAR_MONTH FROM `资格开始月份`)
and 
	(`资格结束月份` is null 
			or 
			EXTRACT(YEAR_MONTH FROM `rent_MONEYDATEBEGIN`) < EXTRACT(YEAR_MONTH FROM DATE_SUB(`资格结束月份`,INTERVAL 1 MONTH))
	);

-- 去掉过期合同的记录 ---- 
DROP  TABLE IF EXISTS pure_1_5_家庭合同和交租和补贴表_时间合同合理;
create table pure_1_5_家庭合同和交租和补贴表_时间合同合理 as 
SELECT * from `pure_1_4_家庭合同和交租和补贴表_时间范围合理` 
where 
		rent_refconid = con_conid;


DROP  TABLE IF EXISTS pure_1_6_可疑家庭_纯区级补贴生效期间接受市级补贴;
create table pure_1_6_可疑家庭_纯区级补贴生效期间接受市级补贴 as 
select * from `pure_1_5_家庭合同和交租和补贴表_时间合同合理` s where s.sub_receivablemoney is not NULL;


ALTER TABLE `pure_1_5_家庭合同和交租和补贴表_时间合同合理` ADD COLUMN `区里已发纯区级补贴月份` DATE NULL  ;
ALTER TABLE `pure_1_5_家庭合同和交租和补贴表_时间合同合理` ADD COLUMN `区里已发纯区级补贴金额`  varchar(255) NULL  ;

update pure_1_5_家庭合同和交租和补贴表_时间合同合理 t
set t.`区里已发纯区级补贴月份` = 
				(
					select s.`发放年月` 
					from zy_z_temp_pure_list s 
					where 
								EXTRACT(YEAR_MONTH FROM DATE_SUB(s.`发放年月`,INTERVAL 1 MONTH)) = EXTRACT(YEAR_MONTH FROM t.rent_Moneydatebegin)
								and 
								s.`身份证` = t.cardid);
						
update pure_1_5_家庭合同和交租和补贴表_时间合同合理 t
set t.`区里已发纯区级补贴金额` = 
				(
					select s.`应发金额` 
					from zy_z_temp_pure_list s 
					where 
								EXTRACT(YEAR_MONTH FROM DATE_SUB(s.`发放年月`,INTERVAL 1 MONTH)) = EXTRACT(YEAR_MONTH FROM t.rent_Moneydatebegin)
								and 
								s.`身份证` = t.cardid);

--  检查  -- 

-- 1. 没有合同信息,或者没有缴纳租金记录的，但发钱了的家庭
select * from pure_1_5_家庭合同和交租和补贴表_时间合同合理 
where 
	(`筛查结果` LIKE '%X1-没有合同信息%' or `筛查结果` LIKE '%没有缴租金记录%' )
	and `区里已发纯区级补贴金额` is not NULL;
	

DROP  TABLE IF EXISTS pure_2_1_时间合理该发补贴家庭;
create table pure_2_1_时间合理该发补贴家庭 as 
select * from pure_1_5_家庭合同和交租和补贴表_时间合同合理 
where 
	`筛查结果` not LIKE '%X1-没有合同信息%' and `筛查结果` not LIKE '%没有缴租金记录%' ;

/*
DROP  TABLE IF EXISTS zy_deleteme;
create table zy_deleteme as 
select cardid,`name` , count(DISTINCT con_conid) c from pure_2_1_时间合理该发补贴家庭 GROUP BY cardid ORDER BY c desc;


update pure_2_1_时间合理该发补贴家庭 t set t.筛查结果=concat(t.筛查结果,'X2复杂-有多份合同') 
where cardid in (
	select DISTINCT cardid 
	from zy_deleteme
	where c > 1
);
DROP  TABLE IF EXISTS zy_deleteme;
*/

ALTER TABLE `pure_2_1_时间合理该发补贴家庭` ADD COLUMN `区里当月档次`  varchar(255) NULL  ;
ALTER TABLE `pure_2_1_时间合理该发补贴家庭` ADD COLUMN `区里当月人均月收入`  varchar(255) NULL  ;
ALTER TABLE `pure_2_1_时间合理该发补贴家庭` ADD COLUMN `系统试算区里当月应发金额`  varchar(255) NULL  ;
ALTER TABLE `pure_2_1_时间合理该发补贴家庭` ADD COLUMN `该月家庭应补发或补扣金额`  double NULL  ;

UPDATE pure_2_1_时间合理该发补贴家庭 t set t.`区里当月档次` = NULL;
update pure_2_1_时间合理该发补贴家庭 t set t.`区里当月人均月收入` = NULL;

update pure_2_1_时间合理该发补贴家庭 t set t.`区里当月档次`=
(	select distratio 
	from zy_z_temp_pure_family_info s 
	where 
			t.cardid = s.CardID
			and 
			Date(t.rent_moneydatebegin)  - s.Effdate >= 0 
	ORDER BY EffDate desc LIMIT 1  
);

update pure_2_1_时间合理该发补贴家庭 t set t.`区里当月人均月收入`=
(	select incomemonthly 
	from zy_z_temp_pure_family_info s 
	where 
			t.cardid = s.CardID
			and 
			Date(t.rent_moneydatebegin)  - s.Effdate >= 0 
	ORDER BY Effdate desc LIMIT 1 
);

update pure_2_1_时间合理该发补贴家庭 t set t.`系统试算区里当月应发金额`=
(	
	round((IF(condetail_STRUCTUREAREA>60,60,condetail_STRUCTUREAREA)* condetail_MONTHMONEY * (`区里当月档次`/100.0)),2)
);

update pure_2_1_时间合理该发补贴家庭 t set t.`该月家庭应补发或补扣金额`=
(	
	round(
		(		IF(`系统试算区里当月应发金额` is null,0,`系统试算区里当月应发金额`)
		-		IF(sub_payablemoney is null,0,sub_payablemoney) 
		-  	IF(`区里已发纯区级补贴金额` is null,0,`区里已发纯区级补贴金额`)
		),2)
);




select DISTINCT `筛查结果` from pure_2_1_时间合理该发补贴家庭 where rent_refconid != con_conid;


DROP  TABLE IF EXISTS pure_2_2_最终报告;
create table pure_2_2_最终报告 as 
select cardid '身份证',
			`name` '姓名',
			`资格开始月份`,
			`资格结束月份`,
			`筛查结果` '注意事项',
			con_conid '合同id',
			`区里当月人均月收入`,
			condetail_STRUCTUREAREA '面积',
			condetail_MONTHMONEY	'单位面积租金',
			condetail_WITHHOLDNAME '开户行',
			condetail_WITHHOLDNUM	'账号',
			rent_moneydatebegin '租金缴纳日期',
			rent_practicalmoney '租金缴纳金额',
			`区里当月档次`,
			`系统试算区里当月应发金额`,
			`区里已发纯区级补贴月份`,
			`区里已发纯区级补贴金额`,
			sub_payablemoney '市里发的补贴金额',
			`该月家庭应补发或补扣金额`
from pure_2_1_时间合理该发补贴家庭
ORDER BY cardid,rent_moneydatebegin;

ALTER TABLE `pure_2_2_最终报告` ADD COLUMN `该家庭应补发或补扣金额合计`  double NULL  ;

-- !!! 注意！！ 此处因为只生成 2017年2月1日之前交租的补贴，所以，对2月以后的交租记录需要删除。
-- ！！！ 需要手动修改该参数 ！！！！
delete  from `pure_2_2_最终报告` where EXTRACT(YEAR_MONTH FROM `租金缴纳日期`) >= '201702';


update pure_2_2_最终报告 t set t.`该家庭应补发或补扣金额合计`=
(	
select sumval from (
	SELECT `身份证`,round(sum(`该月家庭应补发或补扣金额`),2) sumval
	from pure_2_2_最终报告 s
	GROUP BY `身份证`
	) s where s.`身份证` = t.`身份证`
);


 -- 
DROP  TABLE IF EXISTS pure_2017年2月当月补贴发放合计总账;
create table pure_2017年2月当月补贴发放合计总账 as 
select DISTINCT `身份证`,`姓名`,`该家庭应补发或补扣金额合计` , `开户行`,
			`账号`  from pure_2_2_最终报告 
ORDER BY `该家庭应补发或补扣金额合计`;

DROP  TABLE IF EXISTS pure_2017年2月当月补贴发放明细;
create table pure_2017年2月当月补贴发放明细 as 
select 
`身份证`,
`姓名`,
`资格开始月份`,
`资格结束月份`,
`注意事项`,
`合同id`,
`区里当月人均月收入`,
`面积`,
`单位面积租金`,
`租金缴纳日期`,
`租金缴纳金额`,
`区里当月档次`,
`系统试算区里当月应发金额`,
`区里已发纯区级补贴月份`,
`区里已发纯区级补贴金额`,
`市里发的补贴金额`,
`该月家庭应补发或补扣金额`,
`开户行`,
`账号`

 from pure_2_2_最终报告 
where EXTRACT(YEAR_MONTH FROM `租金缴纳日期`) = '201701';



DROP  TABLE IF EXISTS pure_2017年2月当月补贴发放合计明细;
create table pure_2017年2月当月补贴发放合计明细 as 
select 
*
from pure_2_2_最终报告 
ORDER BY `该家庭应补发或补扣金额合计`,`身份证`,`租金缴纳日期`;


DROP  TABLE IF EXISTS pure_可疑家庭_纯区级资格生效期间市里发过补贴_201702;
create table pure_可疑家庭_纯区级资格生效期间市里发过补贴_201702 as 
select 
*
from pure_2_2_最终报告 
where `市里发的补贴金额` != ''
ORDER BY `该家庭应补发或补扣金额合计`,`身份证`,`租金缴纳日期`;



-- 检查是否有家庭在 mix 和 pure 里都拿补贴
SELECT * from pure_2_2_最终报告 pure,6_0_汇报_all mix
where pure.`身份证` = mix.`身份证`
	and DATE(pure.`租金缴纳日期`) = DATE(mix.`交租期限开始时间`);

-- 110108196201090102	何金宝
