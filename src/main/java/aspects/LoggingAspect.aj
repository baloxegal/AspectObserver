package aspects;

import java.io.File;

import processors.FileProcessor;

public aspect LoggingAspect {
	pointcut logBeforeProcessing(File fileName) : call (processors.FileProcessor.transform(..) && args(fileName));
	
	before(File fileName):logBeforeProcessing(fileName){
		System.out.println(fileName.getName());
	}
}
