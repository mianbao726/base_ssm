package com.xx.task;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.xx.base.dao.BaseDao;
import com.xx.base.util.DateUtil;
import com.xx.base.util.QuotaDateUtil;

@Component
public class TestTask {
	
	@Resource
	private BaseDao baseDao;
	
	@Scheduled(cron = "0/10 * * * * ? ") // 间隔5秒执行
    public void taskCycle() {
		long start = System.currentTimeMillis();
        System.out.println("使用SpringMVC框架配置定时任务 : "+new Date());
        Map<String ,Object> p = new HashMap<String ,Object>();
        p.put("repayment_bank", "ZSYH");
        List<Map<String,Object>> l = baseDao.selectList("baseFrame_Cridit.getAllCreditInfos",p);
        for(Map<String,Object> m : l){
//        	//更新账单日
//        	m.remove("current_bill_date");
//        	m.put("current_bill_date", QuotaDateUtil.format(QuotaDateUtil.getMonthDate(m.get("month_bill_date").toString())));
//        	// 固定天bill_repay_day_fixed   为空则表示非固定天账单,而是出帐后若干天
//        	if(m.get("bill_repay_day_fixed") == null){ //出帐后若干天的形式
//        		m.put("current_bill_pay_date", QuotaDateUtil.format(QuotaDateUtil.getRepayDate(m.get("current_bill_date").toString(),m.get("bill_repay_day_count").toString())));
//        	}else{//固定某月天数的形式
//        		m.put("current_bill_pay_date", QuotaDateUtil.format(QuotaDateUtil.getRepayFixedDate(m.get("current_bill_date").toString(),m.get("bill_repay_day_fixed").toString(),m.get("isNextMonth").toString())));
//        	}
//        	baseDao.update("upate_credit_bill_date",m);
        	
        	String bill_day = m.get("month_bill_date").toString();//账单日期
        	String count = m.get("bill_repay_day_count").toString();//还款天数
    		BigDecimal bill_amount = ((BigDecimal)m.get("bill_amount"));//账单金额
    		BigDecimal pre_bill_amount =((BigDecimal)m.get("pre_bill_amount"));//未出账单金额
    		
    		String bill_date_start =DateUtil.calMonth(DateUtil.setDay(bill_day),-1);//上一个账单日　当前账单的账单日期 开始   (DateUtil.formatCalendar格式化日期)
    		String bill_date_end =DateUtil.formatCalendar(DateUtil.setDay(bill_day));//账单日　当前账单账单日期 结束     (DateUtil.formatCalendar格式化日期)
    		String pay_date =DateUtil.after(bill_date_end, count);//当前账单日的最后还款日期　　根据账单日 和 还款天数 计算出最后还款日
    		String next_bill_date =DateUtil.calMonth(DateUtil.setDay(bill_day),1);//下一月的账单日
    		String next_pay_date =DateUtil.after(next_bill_date, count);//下一月的账单日的最后还款日
    		String current_date = DateUtil.getCurrentDate();//当前日期
    		
    		System.out.println("账单周期: (" +bill_date_start + "~"+  bill_date_end + ")  还款日期:" + pay_date + "  当前日期 :" + current_date);
    		System.out.println("账单金额: " + bill_amount + "  未出账单金额:" + pre_bill_amount);
    		if(bill_amount.compareTo(BigDecimal.ZERO)>0  ){// 当前账单不为零
    			System.out.println("-----需要生成账单-----");
    			System.out.println("账单周期                               :"+bill_date_start+ " ~ "+  bill_date_end);
    			System.out.println("还款日期                               :"+pay_date + "    " +DateUtil.daysBetween(current_date, pay_date) +  " 天内账单到期"+"        账单金额:"+bill_amount  );
    			if(DateUtil.daysBetween(bill_date_end,current_date ) <0){
    				System.out.println("账单日期                  :"+bill_date_end + "    " + (DateUtil.daysBetween(bill_date_end,current_date )+"").replace("-", "")  + "天后出账    " );
    			}else{
    				System.out.println("下一个账单日期                  :"+next_bill_date + "    当前月账单已出账:" + DateUtil.daysBetween(bill_date_end,current_date )  + "天    " + DateUtil.daysBetween(current_date, next_bill_date) +" 天后出下月账单");
    			}
    			if(DateUtil.daysBetween(bill_date_end,current_date ) <0){
    				System.out.println("账单的还款日期     :" + pay_date +"    " +DateUtil.daysBetween(current_date,  pay_date)+" 天免息期 " );
    			}else{
    				System.out.println("下一个账单的还款日期     :" + next_pay_date +"    " +DateUtil.daysBetween(current_date, next_pay_date)+" 天免息期 " );
    			}
    		}else{
    			
    		}
    		
    		m.put("current_bill_date",bill_date_end);
    		m.put("current_bill_pay_date",pay_date);
    		
    		m.put("current_bill_date_start",bill_date_start);
    		m.put("current_bill_date_end",bill_date_end);
    		
    		
    		
    		baseDao.update("baseFrame_Cridit.upate_credit_bill_date",m);
        }
        long end = System.currentTimeMillis();
        System.out.println("使用SpringMVC框架配置定时任务 : "+ ((end - start)/1000)+"." + ((end - start)%1000) + "  end ... ... ");
        
    }
}
