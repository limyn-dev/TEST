/*
 * @(#)NbC.java 1.0 01/11/21
 *
 * You can modify the template of this file in the
 * directory ..\JCreator\Templates\Template_1\Project_Name.java
 *
 * You can also create your own project template by making a new
 * folder in the directory ..\JCreator\Template\. Use the other
 * templates as examples.
 *
 */
package myprojects.nbc;

import java.awt.*;
import java.awt.event.*;

class NbC extends Frame {
	
	public NbC() {
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				dispose();
				System.exit(0);
			}
		});
	}

	public static void main(String args[]) {
		System.out.println("Starting NbC...");
		NbC mainFrame = new NbC();
		mainFrame.setSize(400, 400);
		mainFrame.setTitle("NbC");
		mainFrame.setVisible(true);
	}
}
