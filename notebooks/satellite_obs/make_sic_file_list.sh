#!/bin/bash

# # Output file for the list of URLs
# LIST="sic_file_list.txt"
# > "$LIST"

# # Loop through years and months
# for YEAR in {2014..2024}; do
#   for MONTH in 08 09 10 11 12; do
#     # Generate days for this month
#     for DAY in $(seq -w 1 31); do
#       # Use GNU date to validate the date
#       if date -d "$YEAR-$MONTH-$DAY" >/dev/null 2>&1; then
#         DATE="${YEAR}${MONTH}${DAY}"
#         FILE="sic_psn25_${DATE}_F17_v05r00.nc"
#         echo "https://noaadata.apps.nsidc.org/NOAA/G02202_V5/north/daily/${YEAR}/${FILE}" >> "$LIST"
#       fi
#     done
#   done
# done

# Output file for the list of URLs
LIST="sic_file_list.txt"
> "$LIST"

# Loop through years 2014–2020
# for YEAR in {2014..2020}; do
for YEAR in {2010..2015}; do
  # Loop through all 12 months
  for MONTH in $(seq -w 1 12); do
    # Loop through all possible days in a month
    for DAY in $(seq -w 1 31); do
      # Validate the date (skips invalid ones like 2020-02-30)
      if date -d "$YEAR-$MONTH-$DAY" >/dev/null 2>&1; then
        DATE="${YEAR}${MONTH}${DAY}"
        FILE="sic_psn25_${DATE}_F17_v05r00.nc"
        echo "https://noaadata.apps.nsidc.org/NOAA/G02202_V5/north/daily/${YEAR}/${FILE}" >> "$LIST"
      fi
    done
  done
done