package com.xx.base.util.htmlUnit;

import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;

public class XXWC {
	/**
	 * 创建WebClient
	 * @return
	 */
	public static WebClient getWC() {
		WebClient webClient = new WebClient(); 
		webClient.setAjaxController(new NicelyResynchronizingAjaxController());
		webClient.getOptions().setJavaScriptEnabled(true);
		webClient.getOptions().setTimeout(10000);
		webClient.getOptions().setThrowExceptionOnScriptError(false);
		webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
		return webClient;
	}
}
