import os
from time import sleep

path = "/sys/class/power_supply/BAT0/"
battery_percent = "capacity"
status = "status"


def get(file):
	fname = path + file
	f = open(fname, "r")
	return f.read().strip()

while True:
	if int(get(battery_percent)) < 80 and get(status) == "Discharging":

		cmd = """notify-send -u critical "Battery Low" "Battery level is {}%" """
		os.system(cmd.format(get(battery_percent)))

	sleep(60)
