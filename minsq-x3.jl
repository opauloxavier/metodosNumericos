using PyPlot
data1= open("/home/over/git/metodosNumericos/dados1(2).txt")
file_directory = "/home/over/git/metodosNumericos/dados1(2).txt"

f = open(file_directory)

file_content =readdlm(f)

SX = 0
SY = 0
SXY = 0
SX2 = 0
SX3 = 0
SX4 = 0
SX2Y = 0
SX5 = 0
SX6 = 0
SX3Y = 0
n=250

for line = eachline(data1)
  if(line == "# 250\n")
    n= 250
  else
    linhas = split(line,"\t")
    x = parse(Float64, linhas[1])
    y = parse(Float64, chomp(linhas[2]))
    SX = SX + x
    SY = SY + y
    SX2 = SX2 + x^2
    SXY = SXY + x * y
    SX3 = SX3 + x^3
    SX4 = SX4 + x^4
    SX2Y = SX2Y + (x^2) * y
    SX5 = SX5 + x^5
    SX6 = SX6 + x^6
    SX3Y = SX3Y + (x^3) * y
  end
end

m = [n	SX	SX2	SX3; SX	SX2	SX3	SX4; SX2	SX3	SX4	SX5; SX3	SX4	SX5	SX6]
m1 = [SY	SX	SX2	SX3; SXY	SX2	SX3	SX4; SX2Y	SX3	SX4	SX5; SX3Y	SX4	SX5	SX6]
m2 = [n	SY	SX2	SX3; SX	SXY	SX3	SX4; SX2	SX2Y	SX4	SX5; SX3	SX3Y	SX5	SX6]
m3 = [n	SX	SY	SX3; SX	SX2	SXY	SX4; SX2	SX3	SX2Y	SX5; SX3	SX4	SX3Y	SX6]
m4 = [n	SX	SX2	SY; SX	SX2	SX3	SXY; SX2	SX3	SX4	SX2Y; SX3	SX4	SX5	SX3Y]

D = det(m)
Dx = det(m1)
Dy = det(m2)
Dz = det(m3)
Dw = det(m4)

a = Dx/D
b = Dy/D
c = Dz/D
d = Dw/D

function fmodel(x)
  return a*x^3 + b*x^2 + c*x + d
end

title("cubic")
grid("on")
plot(sort(map(fmodel,file_content[:,1])))
show()
