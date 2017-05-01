function [] = postBinaryCommServer(current_total_scandata)
    a = '';
    for x = 1:length(current_total_scandata)
        if x ~= length(current_total_scandata)
            a = [a, num2str(current_total_scandata(x)), ' '];
        else
            a = [a,num2str(current_total_scandata(x))];
        end
    end
    
    % open the file that we are going to write our vector to.
    f = fopen('robot-server/templates/binary.html','w');
    fprintf(f,'%s',a);
    fclose(f);
end