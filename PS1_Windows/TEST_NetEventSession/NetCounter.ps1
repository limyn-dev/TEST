


Get-Counter -MaxSamples 10 -SampleInterval 1 | % {
   $_.CounterSamples | % { 
      "--------------------------------------" | OUT-HOST   
      "CookedValue      [$($_.CookedValue)]     " | OUT-HOST
      "CounterType      [$($_.CounterType)]     " | OUT-HOST
      "DefaultScale     [$($_.DefaultScale)]    " | OUT-HOST
      "InstanceName     [$($_.InstanceName)]    " | OUT-HOST
      "MultipleCount    [$($_.MultipleCount)]   " | OUT-HOST
      "Path             [$($_.Path)]            " | OUT-HOST
      "RawValue         [$($_.RawValue)]        " | OUT-HOST
      "SecondValue      [$($_.SecondValue)]     " | OUT-HOST
      "Status           [$($_.Status)]          " | OUT-HOST
      "TimeBase         [$($_.TimeBase)]        " | OUT-HOST
      "Timestamp        [$($_.Timestamp)]       " | OUT-HOST
      "Timestamp100NSec [$($_.Timestamp100NSec)]" | OUT-HOST
   }
}