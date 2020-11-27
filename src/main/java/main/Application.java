package main;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import behavior.DirectoryObserver;

import java.io.File;
import java.io.IOException;

public class Application {
	
	public static File getF(File f) {
		
		return new File("images/original/" + f.getName());
	}
	
	public static void main(String[] args) throws IOException, InterruptedException {		
		System.out.println("START CHECKING!!!");
//		
//		Thread observer_1 = new Thread(new DirectoryObserver("image"));
//		Thread observer_2 = new Thread(new DirectoryObserver("music"));
//		observer_1.start();
//		observer_2.start();
		
//		ExecutorService executor = Executors.newCachedThreadPool();		
//		for(var typeFile : new DirectoryObserver(null).getConfigurationProvider().getTypeFileList()) {
//			executor.execute(new DirectoryObserver(typeFile));			
//		}
		
//		new DirectoryObserver("image").observe();
		
		File f = new File("image_1");
		File z = Application.getF(f);
		
	}
}



