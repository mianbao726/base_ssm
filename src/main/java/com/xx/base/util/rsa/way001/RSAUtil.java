package com.xx.base.util.rsa.way001;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
public class RSAUtil {
	
	private static String publicKeyStr = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoJEa1C/EdSQmaLHnGZ1Gs5LcLG+EqzCldm1+RM2/7dPMNWu9W6yZHllk1cUd+sA3uEYKkDTillIunxg5Fk/EBJiBIV2q3XYO57yKetY7KF4iemU0Lb4WVJcPH6BhNE66UpXdDSskQsIipRBl9DxXZnSS8albr/zRHSFI6gWgXyt9REfjEhIHzzwAFTtGapetSBsic6rPn+LUOym+ziDdtlWKnimOpNSY47lm5aGHdQUT8vflU+EvY3+wr4YDPf3J1nJZ4p5qaSdFx3pmm1AgyUU3H+EQ6vGdU3kn7nRlow0DtOGHPdMtJr2Xm5L3uD9iuJu007QlyAdPAlNVswOT+QIDAQAB";
	private static String privateKeyStr="MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQCgkRrUL8R1JCZosecZnUazktwsb4SrMKV2bX5Ezb/t08w1a71brJkeWWTVxR36wDe4RgqQNOKWUi6fGDkWT8QEmIEhXarddg7nvIp61jsoXiJ6ZTQtvhZUlw8foGE0TrpSld0NKyRCwiKlEGX0PFdmdJLxqVuv/NEdIUjqBaBfK31ER+MSEgfPPAAVO0Zql61IGyJzqs+f4tQ7Kb7OIN22VYqeKY6k1JjjuWbloYd1BRPy9+VT4S9jf7CvhgM9/cnWclninmppJ0XHemabUCDJRTcf4RDq8Z1TeSfudGWjDQO04Yc90y0mvZebkve4P2K4m7TTtCXIB08CU1WzA5P5AgMBAAECggEBAJhHRZR7AOy/rhWYsz3dpRHldB5IXSAl8KaSTTBfmWiqd38qgNmSpVzdFv6OBVKsPavr8VS2czZxFnoX9PwuBg79u2mzdbq2nog0jXjV+CDetgAyPvwqzO7InLU32zhKefac3poAklEl4Ml+9dJd793hLQM3xRbwxDnGOWqIj4HxMYhaDiH2KelZB/siZsqevcTMP6KyJKexCPkgsUrj8t5TWzYpb55myhHD9XgDSbzdSn35Tl/B2CKE8qU5kgTCCk8lCJ5owBktZGveNpWkL9kNr2gF4OzcHrJK8tJjf3fkgm85WIxrO1Gv9qo4YVNJsdKzrCwEerqZ3ldtfYZQHwECgYEA100qY+RBQTb17+L2zls5czJUyRFJj44Ud+xV+/4ZsMxnRSbDkicuC1FMwXY9a+EChlqKB8DoNCDdaFVWh7fMYLxkVfWs2iSd72/xPZYHVcJBFQdcgsbMN8XJ9M3RCnICpojD+r7B346CMhmCmaPuEgYSsQs9kbvqlDTpP5/VlckCgYEAvus65RHfUuqJ607Emu8P5vP77LwSYtlyGMArdO+fUzFbqyt6W9mY1/z6SWeck9i3MJ7hShVsIIzobePs8TjCYTaojcJqW5BXS6TzPgK6PlLzybMCPZ2WuSWexPPIdX8qf1wGtxG7FMjLr1dIITRwqbg0a1KhPN9fEDAkjHdw5LECgYEApnoZZAIT3wxTYLj7pBZvtr5dRtfiLGltNEl/NwmE7esvkw3lPTakaMXldtYpqifjXuXVQyeLpPsgmFMcRHb/RnGFl94OWOLlaEYDoF5Ir6wzzMHTa5+yOxHqFiurDsuXdxPbjiBAIs+7pmeJT6mtJSyi+Vi6s9w9B3pePP8nFNkCgYEArb4yba6TFskcVEjtgLXYOeyFsg4BiXWrcLzJj3RWAQalDqPViWr/vmeZel3RT3bkV1nvWlUefozdJMxMn8Vwl7l/MOrhkYxM9Skat68RwJALDd5bRql4Nev3jfLw1YSxrw+XiNiY8TQ+sMX0fUtU0A8znQuoclYxE/FMAYzc7zECgYEApGmHOP+kWUYMaN7Wrk6JjMKqt+vGfIwZsKyy031Yjy99Qm8/P+ElhqgpRBCW75/JJEApn7oWnmofNMY1n3Vwb7U7naWdXxs39hJoS3GhxxAD5qu7qrh4m5Y+dsoRGVJJoIGDTx+PDPjRNTCxVMwvlnOTtV39JJMsyHGHQZmcI80=";

	
	//生成秘钥对
		public static KeyPair getKeyPair() throws Exception {
			KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
			keyPairGenerator.initialize(2048);
			KeyPair keyPair = keyPairGenerator.generateKeyPair();
			return keyPair;
		}
		
