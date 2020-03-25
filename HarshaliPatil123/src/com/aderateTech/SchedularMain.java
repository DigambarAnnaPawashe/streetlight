package com.aderateTech;

import java.util.Timer;

/**
 * 
 * @author 
 */

//Main class
public class SchedularMain {
	public static void main(String args[]) throws InterruptedException {

		Timer time = new Timer(); // Instantiate Timer Object
		ScheduledTask st = new ScheduledTask(); // Instantiate SheduledTask class
		time.schedule(st, 0, 1000); // Create Repetitively task for every 1 secs

		
		
	}
}