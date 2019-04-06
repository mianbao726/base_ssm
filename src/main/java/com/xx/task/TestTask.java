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

	@Scheduled(cron = "0/10 * * * * ? ")
	// 间隔5秒执行
	public void taskCycle() {
		long start = System.currentTimeMillis();
		System.out.println("使用SpringMVC框架配置定时任务 : " + new Date());
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("repayment_banks", "" + "''" +
		// ",'ZSYH'" +
		// ",'HFYH'" +
		// ",'PFYH'" +
		// ",'XYYH'" +
		// ",'PAYH'" +
		// ",'MSYH'" +
		// ",'ZXYH'" +
		// ",'HRYH'" +
		// ",'ZGYH'" +
		// ",'GSYH'" +
				",'GFYH'" +
				// ",'SJYH'" +
				// ",'YZYH'" +
				// ",'JSYH'" +
				// ",'GDYH'" +
				// ",'GDYH'" +
				"");
		List<Map<String, Object>> l = baseDao.selectList("baseFrame_Cridit.getAllCreditInfos", p); // 查询信用银行信息
		for (Map<String, Object> m : l) {
			String bill_day = m.get("month_bill_date").toString();// 每月账单日
			String count = m.get("bill_repay_day_count").toString();// 某些信用卡非固定还款日，账单日后x天内还款
			String bill_repay_day_fixed = "";// 某些信用卡固定还款日，固定还款日期（通常固定还款日的信用都是次月）
			if (m.containsKey("bill_repay_day_fixed")) {
				bill_repay_day_fixed = m.get("bill_repay_day_fixed").toString();// 固定还款日期
			}
			BigDecimal bill_amount = ((BigDecimal) m.get("bill_amount"));// 账单金额
			BigDecimal pre_bill_amount = ((BigDecimal) m.get("pre_bill_amount"));// 未出账单金额

			/**
			 * 当前账单年月信息 账单的年月信息用来区分.<br>
			 * TODO 暂时不考虑逾期情况。 
			 * a1.当前日期在账单日前 （包含账单日当日）&& 有未还金额，则是上个月，表示上个月的账单尚未还清。<br>
			 * a2.当前日期在账单日前 （包含账单日当日）&& 无未还金额，当前账单已还清，如果不是当前月则需要更新成当前月份<br>
			 * b1.当前日期在账单日第一天 ** 需要有出账单逻辑 **
			 * c1.当前日期在账单日后 && 有未还金额，保留在当前月份即可
			 * c1.当前日期在账单日后 && 无未还金额，需要更新到下个月
			 */
			String current_bill_year = m.get("current_bill_year").toString();
			String current_bill_month = m.get("current_bill_month").toString();
			

			String bill_date_start = DateUtil.calMonth(DateUtil.setDay(bill_day), -1);// 上一个账单日　当前账单的账单日期 开始 (DateUtil.formatCalendar格式化日期)
			String bill_date_end = DateUtil.formatCalendar(DateUtil.setDay(bill_day));// 账单日　当前账单账单日期 结束 (DateUtil.formatCalendar格式化日期)
			String pay_date = "";
			// 当前账单日的最后还款日期　　根据账单日 和 还款天数 计算出最后还款日
			if (m.containsKey("bill_repay_day_fixed") && m.get("bill_repay_day_fixed") != null) {// 账单期后固定时间还款（例如平安 每月15日出账，次月3日固定还款）
				pay_date = DateUtil.nextMonthFixDay(bill_date_end, bill_repay_day_fixed);// 当前账单日的最后还款日期　　根据账单日 和 还款天数 计算出最后还款日
			} else {// 账单期后若干天到期
				pay_date = DateUtil.after(bill_date_end, count);// 当前账单日的最后还款日期　　根据账单日 和 还款天数 计算出最后还款日
			}
			String next_bill_date = DateUtil.calMonth(DateUtil.setDay(bill_day), 1);// 下一月的账单日
			String next_pay_date = "";

			if (m.containsKey("bill_repay_day_fixed") && m.get("bill_repay_day_fixed") != null) {// 账单期后固定时间还款（例如平安 每月15日出账，次月3日固定还款）
				next_pay_date = DateUtil.nextMonthFixDay(next_bill_date, bill_repay_day_fixed);// 当前账单日的最后还款日期　　根据账单日 和 还款天数 计算出最后还款日
			} else {// 账单期后若干天到期
				next_pay_date = DateUtil.after(next_bill_date, count);// 下一月的账单日的最后还款日
			}

			String current_date = DateUtil.getCurrentDate();// 当前日期

			BigDecimal next_bill_date_count = new BigDecimal(0);// 到下一个账单x天
			BigDecimal free_day_count = new BigDecimal(0);// 免息期x天
			BigDecimal bill_gen_count = new BigDecimal(0);// 账单已生成x天
			BigDecimal util_bill_pay_date = new BigDecimal(0);// x天内到期

			System.out.println("账单周期: (" + bill_date_start + "~" + bill_date_end + ")  还款日期:" + pay_date + "  当前日期 :" + current_date);
			System.out.println("账单金额: " + bill_amount + "  未出账单金额:" + pre_bill_amount);
			// if(bill_amount.compareTo(BigDecimal.ZERO)>0 ){// 当前账单不为零
			System.out.println("-----需要生成账单-----");
			System.out.println("账单周期                               :" + bill_date_start + " ~ " + bill_date_end);
			System.out.println("还款日期                               :" + pay_date + "    " + DateUtil.daysBetween(current_date, pay_date) + " 天内账单到期" + "        账单金额:" + bill_amount);
			next_bill_date_count = new BigDecimal(DateUtil.daysBetween(next_bill_date, current_date));
			if (DateUtil.daysBetween(pay_date, current_date) < 0) { // 在当前月的最后还款日钱
				System.out.println("账单日期                  :" + bill_date_end + "    " + (DateUtil.daysBetween(bill_date_end, current_date) + "").replace("-", "") + "天后出账    ");
				bill_gen_count = new BigDecimal(DateUtil.daysBetween(bill_date_end, current_date));
				util_bill_pay_date = new BigDecimal(DateUtil.daysBetween(current_date, pay_date));
			} else {
				System.out.println("下一个账单日期                  :" + next_bill_date + "    当前月账单已出账:" + DateUtil.daysBetween(bill_date_end, current_date) + "天    " + DateUtil.daysBetween(current_date, next_bill_date) + " 天后出下月账单");
			}
			if (DateUtil.daysBetween(bill_date_end, current_date) < 0) {
				free_day_count = new BigDecimal(DateUtil.daysBetween(current_date, pay_date));
				System.out.println("账单的还款日期     :" + pay_date + "    " + DateUtil.daysBetween(current_date, pay_date) + " 天免息期 ");
			} else {
				free_day_count = new BigDecimal(DateUtil.daysBetween(current_date, next_pay_date));
				System.out.println("下一个账单的还款日期     :" + next_pay_date + "    " + DateUtil.daysBetween(current_date, next_pay_date) + " 天免息期 ");
			}
			// }else{
			//
			// }

			m.put("current_bill_date", bill_date_end); // 当前账单日期
			m.put("current_bill_pay_date", pay_date);// 当前账单最后还款日

			m.put("current_bill_date_start", bill_date_start); // 账单统计开始日期
			m.put("current_bill_date_end", bill_date_end);// 账单统计结束日期

			// 当前账单年
			m.put("current_bill_year", current_date.subSequence(0, 4));
			// 当前账单月
			m.put("current_bill_month", current_date.subSequence(5, 7));
			// 账单金额
			m.put("bill_amount", bill_amount.toString());
			// 账单剩余应还金额
			m.put("bill_amount_remaining", bill_amount.toString());// TODO
			// 修正后的账单金额
			m.put("bill_amount_edit", bill_amount.toBigInteger());// TODO
			// 账单生成x天
			m.put("bill_gen_count", bill_gen_count.toString());
			// x天内还款
			m.put("util_bill_pay_date", util_bill_pay_date.toString());
			// 未出账单金额
			m.put("pre_bill_amount", pre_bill_amount.toString());
			// x天后出下个月的账单
			m.put("next_bill_date_count", next_bill_date_count.abs().toString());
			// 免息期 free_day_count
			m.put("free_day_count", free_day_count.abs().toString());
			// 下一个账单日
			m.put("next_bill_date", next_bill_date);

			baseDao.update("baseFrame_Cridit.upate_credit_bill_date", m);
		}
		long end = System.currentTimeMillis();
		System.out.println("使用SpringMVC框架配置定时任务 : " + ((end - start) / 1000) + "." + ((end - start) % 1000) + "  end ... ... ");

	}
}
