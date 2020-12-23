# From: https://stackoverflow.com/questions/8751653/how-to-convert-a-binary-string-into-a-float-value
from codecs import decode
import struct

def bin_to_float(b):
    """ Convert binary string to a float. """
    bf = int_to_bytes(int(b, 2), 8)  # 8 bytes needed for IEEE 754 binary64.
    return struct.unpack('>d', bf)[0]

def int_to_bytes(n, length):  # Helper function
    """ Int/long to byte string.

        Python 3.2+ has a built-in int.to_bytes() method that could be used
        instead, but the following works in earlier versions including 2.x.
    """
    return decode('%%0%dx' % (length << 1) % n, 'hex')[-length:]

def float_to_bin(value):  # For testing.
    """ Convert float to 32-bit binary string. """
    [d] = struct.unpack(">Q", struct.pack(">d", value))
    return '{:064b}'.format(d)
###############################################################################################
###############################################################################################
# My own code starts here

for i in range(4096):
    x = bin(i).replace("0b", "").zfill(12)
    x = "001111111111" + x + "0000000000000000000000000000000000000000"
    x = bin_to_float(x)
    x = round(1.0/(x*x), 10)
    x = float_to_bin(x)[12:35]
    x = int(x, 2) + 0
    x = bin(x).replace("0b", "").zfill(23)
    print("12'd", i, ": data_o = 23'b", x, ";")