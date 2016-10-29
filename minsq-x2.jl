using PyPlot
data1= open("dados1.txt")

file_directory = "/home/over/git/metodosNumericos/dados1.txt"

f = open(file_directory)

file_content =readdlm(f)


SX = 0
SY = 0
SXY = 0
SX2 = 0
SX3 = 0
SX4 = 0
SX2Y = 0
n = 250

for line = eachline(data1)
  linhas = split(line,"\t")
  x = parse(Float64, linhas[1])
  y = parse(Float64, chomp(linhas[2]))
  SX = SX + x
  SY = SY + y
  SX2 = SX2 + x^2
  SXY = SXY + x*y
  SX3 = SX3 + x^3
  SX4 = SX4 + x^4
  SX2Y = SX2Y + (x * x) * y
end


m = [n SX SX2; SX SX2 SX3; SX2 SX3 SX4]
m1 = [SY SX SX2; SXY SX2 SX3; SX2Y SX3 SX4]
m2 = [n SY SX2; SX SXY SX3; SX2 SX2Y SX4]
m3 = [n SX SY; SX SX2 SXY; SX2 SX3 SX2Y]
D = det(m)
Dx = det(m1)
Dy = det(m2)
Dz = det(m3)

a = Dx/D
b = Dy/D
c = Dz/D

println(a)
println(b)
println(c)

function fmodel(x)
  return a*x^2 +b*x + c
end

title("quadratic")
grid("on")
plot(sort(map(fmodel,file_content[:,1])))
show()
