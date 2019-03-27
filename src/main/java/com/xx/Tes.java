package com.xx;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class Tes {
	public static void main(String[] args) throws ParseException {
		List<Map<String, Object>> accountList = init01();// 初始化账号信息
		display(accountList);
		setMatch(accountList);
	}

	public static void setMatch(List<Map<String, Object>> accountList) {
		// 获取友谊赛
		List<Map<String, Object>> YYList = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> map : accountList) {// 账号信息
			List<Map<String, Object>> questList = (List<Map<String, Object>>) map.get("quest");
			for (Map<String, Object> map2 : questList) {// 账号的任务信息
				switch ((Q) map2.get("name")) {
				case YY: // 友谊赛

					break;

				default:
					break;
				}
			}
		}
	}

	public static void display(List<Map<String, Object>> accountList) {
		// 设置任务
		for (Map<String, Object> map : accountList) {
			System.out.println(map.get("name"));
			List<Map<String, Object>> ql = (List<Map<String, Object>>) map.get("quest");
			for (Map<String, Object> map2 : ql) {
				System.out.print("任务 : " + map2.get("name") + "  ");
			}
			System.out.println();
		}
	}

	public static List<Map<String, Object>> init01() {
		List<Map<String, Object>> accountList = new ArrayList<Map<String, Object>>();
		accountList.add(init01_1("术 狂野之狼 ", "oracle20160922@163.com", "术士_亡语_", "1", "5062", "230", "0"));
		accountList.add(init01_1("法 暗影之风暴", "oracle20160924@163.com", "法师_无限法", "1", "15062", "430", "1"));
		accountList.add(init01_1("牧 Yii", "xxxx2017202@163.com", "牧师_龙_控制", "2", "15062", "430", "1"));
		accountList.add(init01_1("海盗战 还是归属", "hellofuc@163.com", "盗贼_奇迹", "2", "15062", "430", "1"));
		accountList.add(init01_1("dk猎", "xxxx2017002@163.com", "猎人_模块_冬灵_中速", "0", "15062", "430", "1"));
		accountList.add(init01_1("dk贼TOO", "xxxx2017203@163.com", "盗贼_任务贼", "1", "15062", "430", "1"));
		accountList.add(init01_1("萨满 Uij", "xxxx2017204@163.com", "萨满_电影萨", "2", "15062", "430", "1"));
		accountList.add(init01_1("鱼人骑 Xxxx", "271858248@qq.com", "骑士_鱼人", "1", "15062", "430", "1"));
		accountList.add(init01_1("骑士 Den", "xxxx2017106@163.com", "骑士_天启_奇数", "1", "15062", "430", "1"));
		accountList.add(init01_1("dk战 Lxc", "xxxx2017105@163.com", "战士_突袭战", "2", "15062", "430", "1"));
		accountList.add(init01_1("法 Aoo", "xxxx2017201@163.com", "法师_元素_控制", "1", "15062", "430", "1"));
		accountList.add(init01_1("德 诡诈之龟", "xxxx2017104@163.com", "德鲁伊_哈卡_蓝龙_换家", "0", "15062", "430", "1"));

		for (Map<String, Object> map : accountList) {
			List<Map<String, Object>> ql = setq(Enums.random(Tes.Q.class), Enums.random(Tes.Q.class), Enums.random(Tes.Q.class));
			map.put("quest", ql);
		}
		return accountList;
	}

	public static List<Map<String, Object>> setq(Q q1, Q q2, Q q3) {
		List<Map<String, Object>> ql = new ArrayList<Map<String, Object>>();
		if (q1 != null) {
			Map<String, Object> qm1 = new HashMap<String, Object>();
			qm1.put("name", q1);
			ql.add(qm1);
		}
		if (q2 != null) {
			Map<String, Object> qm2 = new HashMap<String, Object>();
			qm2.put("name", q2);
			ql.add(qm2);
		}
		if (q3 != null) {
			Map<String, Object> qm3 = new HashMap<String, Object>();
			qm3.put("name", q3);
			ql.add(qm3);
		}
		return ql;
	}

	public static Map<String, Object> init01_1(String name, String account, String good, String strength, String dust, String gold, String importent) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("name", name);// 账号主擅长
		m.put("account", account);// 账号
		m.put("good", good);// 适合任务
		m.put("strength", strength);// 强度 0强 1中 2低
		m.put("dust", dust);// 尘
		m.put("gold", gold);// 金币
		m.put("importent", importent);// 重点培养（友谊赛相关） 0重要 1一般
		return m;
	}

	public enum Q {
		Z1, Z2, Z3 // 战士1-3胜利
		, Q1, Q2, Q3 // 骑士1-3胜利
		, F1, F2, F3 // 法师1-3胜利
		, M1, M2, M3// 牧师
		, W1, W2, W3// 术士
		, D1, D2, D3// 盗贼
		, S1, S2, S3// 萨满
		, L1, L2, L3// 猎人
		, Y1, Y2, Y3// 德鲁伊
		, WG // 围观
		, PZ// 战士牌
		, PQ// 骑士牌
		, PF// 法师牌
		, PM// 牧师牌
		, PW// 术士牌
		, PD// 盗贼牌
		, PS// 萨满牌
		, PL// 猎人牌
		, PY// 德鲁伊牌
		, YY// 友谊赛
		, FP2// 2费牌
		, FP5// 5费牌
		, FP8// 8费牌
		, ZH// 战吼
		, HD// 海盗
		, YR// 鱼人牌
		, BS// 百伤
		, WY// 亡语
		, FS// 法术
		, YS// 野兽
		, CP// 抽牌
		, YJ// 英雄技能
		, El// 元素
		, LD// 3乱斗
	}

}

class Enums {
	private static int random = (int) (Math.random() * 10);// 生成种子
	private static Random rand = new Random(random);

	public static <T extends Enum<T>> T random(Class<T> ec) {
		return random(ec.getEnumConstants());
	}

	public static <T> T random(T[] values) {
		return values[rand.nextInt(values.length)];
	}
}