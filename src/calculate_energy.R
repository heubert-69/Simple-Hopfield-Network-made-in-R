source("../include/hopfield_funct_dec.R")

CalculateEnergy <- function(net_state, weight_matrix)
{
	network_state <- as.matrix(net_state)
	if (ncol(network_state) != 1) {
		network_state <- t(network_state)  # Transpose if it’s a row vector
	}

	#compute energy using the formula
	energy <- -0.5 * sum(network_state * (weight_matrix %*% network_state)) - sum(network_state)

	return(energy)
}
