library(timevis)
library(htmltools)
timeline
c("Black-Scholes-Merton<br>options pricing model",
  "Stochastic modelling<br>of volatility"  ,
  "Jump diffusion models",
  "Flash Crash",
  "Basel III",
  "Rebentrost et al.2018<br> propose a quantum computational<br> algo to price derivatives",
  "CME Smart Stream launched:<br> First derivatives exchange<br>to offer real-time cloud-based market data",
  "Late Professor JohnMcCarthy (MIT) suggested<br>computing would be sold as a utility",
  "IBM virtualised <br> operating systems",
  "APRANET <br> launched",
  "Nearly 100,000 computers connected to the internet",
  "World Wide Web launched; 1 million<br>computers connected to the Internet",
  "Compaq Computer Corp.introduce an<br>'An Internet Divisions Strategy for Cloud Computing'",
  "Amazon Web Services (AWS) launch public Cloud",
  "OpenNebula research project launched; 'Big data'starts to become popular",
  "Amazon launch Elastic Compute Cloud(EC2)",
  "Dropbox founded;Cloud storage becomes a service",
  "Microsoft launch<br>Azure",
  "DigitalOcean launched; third largest cloud computing company (2020)",
  "Real-time streaming data processed on AWS",
  "Blockchain-as-a-service launched",
  "Machine learning services on the Cloud",
  "Microsoft launches under the seadata-centre",
  "Google Tensor Processing Units (TPUs) avaliable on the Cloud")->content
start   = c("1973","1993","2000","2010","2013","2018","2019","1961","1967","1969","1988","1991","1996","2002","2005","2006","2007","2010","2012","2013","2015","2015","2018","2018")

timevis(data.frame(
  start=start,
  content =content ,
  group=c(rep(1,7),rep(2,length(content)-7)),
  style=c(rep("font-size: 0.5em; color: blue;",7),rep("font-size: 0.5em; color: red;",length(content)-7))),
  groups = data.frame(id = 1:2, content = c("Finance Computational<br>Milestones","Cloud<br>Computing")))->tv


style = ".vis-timeline {
border-color: #269026;
  background-color: lightblue;
  font-size: 15px;
  color: green;
  width: '100%';
  height: '50%';}
.vis-item {
  border: 2px solid #5ace5a;
  font-size: 8pt;
  background: #d9ffd9;
  font-family: lucinda console;
  padding: 2px;}"

tv <- tagList(tags$style(style), tv)
tv


library(timevis)
library(htmltools)
timeline_data<-data.frame(
  Milestones= c(
    "Late Professor JohnMcCarthy (MIT) suggested computing would be sold as a utility",
    "IBM virtualised operating systems",
    "US Defence APRANET launched; Introducing of networking and the beginnings of the internet",
    "Black-Scholes-Merton options pricing model",
    "World Wide Web launched; 1 million computers connected to the Internet",
    "First mention of the Cloud in a Compaq Computer Corp internal strategy document",
    "Stochastic modelling of volatility",
    "Amazon Web Services (AWS) launch public Cloud",
    "Jump diffusion models introduced",
    "OpenNebula research project launched; 'Big data'starts to become popular",
    "Dropbox founded;Cloud storage becomes a service",
    "Amazon launch Content Delivery Networks (CDNs); e.g. Dockers",
    "Flash Crash: US stock market lost 10% in a few minutes",
    "Hardware accelerators introduced: GPUs added to Amazon EC2 instances",
    "Microsoft launch their Cloud service Azure",
    "Basel III introduced and requires periodic risk valuation of complex derivative products",
    "Microsoft launches under the sea data-centre",
    "Google Tensor Processing Units (TPUs) avaliable on the Cloud",
    "Rebentrost et al. propose a quantum computing algo to price derivatives",
    "CME Smart Stream launched: First derivatives exchange to offer real-time cloud-based market data"),
  Year=c('1961-07-01',"1972-02-01",'1969-09-01',
         '1973-06-01','1991-03-01','1996-09-01',
         '2000-04-01','2002-05-06','2003-04-01','2005-01-01',
         '2006-06-01',2008,2010,2010,2010,2013,2018,2018,2019,2019),
  Event_type=c("Cloud","Cloud","Cloud",
               "Finance","Cloud","Cloud","Finance",
               "Cloud","Finance","Cloud","Cloud","Cloud",
               "Cloud","Cloud","Finance","Finance","Cloud",
               "Cloud","Finance","Finance"))

timeline_data<-timeline_data %>%
  mutate(dodge=runif(nrow(timeline_data),0,1),
         position=if_else(Event_type=="Cloud",1,-1),
         position=position*dodge*2)

timeline_data %>%
  ggplot(aes(x=Year,y=position,colour=Event_type)) + 
  geom_segment(aes(y=position,yend=0,xend=Year), color='black', size=0.2) +
  geom_point() +
  geom_hline(yintercept = 0) +
  theme(axis.line.y=element_blank(),
                     axis.text.y=element_blank(),
                     axis.title.x=element_blank(),
                     axis.title.y=element_blank(),
                     axis.ticks.y=element_blank(),
                     axis.text.x =element_blank(),
                     axis.ticks.x =element_blank(),
                     axis.line.x =element_blank(),
                     legend.position = "bottom") +
  geom_text(aes(x=Year,y=0,label=Year),size=1.5,hjust=1, color='black',angle=90)


