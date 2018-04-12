package CommonUtils;

public class RandomPin {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		   int x = (int)(Math.random() * 4);
		    x = x + 1;
		    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
		    System.out.println(randomPIN);

	}

}
