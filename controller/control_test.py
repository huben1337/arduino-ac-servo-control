import mmap
from time import perf_counter, sleep
import serial

# !!! TEST MODE EXPECTS THE ACTUATOR TO BE IN POSITION 0 !!!
# !!! THIS IS SCRIPT IS ONLY INTENDED FOR TESTING !!!

ACK = True
LOG_ANY_RECEIVED = True
TEST_MODE = True
TEST_LOOP = False
MAX_VALUE = 1000
DELAY = 0.01 #slow down loop time

ACTUATOR_MAX_LENGTH = 696
MMF_PRECISION = 10
MMF_VALUE_RANGE = (1 << MMF_PRECISION)
COMP_FACTOR = ACTUATOR_MAX_LENGTH / MMF_VALUE_RANGE

# class Actuator:
#     def __init__(self, name, range):
#         self.name = name
#         self.range = range
#         self.factor = range / MMF_VALUE_RANGE

#     current_value = 0
#     target_value = 0

# actuators = []

# for i in range(6):
#     actuators.append(Actuator(f"Axis {i+1}", ACTUATOR_MAX_LENGTH))
    
mmf_file = mmap.mmap(-1, 12, "OUTPUT_MMF")
latest_done = latest_time = perf_counter()
last_pos = 0
ser = serial.Serial('COM3', 250000, timeout = 1)

hit_lower_limit = True
v = 0

def get_test_data():
    global hit_lower_limit
    global v
    if hit_lower_limit:
        v += 1
        if v > MAX_VALUE:
            hit_lower_limit = 0
            sleep(1)
    else:
        v -= 1
        if v < 0:
            v = 0
            hit_lower_limit = TEST_LOOP
            sleep(1)
    return v.to_bytes(2, "big")

get_test_data()
while True:
    if (not ser.readable() or ser.in_waiting == 0):
        continue
    byte = ser.read(1)
    if byte == b'C':
        break
    else :
        print('ERROR - INVALID START BYTE')
        exit(1)
            
latest_timestamp =  perf_counter()
while True:
    ready = True
    now = perf_counter()
    delay1 = (now - latest_timestamp) * 1000
    now = perf_counter()
    delay2 = (now - latest_timestamp) * 1000
    pos = last_pos
    data = None
    if TEST_MODE:
        data = get_test_data()
    else:
        data = mmf_file.read()
        mmf_file.seek(0)
    value_raw = int.from_bytes(data[0:2], "big")
    if DELAY:
        sleep(DELAY)
    ser.write(data[0:2])
    pos = int(value_raw * COMP_FACTOR)
    latest_done = now
        
    now = perf_counter()
    delay3 = (now - latest_timestamp) * 1000
    print(f"{value_raw}\t{pos}\t{pos - last_pos}\t{delay1:.3f}\t{delay2:.3f}\t{delay3:.3f}")
    last_pos = pos
    latest_timestamp = now
    while ACK:
        if (not ser.readable() or ser.in_waiting == 0):
            continue
        byte = ser.read(1)
        if byte == b'R':
            break
        elif LOG_ANY_RECEIVED:
            print(int(byte[0]))
        else:
            print('ERROR - INVALID ACKNOWLEDGEMENT BYTE')
            exit(1)
