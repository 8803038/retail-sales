#!/bin/bash
set -e
python3 -m venv venv
source venv/bin/activate
pip install -r requirements
curl -o data/raw/online_retail_II.xlsx https://archive.ics.uci.edu/ml/machine-learning-databases/00502/online_retail_II.xlsx
echo "Setup complete"
