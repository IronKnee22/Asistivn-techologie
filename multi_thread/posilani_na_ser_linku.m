clear all;
s = serialport('COM6', 9600);

while true
    data = 2;
    writeline(s, num2str(data));
    pause(0.1);
end

fclose(s);
