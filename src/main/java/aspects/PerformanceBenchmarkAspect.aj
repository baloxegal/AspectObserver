package aspects;

import java.time.Instant;
import java.time.Duration;
import java.util.Arrays;

public aspect PerformanceBenchmarkAspect {
	//Variant 1
//	pointcut measureProcessingPerformance() : call(* transform(..));	
//	Instant start = null;
//	Instant finish = null;
//	before() : measureProcessingPerformance(){
//		start = Instant.now();
//	}
//	after() : measureProcessingPerformance(){
//		finish = Instant.now();
//		System.out.println("Duration of method's execution is " + Duration.between(start, finish));
//	}
	
	//Variant 2
	boolean around() : call(* transform(..)){
		Instant start = Instant.now();
		boolean result = proceed();
		Instant finish = Instant.now();
		System.out.println("Duration of method's execution is " + Duration.between(start, finish));
		System.out.println("thisJoinPoint is: " + thisJoinPoint);
		System.out.print("Arguments of thisJoinPoint is: ");
		Arrays.stream(thisJoinPoint.getArgs()).forEach(a -> System.out.print(a));
		System.out.println();
		return result;
	}
}
