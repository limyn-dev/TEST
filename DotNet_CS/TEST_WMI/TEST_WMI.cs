

 // Display Win32_ComputerSystem
            //oWmi = new ManagementClass(@"\\" + this.ComputerName + @"\root\cimv2:Win32_ComputerSystem");
            oWmi = new ManagementClass(@"\\.\root\cimv2:Win32_ComputerSystem");
            oVal = oWmi.GetPropertyValue("Name").ToString();
            if (oVal == null) { this.HWLW("Computer     [Not available]"            ) ;   }
            else              { this.HWLW("Computer     [" + oVal.ToString() + "]"  ) ;   }

            /*