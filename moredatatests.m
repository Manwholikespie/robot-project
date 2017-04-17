function prediction = moredatatests(color_data)
    troughs = color_data < 220;
    find(diff(troughs) >= 1);
    diff([1, find(diff(troughs) >= 1), length(color_data)]);

    % for x = 1:
    result = round(diff([0, find(diff(troughs) >= 1), length(color_data)]));
    round(diff([0, find(diff(troughs) >= 1), length(color_data)])./36.06)
    prediction = round(diff([0, find(diff(diff(color_data) > 200) >= 1), length(color_data)]))
end