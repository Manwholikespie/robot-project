a = max(color_data)
b = min(color_data)
c = mean([a,b])

d = find(color_data > c)
x = 1:length(color_data)
y = []
for i = 1:length(color_data)
    if color_data(i) > c
        y = [y, 1000]
    else
        y = [y, 100]
    end
end
bar(x,y)
