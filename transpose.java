

public class TwoDimensionalArray{
	public static void main(String args[])
	{
		int array[][];
		array = new int [2][3];
		int riterator = 0;
		int citerator = 0;
		int index = 0;
		for(riterator=0;riterator<array.length;riterator++)
		{
			for(citerator=0;citerator<array[riterator].length;citerator++)
			{
				array[riterator][citerator]=Integer.parseInt(args[index]);
				index++;
			}
			}
			System.out.println(" --------MATRIX -------");
			for(riterator=0;riterator<array.length;riterator++)
		{
			for(citerator=0;citerator<array[riterator].length;citerator++)
			{
				System.out.print(array[riterator][citerator]+" ");
				
		}
		System.out.println(" ");
	}
			System.out.println(" --------TRANSPOSE MATRIX -------");

	for(citerator=0;citerator<array[0].length;citerator++)
		{
			for(riterator=0;riterator<array.length;riterator++)
			{
				System.out.print(array[riterator][citerator]+" ");
		}
		System.out.println(" ");
	}
}
}



 
