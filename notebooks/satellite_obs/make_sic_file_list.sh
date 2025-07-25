#!/bin/bash

# Output file for the list of URLs
LIST="sic_file_list.txt"
> "$LIST"

# Loop through years and months
for YEAR in {2014..2024}; do
  for MONTH in 08 09 10 11 12; do
    # Generate days for this month
    for DAY in $(seq -w 1 31); do
      # Use GNU date to validate the date
      if date -d "$YEAR-$MONTH-$DAY" >/dev/null 2>&1; then
        DATE="${YEAR}${MONTH}${DAY}"
        FILE="sic_psn25_${DATE}_F17_v05r00.nc"
        echo "https://noaadata.apps.nsidc.org/NOAA/G02202_V5/north/daily/${YEAR}/${FILE}" >> "$LIST"
      fi
    done
  done
done

