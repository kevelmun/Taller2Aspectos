import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	
	/*pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }*/
	
	File file = new File("log.txt");
    Calendar calendar = Calendar.getInstance();
    pointcut success() : call(void moneyMakeTransaction());
    after() throws IOException : success(){
    	System.out.println("Transacción: " + calendar.getTime().toString());
    	FileWriter writer= new FileWriter(file,true);
    	writer.write("Transacción: " + calendar.getTime().toString()+"\n");
    	writer.close();
    }
    pointcut ends() : call(void moneyWithdrawal());
    after() throws IOException : ends() {
    	System.out.println("Retiro: " + calendar.getTime().toString());
    	FileWriter writer= new FileWriter(file,true);
    	writer.write("Retiro: " + calendar.getTime().toString()+"\n");
    	writer.close();
    }
} 