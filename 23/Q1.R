library(tidyverse)

# 온,습도,조도,CO2농도에 따른 객실의 사용유무 판별
# 종속변수: Occupancy, 0 비어있음 1 사용중

dat = read.csv("C:/git/ADP/23/problem1.csv")


# 1 - (1) EDA후 분석가 입장에서 의미있는 탐색
hist(dat$Temperature)
hist(dat$Humidity)
hist(dat$Light)
boxplot(dat$Light)
hist(dat$CO2)
boxplot(dat$CO2)
hist(dat$HumidityRatio)
dat$Light = replace(dat$Light,dat$Light == "-99",NA)
# 1 - (2) 결측치를 대체하는 방식 선택하고 근거제시, 대체 수행
head(dat)
cor(dat[2:6],use="complete.obs")
colSums(is.na(dat))
# CO2 분포 왜도가 쎄서 평균이나 중위수 대체는 안될거같다.
# 다른 변수랑 상관이 그리 높지도 않아서 회귀 대체도 적절한지 모르겠음
# 결측치 수가 크지 않아서 삭제도 괜찮은 옵션