		//获取公钥(Base64编码)
		public static String getPublicKey(KeyPair keyPair){
			PublicKey publicKey = keyPair.getPublic();
			byte[] bytes = publicKey.getEncoded();
			return byte2Base64(bytes);
		}
		
		//获取私钥(Base64编码)
		public static String getPrivateKey(KeyPair keyPair){
			PrivateKey privateKey = keyPair.getPrivate();
			byte[] bytes = privateKey.getEncoded();
			return byte2Base64(bytes);
		}
		
		//将Base64编码后的公钥转换成PublicKey对象
		public static PublicKey string2PublicKey(String pubStr) throws Exception{
			byte[] keyBytes = base642Byte(pubStr);
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyFactory.generatePublic(keySpec);
			return publicKey;
		}
		
		//将Base64编码后的私钥转换成PrivateKey对象
		public static PrivateKey string2PrivateKey(String priStr) throws Exception{
			byte[] keyBytes = base642Byte(priStr);
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PrivateKey privateKey = keyFactory.generatePrivate(keySpec);
			return privateKey;
		}
		
		//公钥加密
		public static byte[] publicEncrypt(byte[] content, PublicKey publicKey) throws Exception{
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
			byte[] bytes = cipher.doFinal(content);
			return bytes;
		}
		public static String privateDecrypt(String message){
			//将Base64编码后的私钥转换成PrivateKey对象
			PrivateKey privateKey;
			byte[] privateDecrypt = null;
			try {
				privateKey = RSAUtil.string2PrivateKey(privateKeyStr);
			//加密后的内容Base64解码
			byte[] base642Byte = RSAUtil.base642Byte(message);
			//用私钥解密
			privateDecrypt = RSAUtil.privateDecrypt(base642Byte, privateKey);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//解密后的明文
//			System.out.println("解密后的明文: " + new String(privateDecrypt));
			return new String(privateDecrypt);
		}
		
		//私钥解密
		public static byte[] privateDecrypt(byte[] content, PrivateKey privateKey) throws Exception{
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] bytes = cipher.doFinal(content);
			return bytes;
		}
		
		//字节数组转Base64编码
		public static String byte2Base64(byte[] bytes){
			BASE64Encoder encoder = new BASE64Encoder();
			return encoder.encode(bytes);
		}
		
		//Base64编码转字节数组
		public static byte[] base642Byte(String base64Key) throws IOException{
			BASE64Decoder decoder = new BASE64Decoder();
			return decoder.decodeBuffer(base64Key);
		}
		public static void main(String[] args) throws Exception {
			KeyPair keyPair = RSAUtil.getKeyPair();
			String publicKeyStr = RSAUtil.getPublicKey(keyPair);
			String privateKeyStr = RSAUtil.getPrivateKey(keyPair);
			System.out.println("RSA公钥Base64编码:" + publicKeyStr);
			System.out.println("RSA私钥Base64编码:" + privateKeyStr);
			
			
			String message = "hello, i am infi, good night!";
			//将Base64编码后的公钥转换成PublicKey对象
			PublicKey publicKey = RSAUtil.string2PublicKey(publicKeyStr);
			//用公钥加密
			byte[] publicEncrypt = RSAUtil.publicEncrypt(message.getBytes(), publicKey);
			//加密后的内容Base64编码
			String byte2Base64 = RSAUtil.byte2Base64(publicEncrypt);
			byte2Base64 = "hqG2yzqGJt4ZlqfqovrJUT5g08eCKOSuashs1vDQTFINn3iif97V+k0HhE9zDKbB1LyP09qHdcRuF/GiJb+7UXyotu4VcQCU+vDNBSJ1CMQKNxeJ/wb+P6SQbjak4nqs6Wi7JLbWWk/7bP88PQFSUd82iEOJsrRfj5uEemKA2PsbO00FIWjmHRBzN+0NX9OBMfx70cbsAPZmDRCtqcN6yJy/khQKOcHZfGrHXGuZfVSEnMONUUA/5x0Do/7YYJ9v/D6AkD6L5c+Novd/T4FaRE//ZF5KjA5xlNMeNzaQfDXEKfdWcLxKRcdzxuexeij5iwuNte27HXm3MJQWFGHOig==";
			System.out.println("公钥加密并Base64编码的结果：" + byte2Base64);
			
			//将Base64编码后的私钥转换成PrivateKey对象
			PrivateKey privateKey = RSAUtil.string2PrivateKey(privateKeyStr);
			//加密后的内容Base64解码
			byte[] base642Byte = RSAUtil.base642Byte(byte2Base64);
			//用私钥解密
			byte[] privateDecrypt = RSAUtil.privateDecrypt(base642Byte, privateKey);
			//解密后的明文
			System.out.println("解密后的明文: " + new String(privateDecrypt));
		}
}
