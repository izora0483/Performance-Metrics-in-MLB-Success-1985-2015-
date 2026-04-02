#library
library(Lahman)
library(dplyr)

#STOLEN BASES STATS 
# Filter data for years 2000-2015 and for AL and NL leagues
batting_filtered_AL_NL <- subset(Batting, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Now, let's aggregate the Stolen Bases (SB) for each player in this filtered dataset
sb_summary_AL_NL <- aggregate(SB ~ playerID, data=batting_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the aggregated stolen bases summary
head(sb_summary_AL_NL)


#COMPLETED GAME STATS
# Filter Pitching data for years 2000 to 2015 and for AL and NL leagues
pitching_filtered_AL_NL <- subset(Pitching, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate the Complete Games (CG) for each player in this filtered dataset
cg_summary_AL_NL <- aggregate(CG ~ playerID, data=pitching_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the complete games summary
head(cg_summary_AL_NL)


# WINS STATS 
# Filter Pitching data for years 2000 to 2015 and for AL and NL leagues
pitching_filtered_AL_NL <- subset(Pitching, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate the Wins (W) for each player in this filtered dataset
wins_summary_AL_NL <- aggregate(W ~ playerID, data=pitching_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the wins summary
head(wins_summary_AL_NL)


# FIELDING PERCENTAGE 

#FPCT= PO+A/PO+A+E where PO is putouts, A is assists, and E is errors
#This will measures a player's defensive reliability

# Filter Fielding data for years 2000 to 2015 and for AL and NL leagues
fielding_filtered_AL_NL <- subset(Fielding, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Calculate Fielding Percentage (FPCT)
# Ensure to handle cases where the denominator would be zero to avoid division by zero errors
fielding_filtered_AL_NL$FPCT <- with(fielding_filtered_AL_NL, (PO + A) / (PO + A + E))

# To handle possible division by zero, replace NaNs (not a number) with NA or a specific value
fielding_filtered_AL_NL$FPCT[is.nan(fielding_filtered_AL_NL$FPCT)] <- NA

#this aggregates putouts (PO), assists (A), and errors (E) by player to sum these statistics across the specified years.
#It then recalculates the fielding percentage based on these aggregated statistics to ensure the calculation is meaningful and based on the total defensive opportunities (chances).
# This approach provides a more accurate calculation of fielding percentage for each player, accounting for their total defensive work over the specified years.

# Sum PO, A, and E by player
fielding_summary_AL_NL <- aggregate(cbind(PO, A, E) ~ playerID, data=fielding_filtered_AL_NL, sum)

# Recalculate FPCT for the aggregated data
fielding_summary_AL_NL$FPCT <- with(fielding_summary_AL_NL, (PO + A) / (PO + A + E))

# View the first few rows of the summary
head(fielding_summary_AL_NL)



# ERRORS STATS 

# Filter Fielding data for years 2000 to 2015 and for AL and NL leagues
fielding_filtered_AL_NL <- subset(Fielding, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Errors (E) by player in this filtered dataset
errors_summary_AL_NL <- aggregate(E ~ playerID, data=fielding_filtered_AL_NL, sum, na.rm = TRUE)

#The na.rm = TRUE argument ensures that any NA values in the errors column are ignored in the summation, preventing them from affecting the result.

# Display the first few rows of the errors summary
head(errors_summary_AL_NL)




# DOUBLE PLAYS STATS

# Filter Fielding data for years 2000 to 2015 and for AL and NL leagues
fielding_filtered_AL_NL <- subset(Fielding, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Double Plays (DP) by player in this filtered dataset
dp_summary_AL_NL <- aggregate(DP ~ playerID, data=fielding_filtered_AL_NL, sum, na.rm = TRUE)

#groups the data by playerID and then calculates the total number of double plays for each player, ignoring any NA values in the DP column.

# Display the first few rows of the double plays summary
head(dp_summary_AL_NL)


# STRIKEOUT STATS 

# Filter Pitching data for years 2000 to 2015 and for AL and NL leagues
pitching_filtered_AL_NL <- subset(Pitching, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Strikeouts (SO) by player in this filtered dataset
so_summary_AL_NL <- aggregate(SO ~ playerID, data=pitching_filtered_AL_NL, sum, na.rm = TRUE)

#The na.rm = TRUE parameter ensures that any NA values are ignored in the summation process

# Display the first few rows of the strikeouts summary
head(so_summary_AL_NL)


# HOMERUNS STATS

# Filter Batting data for years 2000 to 2015 and for AL and NL leagues
batting_filtered_AL_NL <- subset(Batting, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Home Runs (HR) by player in this filtered dataset
hr_summary_AL_NL <- aggregate(HR ~ playerID, data=batting_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the home runs summary
head(hr_summary_AL_NL)


# HITS STATS

# Filter Batting data for years 2000 to 2015 and for AL and NL leagues
batting_filtered_AL_NL <- subset(Batting, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Hits (H) by player in this filtered dataset
hits_summary_AL_NL <- aggregate(H ~ playerID, data=batting_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the hits summary
head(hits_summary_AL_NL)


# DOUBLES ("X2B") STATS

# Filter Batting data for years 2000 to 2015 and for AL and NL leagues
batting_filtered_AL_NL <- subset(Batting, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Doubles (X2B) by player in this filtered dataset
doubles_summary_AL_NL <- aggregate(X2B ~ playerID, data=batting_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the doubles summary
head(doubles_summary_AL_NL)


# TRIPLES("X3B") STATS 

#(recorded as 3B in the dataset) The use of backticks (`3B`) is necessary because the column name begins with a numeral
# Filter Batting data for years 2000 to 2015 and for AL and NL leagues
batting_filtered_AL_NL <- subset(Batting, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Triples (3B) by player in this filtered dataset
triples_summary_AL_NL <- aggregate(`X3B` ~ playerID, data=batting_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the triples summary
head(triples_summary_AL_NL)



# WALKS("BB") STATS 

#(recorded as BB in the dataset)

# Filter Batting data for years 2000 to 2015 and for AL and NL leagues
batting_filtered_AL_NL <- subset(Batting, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate Walks (BB) by player in this filtered dataset
walks_summary_AL_NL <- aggregate(BB ~ playerID, data=batting_filtered_AL_NL, sum, na.rm = TRUE)

# Display the first few rows of the walks summary
head(walks_summary_AL_NL)


# TEAM SALARY STATS

# Filter Salaries data for years 2000 to 2015
salaries_filtered <- subset(Salaries, yearID >= 2000 & yearID <= 2015 & lgID %in% c("AL", "NL"))

# Aggregate salaries by team and year
team_salary_summary <- aggregate(salary ~ teamID + yearID, data=salaries_filtered, sum)

# Display the first few rows of the team salary summary
head(team_salary_summary)




# % OF TEAMS IN AL AND NL

#This reflects not the percentage of unique teams but the percentage of all team instances over the years within the filtered range, considering that each team is counted once per year.

# Filter Teams data for years 2000 to 2015
teams_filtered <- subset(Teams, yearID >= 2000 & yearID <= 2015)

# Keep only teams in the AL and NL
teams_filtered_AL_NL <- subset(teams_filtered, lgID %in% c("AL", "NL"))

# Calculate the number of team-year instances in each league
league_counts <- table(teams_filtered_AL_NL$lgID)

# Calculate the total number of team-year instances
total_counts <- sum(league_counts)

# Calculate the percentage of team-year instances in each league
league_percentages <- league_counts / total_counts * 100

# Print the percentages
print(league_percentages)






