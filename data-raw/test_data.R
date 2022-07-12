setwd("~/bayespop/R/wpps/wpp2022/data")
for (f in rev(list.files(".", pattern = "*.R$"))) {print(f); source(f)}