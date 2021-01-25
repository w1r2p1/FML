library(DiagrammeR)
grViz("
digraph boxes_and_circles {

  # a 'graph' statement
  graph [overlap = true, fontsize = 20]

  # several 'node' statements
  node [shape = box,fontsize = 9,fillcolor=yellow]
  Generative_Models; Discrimative_Models
  
  node [shape=box,fontsize=8,fillcolor=yellow]
  Pattern_Detection;TimeSeries_Pattern_Detection;Dynamic_State_Space_Models;Latent_Factor_Models;Smoothing_Filtering;Factorisation_Models
  
  node [shape=box,fontsize=8,fillcolor=green]
  Stationary;Nonstationary
  
  node [shape=box,fontsize=7,fillcolor=green]
  Homoschedastic;Heteroskedastic
  
  node [shape = egg,fontsize=6] // Econometric models
  Bayesian_regression;Naive_Bayes;Kalman_Filter;Particle_Filter; HMMs; Mixture_Models; ARIMA; GARCH;ExpSmoothing;PCA
  
    node [shape = egg,fontsize=6] // Machine Learning Models
  Bayesian_NNs;GPs;RNNs;GRNNs;LTSMsGRUs;CNNs;LTSM_CNNs;Autoencoders

 # several 'edge' statements
  Generative_Models->{Pattern_Detection;Dynamic_State_Space_Models;Latent_Factor_Models}
  Pattern_Detection->{Bayesian_regression;Naive_BayesBayesian_NNs;GPs}

}
")
