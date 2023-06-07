require(ggbump)
require(ggplot2)
require(ggthemes)
Dt <- read.csv('Rank.csv')
head(Dt)

p <- 
  ggplot(Dt, 
         aes(x = Year,                      # x axis: Year
             y = Rank,                      # y axis: Rank
             col = collection_channel)) +   # Each collection channel has a distinct color
  geom_bump(linewidth = 2,                # Set line width as 2
            smooth = 8)                   # Set smoothness as 8
p

p <- 
  ggplot(Dt, aes(x = Year, 
                 y = Rank, 
                 col = collection_channel)) + 
  geom_bump(linewidth = 2, 
            smooth = 8) +
  geom_point(size = 5) +                            # Add points
  geom_text(data = Dt[which(Dt$Year == 2019), ],    # Left: label of collection_channel 
            aes(x = Year - 0.02,                    # Move label to left a little bit
                y = Rank, 
                label = collection_channel),        # Label names
            size = 5,                               # Size of label
            hjust = 1) +                            # Adjust horizontal location
  geom_text(data = Dt[which(Dt$Year == 2021), ],    # Right: label of collection_channel 
            aes(x = Year + 0.02,                    # Move label to right a little bit
                y = Rank, 
                label = collection_channel), 
            size = 5, 
            hjust = 0) +                            # Adjust horizontal location
  scale_y_reverse(limits = c(7, 1),                 # Reverse the y scale
                  breaks = rev(seq(1, 7, 1))) +  
  scale_x_continuous(limits = c(2018.9, 2021.1),    # Round x scale
                     breaks = seq(2019, 2021, 1)) + 
  scale_color_tableau(palette = 'Color Blind') +     # Use Tableau color palette
  labs(x = NULL,                                    # Remove title for x axis
       y = 'Rank') +
  theme_bw() + 
  theme(axis.ticks = element_blank(),               # Remove ticks in axes
        panel.border = element_blank(),             # Remove border
        panel.grid = element_blank(),               # Remove grid lines
        panel.background = element_blank(),         # Remove background
        plot.background = element_blank(),
        legend.position = "none",
        axis.text = element_text(size = 15, face = 'bold'),
        axis.title.y = element_text(size = 15, face = 'bold')) 
p

