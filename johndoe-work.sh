# John Doe's work - Add py script and chart
cd remote-repo
git checkout master
echo "import numpy as np" > analysis.py
touch analysis_income.png
git add .
git commit -m "Add analysis script and chart" --author "John Doe <jdoe@example.com>"
git checkout HEAD~0 # Switch to detached head before exit
cd ..