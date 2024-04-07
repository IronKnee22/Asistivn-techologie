while true
    parfeval(@vytvorenidat,0);
    readDataFuture = parfeval(@readData,0);

    
end


function vytvorenidat()
    s = serialport('COM6', 9600);
    while true
        data = 4;
        writeline(s, num2str(data));
        
        fsclose(s);
    end
end

function data = readData()
    inputPort = serialport("COM6", 9600);
    while true
        data = readline(inputPort);
        fsclose(inputPort);
    end
end


