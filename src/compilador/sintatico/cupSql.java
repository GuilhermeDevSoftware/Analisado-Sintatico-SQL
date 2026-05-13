/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador.sintatico;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.IOException;
import jdk.nashorn.internal.ir.Symbol;

/**
 *
 * @author aluno
 */
public class cupSql {

    public static void main(String[] args) throws IOException, InterruptedException, Exception {
        Runtime r = Runtime.getRuntime();
        Process p;
         //p = r.exec(new String[]{"java","-jar", "..\\java-cup-11b.jar", "-parser", "Parser", "-symbols", "Tokens", "..\\parser.cup"}, null, new File("src\\"));    

         //2
         
        /*  
        p = r.exec(new String[]{"java", "-jar", "../jflex-full-1.9.1.jar", "../scanner.flex"}, null, new File("src/"));
        System.out.println(p.waitFor()); // Se ok, saída será 0         
        */
        
        
        /*       
        //3
        Scanner scanner = new Scanner(new FileReader("entrada.txt"));
        System.out.println("Análise Léxica: (Símbolo e Valor)");
        java_cup.runtime.Symbol s = scanner.next_token();
        while (s.sym != Tokens.EOF) {
            System.out.printf("%d  ->  %s\n", s.sym, s.value);
            s = scanner.next_token();
        }*/
       
        
        
        
        //4
        Scanner scanner = new Scanner(new FileReader("entrada.txt"));
        Parser parser = new Parser(scanner);
        parser.parse();
        
    }

}
