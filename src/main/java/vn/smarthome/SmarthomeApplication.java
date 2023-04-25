package vn.smarthome;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SmarthomeApplication {

	public static void main(String[] args) {

		SpringApplication.run(SmarthomeApplication.class, args);
		System.out.println(" 🚀 Server ready at http://localhost:8080");

	}

}
