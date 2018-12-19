package com.xx.base.bank;

import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlTable;
import com.gargoylesoftware.htmlunit.html.HtmlTableCell;
import com.gargoylesoftware.htmlunit.html.HtmlTableRow;

/**
 * 汇丰银行网银
 * @author xx
 *
 */
public class HFYN {
	//table001 额度信息
	//人民币 - 信用额度
	private String inherent_credit;
	//人民币 - 可用额度
	private String remaining_credit;
	//人民币 - 临时额度
	private String total_credit;
	//人民币 - 临时额度到期日
	private String temporary_credit_ending_date;
	//table001 额度信息
	//美元 - 信用额度
	private String inherent_credit_us;
	//美元 - 可用额度
	private String remaining_credit_us;
	//美元 - 临时额度
	private String total_credit_us;
	//美元 - 临时额度到期日
	private String temporary_credit_ending_date_us;
	
	//table002 账单信息
	//人民币 - 账单日
	private String month_bill_date;
	//人民币 - 本期账单金额
	private String bill_amount_current;
	//人民币 - 未还金额
	private String bill_amount;
	//人民币 - 最低还款额
	private String bill_amount_lowest;
	//人民币 - 已还金额
	private String bill_amount_repaid;
	//人民币 - 最后还款日
	private String bill_repay_date;
	//人民币 - 当前欠款
	private String total_arrears;
	//table002 账单信息
	//美元 - 账单日
	private String month_bill_date_us;
	//美元 - 本期账单金额
	private String bill_amount_current_us;
	//美元 - 未还金额
	private String bill_amount_us;
	//美元 - 最低还款额
	private String bill_amount_lowest_us;
	//美元 - 已还金额
	private String bill_amount_repaid_us;
	//美元 - 最后还款日
	private String bill_repay_date_us;
	//美元 - 当前欠款
	private String total_arrears_us;
	public HFYN(DomNodeList<DomElement> elementsByTagName) {
		super();
		//共三个表格  1.额度信息 2.账单信息 3.我的信用卡
		for(int i=0;i<elementsByTagName.getLength();i++){//便利所有table
			HtmlTable table = (HtmlTable)  elementsByTagName.get(i);
			int tar_row=0, tar_column=0;
			for(HtmlTableRow row:table.getRows()){ // 遍历所有行
				tar_column=0;
                for(HtmlTableCell cell:row.getCells()){  // 遍历所有列
                    if(i==1 && tar_row==1 &&  tar_column == 3){
                    	System.out.print("============" +cell.asText()+" ==============");
                    }else{
                    	System.out.print(cell.asText()+" ");
                    }
                    	tar_column++;
                }
                System.out.println();
                tar_row++;
            }
		}
		
		
		this.inherent_credit = inherent_credit;
		this.remaining_credit = remaining_credit;
		this.total_credit = total_credit;
		this.temporary_credit_ending_date = temporary_credit_ending_date;
		this.inherent_credit_us = inherent_credit_us;
		this.remaining_credit_us = remaining_credit_us;
		this.total_credit_us = total_credit_us;
		this.temporary_credit_ending_date_us = temporary_credit_ending_date_us;
		this.month_bill_date = month_bill_date;
		this.bill_amount_current = bill_amount_current;
		this.bill_amount = bill_amount;
		this.bill_amount_lowest = bill_amount_lowest;
		this.bill_amount_repaid = bill_amount_repaid;
		this.bill_repay_date = bill_repay_date;
		this.total_arrears = total_arrears;
		this.month_bill_date_us = month_bill_date_us;
		this.bill_amount_current_us = bill_amount_current_us;
		this.bill_amount_us = bill_amount_us;
		this.bill_amount_lowest_us = bill_amount_lowest_us;
		this.bill_amount_repaid_us = bill_amount_repaid_us;
		this.bill_repay_date_us = bill_repay_date_us;
		this.total_arrears_us = total_arrears_us;
	}
	
	
}
