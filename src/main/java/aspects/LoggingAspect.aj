package aspects;

import java.io.File;

import processors.FileProcessor;

public aspect LoggingAspect {
	pointcut logBeforeProcessing(FileProcessor f, File fileName) : call ((*processors.FileProcessor.transform(File)) && args(fileName));
	
	before(File fileName, File fileName):logBeforeProcessing(f, fileName){
		System.out.println(fileName.getName());
	}
}
