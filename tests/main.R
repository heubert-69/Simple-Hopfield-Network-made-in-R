source("/home/voltsy/Projects/HopFieldNetworks/include/hopfield_funct_dec.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/hopfield.R")              
source("/home/voltsy/Projects/HopFieldNetworks/src/weight_update.R")        
source("/home/voltsy/Projects/HopFieldNetworks/src/calculate_energy.R")       


network <- CreateHopfieldNetwork(c(5, 5))   
pattern <- c(1, -1, 1, 1, -1)                
network_state <- UpdateState(network, pattern)
StorePattern(pattern, network)
energy <- CalculateEnergy(network_state, network)
