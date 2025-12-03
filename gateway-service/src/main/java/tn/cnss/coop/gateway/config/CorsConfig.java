package tn.cnss.coop.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.http.server.reactive.ServerHttpResponseDecorator;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebFilter;
import org.springframework.web.server.WebFilterChain;
import reactor.core.publisher.Mono;

@Configuration
public class CorsConfig {

    @Bean
    public WebFilter corsFilter() {
        return (ServerWebExchange ctx, WebFilterChain chain) -> {
            ServerHttpRequest request = ctx.getRequest();
            
            // Handle preflight OPTIONS requests
            if (HttpMethod.OPTIONS.equals(request.getMethod())) {
                ServerHttpResponse response = ctx.getResponse();
                HttpHeaders headers = response.getHeaders();
                headers.set("Access-Control-Allow-Origin", "http://localhost:4200");
                headers.set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
                headers.set("Access-Control-Allow-Headers", "*");
                headers.set("Access-Control-Allow-Credentials", "true");
                headers.set("Access-Control-Max-Age", "3600");
                response.setStatusCode(HttpStatus.OK);
                return Mono.empty();
            }
            
            // For actual requests, decorate the response to clean CORS headers
            ServerHttpResponse originalResponse = ctx.getResponse();
            ServerHttpResponseDecorator decoratedResponse = new ServerHttpResponseDecorator(originalResponse) {
                @Override
                public HttpHeaders getHeaders() {
                    HttpHeaders headers = super.getHeaders();
                    // Remove any existing CORS headers from backend
                    headers.remove("Access-Control-Allow-Origin");
                    headers.remove("Access-Control-Allow-Credentials");
                    headers.remove("Vary");
                    // Set our CORS headers
                    headers.set("Access-Control-Allow-Origin", "http://localhost:4200");
                    headers.set("Access-Control-Allow-Credentials", "true");
                    return headers;
                }
            };
            
            return chain.filter(ctx.mutate().response(decoratedResponse).build());
        };
    }
}
