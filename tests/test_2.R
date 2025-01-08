source("/home/voltsy/Projects/HopFieldNetworks/include/hopfield_funct_dec.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/hopfield.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/weight_update.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/calculate_energy.R")

original_pattern <- c(
    1, -1,  1, -1,  1,
   -1,  1, -1,  1, -1,
    1, -1,  1, -1,  1,
   -1,  1, -1,  1, -1,
    1, -1,  1, -1,  1
)

num_neurons <- length(original_pattern)
weight_matrix <- CreateHopfieldNetwork(num_neurons)

weight_matrix <- StorePattern(weight_matrix, original_pattern)

set.seed(123) # For reproducibility, to not randomize it :D
noisy_pattern <- original_pattern
noisy_indices <- sample(1:num_neurons, 2) # Flip 5 random pixels
noisy_pattern[noisy_indices] <- noisy_pattern[noisy_indices] * -1

cat("Noisy pattern:\n", matrix(noisy_pattern, nrow = 5, byrow = TRUE), "\n")

#for pre-training 
max_iterations <- 10  # Set a limit to avoid infinite loops
recalled_pattern <- noisy_pattern

for (i in 1:max_iterations) {
    recalled_pattern <- UpdateState(weight_matrix, recalled_pattern)
}
#Recall the pattern
recalled_pattern <- UpdateState(weight_matrix, noisy_pattern)

cat("Recalled pattern:\n", matrix(recalled_pattern, nrow = 5, byrow = TRUE), "\n")

#Visualize the patterns
par(mfrow = c(1, 3)) # Set up plotting area for 3 images

# Original Pattern
X11()
png("original_pattern.png") #for saving the real image
image(matrix(original_pattern, nrow = 5, byrow = TRUE), 
      main = "Original Pattern", 
      col = c("white", "black"), 
      xaxt = 'n', yaxt = 'n')

# Noisy Pattern
png("noisy_pattern.png")
image(matrix(noisy_pattern, nrow = 5, byrow = TRUE), 
      main = "Noisy Pattern", 
      col = c("white", "black"), 
      xaxt = 'n', yaxt = 'n')

# Recalled Pattern
png("recalled_pattern.png")
image(matrix(recalled_pattern, nrow = 5, byrow = TRUE), 
      main = "Recalled Pattern", 
      col = c("white", "black"), 
      xaxt = 'n', yaxt = 'n')
dev.off()
