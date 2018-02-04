/*
 Use this program to test if postage stamp problems generated are valid. Enter the number
of basis steps you intend to test for the Basis Step of the problem to test that our program
only generates Strong Induction postage stamp values that can actually be proven true.
*/

package test;

import java.util.Scanner;

public class Test {
	public static void main(String[] args) 
	{
		int stamp1, stamp2, postage, basis;
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Enter stamp value 1.");
		stamp1 = scan.nextInt();
		
		System.out.println("Enter stamp value 2.");
		stamp2 = scan.nextInt();
		
		System.out.println("Enter postage value.");
		postage = scan.nextInt();
		
		//Enter the number of initial basis steps to test
		System.out.println("Enter number of basis steps to test.");
		basis = scan.nextInt();
		
		scan.close();
		
		System.out.println("Stamp 1 is: " + stamp1);
		System.out.println("Stamp 2 is: " + stamp2);
		System.out.println("Postage is: " + postage);
		
		//Testing the basis steps
		int tempInt = postage;
		for (int i = 0; i < basis; i++)
		{
			while(tempInt > 0)
			{
				if (tempInt % stamp1 == 0 || tempInt % stamp2 == 0)
				{
					System.out.println("Basis is true for: " + postage);
					break;
				}
				tempInt = tempInt - stamp2;
				if (tempInt < 0)
				{
					System.out.println("Basis is false for: " + postage);
				}
			}
			postage++;
			tempInt = postage;
		}
    }
}
