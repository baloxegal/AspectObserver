package main;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import behavior.DirectoryObserver;
import java.io.IOException;

public class Application {
	
	public static void main(String[] args) throws IOException, InterruptedException {		
		System.out.println("START CHECKING!!!");

		ExecutorService executor = Executors.newCachedThreadPool();		
		for(var typeFile : new DirectoryObserver(null).getConfigurationProvider().getTypeFileList()) {
			executor.execute(new DirectoryObserver(typeFile));			
		}		
	}
}



