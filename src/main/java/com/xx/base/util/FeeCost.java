package com.xx.base.util;

import java.math.BigDecimal;

/**
 * 计算手续费，精确到分
 * @author xx
 *
 */
public class FeeCost {
	
	//费率，默认千分之六
	private static final String FEE_RATE="0.006";
	
	public static void main(String[] args) {
		// 168 1.01
		// 170 1.02
		// 99.5 0.6
		// 160 0.96
		System.out.println(FeeCost.fee("178"));

	}
	
	/**
	 * 重载计算手机费字符串参数格式
	 * <a>FeeCost.fee(BigDecimal amount)</a>
	 * @param amount
	 * @return
	 */
	public static BigDecimal fee(String amount) {
		BigDecimal b = new BigDecimal(amount);
		return FeeCost.fee(b);
	}

	/**
	 * 计算手续费，厘位有数便进一（加一分钱）
	 * @param amount
	 * @return
	 */
	public static BigDecimal fee(BigDecimal amount) {
		return new BigDecimal(amount.multiply(new BigDecimal(FEE_RATE)).add(new BigDecimal(0.009)).movePointRight(2).intValue()).movePointLeft(2);
	}
}
