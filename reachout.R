library(twitteR)
library(maps)

    reqURL <- "https://api.twitter.com/oauth/request_token"
            accessURL <- "http://api.twitter.com/oauth/access_token"
            authURL <- "http://api.twitter.com/oauth/authorize"
            consumerKey <- "DrLL7PfIzW66t0sMUPPFvA"
            consumerSecret <- "IDLFOfvQ9AQlFA2wQ70gTxR1VJufjH2ZntTXXU0L8"
            twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                                         consumerSecret=consumerSecret,
                                         requestURL=reqURL,
                                         accessURL=accessURL,
                                         authURL=authURL)
    twitCred$handshake()

            registerTwitterOAuth(twitCred)

twListToDF(searchTwitter('virunga',geocode='29,-1.3,100km',n=200))->kk;plot(kk[,15],kk[,16],col=3,cex=2,pch=8);points(y=45.76,x=8.5565,col=2,pch=4,cex=1);map('italy',add=T)

#

library(sp)
library(rgdal)

twListToDF(searchTwitter('virunga',geocode='38,-1,1000km',n=200))->kk;!is.na(kk[,15])->ind;table(ind)


kk2<-kk[ind,]

kk215<-as.numeric(kk2[,15])
kk216<-as.numeric(kk2[,16])
kk21<-kk2[,1]
kk25<-kk2[,5]
kk211<-kk2[,11]

kk3<-as.data.frame(cbind(kk215,kk216,kk21,kk25,kk211))
names(kk3)<-c('lon','lat','text','created','user')
kkSP <- SpatialPointsDataFrame(kk3, kk2[,-c(15,16)])

invisible(system('rm kk.geojson'))
writeOGR(kkSP, 'kk.geojson', 'kkSP', driver='GeoJSON')

write.table(kk3,'data.csv',sep='|',row.names=F)

