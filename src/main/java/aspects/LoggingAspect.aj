package aspects;

import java.io.File;

public aspect LoggingAspect {
	pointcut logBeforeProcessing(File f) : call(* transform(File)) && args(f);	
	before(File f) : logBeforeProcessing(f){
		System.out.println("The file \"" + f.getName() + "\" will be transformed");
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
}
