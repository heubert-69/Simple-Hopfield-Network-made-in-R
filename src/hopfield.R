source("/home/voltsy/Projects/HopFieldNetworks/include/hopfield_funct_dec.R")


CreateHopfieldNetwork <- function(n)
{
	cat("Creating Your Hopfield Network with", n, "neurons\n")
	return(matrix(0, nrow=n, ncol=n))

}

UpdateState <- function(weight_matrix, net_state) 
{
    net_state <- as.matrix(net_state)
    if (ncol(net_state) != 1) {
        net_state <- t(net_state) # Ensure it's a column vector
    }
    cat("Matrix dimensions: weight_matrix =", dim(weight_matrix), 
        ", net_state =", dim(net_state), "\n")
    new_state <- sign(weight_matrix %*% net_state)
    new_state[new_state == 0] <- 1
    return(new_state)
}
StorePattern <- function(pattern, weights)
{
	pattern <- as.matrix(pattern) #ensures that the pattern is a matrix

	weight_m <- weights + (pattern %*% t(pattern)) #update the matrix using hebbian learning

	#set diagonal elements to 0 to set element connection
	diag(weight_m) <- 0

	return(weight_m)
}
