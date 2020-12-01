package aspects;

import java.util.concurrent.Executors;

import java.io.File;

public aspect LoggingAspect {
	//Variant 1
//	pointcut logBeforeProcessing(File f) : call(* transform(File)) && args(f);	
//	before(File f) : logBeforeProcessing(f){
//		System.out.println("The file \"" + f.getName() + "\" will be transformed");
//	}
	//Variant 2
	before() : call(* transform(..)){
		System.out.println("The file \"" + thisJoinPoint.getArgs()[0] + "\" will be transformed");
	}	
	pointcut logAfterProcessing() : call(* transform(..));
	after() returning(boolean executed) : call(* transform(..)){
		if(executed == true)
			System.out.println("The target file has been transformed successfully");
		else
			System.out.println("The target file was not transformed because there is no correct key for it");
	}	
	after() throwing(Exception e) : call(* transform(..)){
		System.out.println("Threw an exception: " + e);		
	}	
	before() : call(* Executors.newCachedThreadPool()){
		System.out.println("START CHECKING!!!");
	}
	after(File f) returning(boolean existing) : call(* exists()) && target(f){
		if(existing == false)
			System.out.println("Directory - \"" + f.getPath() + "\" not found");
	}
	after(File f) : call(* mkdirs()) && target(f){
		System.out.println("Directory - \"" + f.getPath() + "\" has been created");
	}
}
