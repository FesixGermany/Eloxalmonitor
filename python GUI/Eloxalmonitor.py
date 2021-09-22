'''
	Eloxalmonitor.py
	
	Author: Fesix
	
	Gets temperature, voltage and current data over serial port from converter board
	Prints data on console, plots graph for each one and stores as CSV file
	
	Tested with:
		python 2.7
        python 3.9 (change code in line 32!)
		pyserial 3.5
		matplotlib 2.2.5
		numpy 1.16.0
	
	Todos:
		Empty lines in csv
		Warning because graph limits left==right
'''

# import libraries
import serial
import csv
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

# neccessary to display degree sign
degree_sign = u"\N{DEGREE SIGN}"

# which COM port to get data from
comport = raw_input("Enter COM port: ")     # For python 3 use input() instead of raw_input()

try:
	ser = serial.Serial(comport)
	ser.flushInput()
except:
	print('Could not open COM port.')
	exit()

# number of maximum samples
max_samples = 3600

# arrays prefilled with zeros for displayed values in graphs
temp1 = np.array(np.zeros([max_samples]))
temp2 = np.array(np.zeros([max_samples]))
voltage = np.array(np.zeros([max_samples]))
current = np.array(np.zeros([max_samples]))

counter = 0

# initialize graphs
plt.ion()
fig, axs = plt.subplots(nrows = 2, ncols = 2, constrained_layout = True)
fig.suptitle('Eloxalmonitor', fontsize=16)

line1, = axs[0,0].plot(temp1)
line1.set_ydata(temp1)
axs[0,0].set_title('Temp. 1', fontsize=14)
axs[0,0].set_ylabel(degree_sign + 'C', fontsize=12)
axs[0,0].set_ylim(0, 30)

line2, = axs[0,1].plot(temp2)
line2.set_ydata(temp2)
axs[0,1].set_title('Temp. 2', fontsize=14)
axs[0,1].set_ylabel(degree_sign + 'C', fontsize=12)
axs[0,1].set_ylim(0, 30)

line3, = axs[1,0].plot(voltage)
line3.set_ydata(voltage)
axs[1,0].set_title('Voltage', fontsize=14)
axs[1,0].set_ylabel('V', fontsize=12)
axs[1,0].set_ylim(0, 30)

line4, = axs[1,1].plot(current)
line4.set_ydata(current)
axs[1,1].set_title('Current', fontsize=14)
axs[1,1].set_ylabel('A', fontsize=12)
axs[1,1].set_ylim(0, 3)

fig.canvas.draw()
fig.canvas.flush_events()


# write header for for csv
with open("test_data.csv","a") as f:
	writer = csv.writer(f,delimiter = ";")
	writer.writerow(['Temp1','Temp2','Voltage','Current'])

# main program loop
while True:
	try:
		# receive line from serial port and decode
		# end of line with CR+LF hence the -2 bytes that will not be decoded
		ser_bytes = ser.readline()
		decoded_bytes = ser_bytes[0:len(ser_bytes)-2].decode("utf-8")
		# split, store as a list and convert to float
		value_list = decoded_bytes.split(";")
		value_list_float = [float(i) for i in value_list]
		
		# print values with units on console
		print(value_list[0] + degree_sign + 'C, ' + value_list[1] + degree_sign + 'C, ' + value_list[2] + 'V, ' + value_list[3] + 'A')
		
		# write new line in csv
		# todo: get rid of empty lines between lines with data
		with open("test_data.csv","a") as f:
			writer = csv.writer(f,delimiter = ";")
			writer.writerow([value_list[0],value_list[1],value_list[2],value_list[3]])
		
		# transfer received values from list into next position of array
		temp1[counter] = value_list_float[0]
		temp2[counter] = value_list_float[1]
		voltage[counter] = value_list_float[2]
		current[counter] = value_list_float[3]
		
		# show only values received
		# can be deleted if all values should be displayed at once and graph gets filled
		# todo: get rid of warning because limit left==right at first time
		axs[0,0].set_xlim(0, counter)
		axs[0,1].set_xlim(0, counter)
		axs[1,0].set_xlim(0, counter)
		axs[1,1].set_xlim(0, counter)
		
		# increase sample counter
		counter += 1
		
		# values to be displayed
		line1.set_ydata(temp1)
		line2.set_ydata(temp2)
		line3.set_ydata(voltage)
		line4.set_ydata(current)
		
		# redraw graphs
		fig.canvas.draw()
		fig.canvas.flush_events()
		
		# halt script when maximum sample count reached
		if max_samples == counter:
			print(str(max_samples) + ' samples collected, script halted.')
			print('Enter exit() to stop script')
			input()

	# ctrl+c for stop
	except:
		print("Stopped")
		break