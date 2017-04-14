function scan_vector = scanColor(sensor_object)
    % get the average red, green, blue, and reflected light values
    % for a given marble.
    
    %@output scanvector
    %  (1) : red
    %  (2) : green
    %  (3) : blue
    %  (4) : light intensity
    
    scans = [];
    for x = 1:5
        % take 5 recordings of data so we can be more precise.
        scans(x,:) = [readColorRGB(sensor_object), readLightIntensity(sensor_object,'reflected')];
    end
    
    scan_vector = mean(scans); % return the average of our scans.
end