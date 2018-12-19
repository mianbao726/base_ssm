package com.xx.task;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.xx.base.dao.BaseDao;
import com.xx.base.util.QuotaDateUtil;

@Component
public class TestTask {
	
	@Resource
	private BaseDao baseDao;
	
//	@Scheduled(cron = "0/30 * * * * ? ") // 间隔5秒执行
    public void taskCycle() {
		long start = System.currentTimeMillis();
        System.out.println("使用SpringMVC框架配置定时任务 : "+new Date());
        List<Map<String,Object>> l = baseDao.selectList("baseFrame_Cridit.getAllCreditInfos");
        for(Map<String,Object> m : l){
        	//更新账单日
        	m.remove("bill_date");
        	m.put("bill_date", QuotaDateUtil.format(QuotaDateUtil.getMonthDate(m.get("month_bill_date").toString())));
        	// 固定天bill_repay_day_fixed   为空则表示非固定天账单,而是出帐后若干天
        	if(m.get("bill_repay_day_fixed") == null){ //出帐后若干天的形式
        		m.put("bill_repay_date", QuotaDateUtil.format(QuotaDateUtil.getRepayDate(m.get("bill_date").toString(),m.get("bill_repay_day_count").toString())));
        	}else{//固定某月天数的形式
        		m.put("bill_repay_date", QuotaDateUtil.format(QuotaDateUtil.getRepayFixedDate(m.get("bill_date").toString(),m.get("bill_repay_day_fixed").toString(),m.get("isNextMonth").toString())));
        	}
        	baseDao.update("upate_credit_bill_date",m);
        }
        long end = System.currentTimeMillis();
        System.out.println("使用SpringMVC框架配置定时任务 : "+ ((end - start)/1000)+"." + ((end - start)%1000) + "  end ... ... ");
        
    }
}
