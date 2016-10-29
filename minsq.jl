using PyPlot

file_directory = "/home/over/git/metodosNumericos/dados1.txt"

f = open(file_directory)

file_content = readdlm(f)

n = 250

function b1(x,y,n)
  Exy = sum(x .* y)
  Ex = sum(x)
  Ey = sum(y)
  Ex2 = sum(x.^2)

  return (Exy-((Ex*Ey)/n))/(Ex2-(Ex.^2/n))

end

function b0(x,y,n)
  Ey=sum(y)
  Ex=sum(x)

  return (Ey-(b1(x,y,n)*Ex))/n
end

function generateLinearModel(x,y,n)
  part1 = b0(x,y,n)

  part2 = b1(x,y,n)

  return part1,part2
end

rb0,rb1 = generateLinearModel(file_content[:,1],file_content[:,2],250)

function fmodel(x)
  return rb0 + rb1 * x
end


subplot(121)
title("dispersion")
grid("on")
plot(file_content[:,1],"Dw")

subplot(122)
title("linear")
grid("on")
plot(file_content[:,1],map(fmodel,file_content[:,1]))
show()
