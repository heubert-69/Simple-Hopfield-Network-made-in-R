source("../include/hopfield_funct_dec.R")

UpdateWeights <- function(weight_matrix, pattern)
{
	#ensures that the matrix is really a matrix
	weight_matrix <- as.matrix(weight_matrix)
	
	weight_matrix <- weight_matrix + (pattern %*% t(pattern))

	#setting the diagonal to 0 to ensure no connections
	diag(weight_matrix) <- 0

	return(weight_matrix)

}
