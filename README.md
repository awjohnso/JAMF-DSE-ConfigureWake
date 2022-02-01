# JAMF-DSE-ConfigureWake
 Jamf script to configure wake or startup times on lab computers.

- Author: Andrew W. Johnson
- Date: 2020.08.06
- Version 1.00
- Organization: Stony Brook Univeristy/DoIT
---
### Description

This Jamf script will set the start up or wake time of a computer. We find that profiles sometimes don't always work and this to be more reliable.

The script takes two arguments: first one is the day/s of the week, and the second one is the time. They both have to be in the following formats:

- M = Monday
- T = Tuesday
- W = Wednesday
- R = Thursday
- F = Friday
- S = Saturday
- U = Sunday

Example: MTWRFSU, MT, MWF.

Time is in 24h hh:mm:ss leading zeros for less then 10. Examples:

- 4:00 AM = 04:00:00
- 1:00 PM = 13:00:00
