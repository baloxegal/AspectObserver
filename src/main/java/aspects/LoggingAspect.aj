package aspects;

import java.io.File;

public aspect LoggingAspect {
	pointcut logBeforeProcessing(File f) : call(* processors.FileProcessor.transform(File)) && args(f);
	
	before(File f) : logBeforeProcessing(f){
		System.out.println(f.getName());
	}
//	
//	pointcut logBeforeObserve() : call(* behavior.DirectoryObserver.observe());
//	
//	before() : logBeforeObserve(){
//		System.out.println("Vasea");
//	}
	
//	pointcut logBeforePreCompare() : execution(* data.Comparators.preCompare());
//	
//	before() : logBeforePreCompare(){
//		System.out.println("Vasea");
//	}
	
	pointcut logBeforeTransform(File f) : call(* processors.FileProcessor.transform(File)) && args(f);
	
	before(File f) : logBeforeTransform(f){
		System.out.println("Vasea");
	}
	
	pointcut logBeforeGet(File f) : call(* getF(File)) && args(f);
	before(File f) : logBeforeGet(f){
		System.out.println(f.getName());
	}
	pointcut logAfterGet() : call(* getF(File));
	after() returning(File z) : logAfterGet(){
		System.out.println(z.getPath());
	}
	
	pointcut logBeforeGetMapData() : call(* getMapData(..));
	before() : logBeforeGetMapData(){
		System.out.println("Alesha");
	}
}
