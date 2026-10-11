package com.e_commerce;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;


@SpringBootApplication //autoconfiguration @componentScan @enableconfigannotat

@EnableScheduling
public class ECommerceShoppingApplication1Application {

	public static void main(String[] args) {
		SpringApplication.run(ECommerceShoppingApplication1Application.class, args);
	}

//	@Bean
//	public Map<String, String> paypalSdkConfig() {
//		Map<String, String> configMap = new HashMap<>();
//		configMap.put("mode", mode);
//		return configMap;
//	}
//
//	@Bean
//	public OAuthTokenCredential oAuthTokenCredential() {
//		return new OAuthTokenCredential(clientId, clientSecret, paypalSdkConfig());
//	}
//
//	@Bean
//	public APIContext apiContext() throws PayPalRESTException {
//		APIContext context = new APIContext(oAuthTokenCredential().getAccessToken());
//		context.setConfigurationMap(paypalSdkConfig());
//		return context;
//	}
//
}
