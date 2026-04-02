# 📊 Investing in Victory: MLB Performance & Wins Analysis (1985–2015)

## Overview
This project analyzes how team performance metrics and salary impact wins in Major League Baseball (MLB). Using panel data from 1985 to 2015, the study applies econometric modeling to identify which factors most strongly influence team success.

## Objective
The goal of this project is to evaluate:
- The impact of team performance metrics on wins
- The role of team salary in influencing success
- How these relationships have evolved over time (1985–2000 vs. 2001–2015)

## Dataset
- Source: Lahman Baseball Database (2023 version)
- Time period: 1985–2015
- Includes:
  - Batting statistics (hits, home runs, walks, etc.)
  - Pitching statistics (strikeouts, runs against)
  - Fielding statistics (errors, fielding percentage)
  - Team salary data

## Methodology
- Panel Data Analysis
- Fixed Effects Model
- Log-Log Transformation (elasticity interpretation)
- Hausman test used to validate fixed effects over random effects
- Standard errors clustered at the team level

## Key Variables

### Dependent Variable
- Wins

### Independent Variables
- Hits
- Home Runs
- Walks
- Runs Against
- Strikeouts
- Errors
- Fielding Percentage
- Team Salary
- League Dummy (AL vs NL)

## Key Findings
- Performance metrics have a stronger impact on wins than team salary
- Hits, home runs, walks, and runs against are consistently significant predictors
- Runs against has a strong negative relationship with wins
- Team salary is statistically significant but has limited impact
- Shift over time:
  - Earlier period: broader metrics matter
  - Later period: power hitting (home runs) becomes more important

## Results Summary
- Fixed effects model achieved high explanatory power (Adjusted R² ≈ 0.85)
- Elasticity analysis shows changing importance of metrics over time
- Evidence supports that performance matters more than spending

## Tech Stack
- R
- Libraries:
  - Lahman
  - dplyr
  - plm

## Example Analysis (R)
```r
library(Lahman)
library(dplyr)

# Filter batting data (2000–2015)
batting_filtered <- subset(Batting, yearID >= 2000 & yearID <= 2015)

# Aggregate hits by player
hits_summary <- aggregate(H ~ playerID, data=batting_filtered, sum, na.rm = TRUE)

head(hits_summary)
```

## Insights
- Winning teams rely more on strategic performance metrics than financial spending
- The game has evolved toward power-based strategies
- Salary alone does not guarantee success

## Future Improvements
- Incorporate advanced analytics (e.g., WAR, OPS)
- Expand to post-2015 data
- Compare MLB with other leagues
- Add predictive modeling (machine learning)

## Author
Inaya Zoraiz <br />
Economics & Information Systems
