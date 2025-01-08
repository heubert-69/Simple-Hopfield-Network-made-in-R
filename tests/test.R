source("/home/voltsy/Projects/HopFieldNetworks/include/hopfield_funct_dec.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/hopfield.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/weight_update.R")
source("/home/voltsy/Projects/HopFieldNetworks/src/calculate_energy.R")

# Define test patterns
pattern1 <- c(1, -1, 1, -1, 1)
pattern2 <- c(-1, 1, -1, 1, -1)

# Initialize Hopfield network
weight_matrix <- CreateHopfieldNetwork(5)

# Train network
weight_matrix <- StorePattern(weight_matrix, pattern1)
weight_matrix <- StorePattern(weight_matrix, pattern2)

# Test recall ability of my network
initial_state <- c(1, -1, 1, -1, -1) # Noisy pattern
current_state <- as.matrix(initial_state)
for (i in 1:10) {
    new_state <- UpdateState(weight_matrix, current_state)
    if (all(new_state == current_state)) {
        break
    }
    current_state <- new_state
}
cat("Final state after updates:", t(current_state), "\n")
