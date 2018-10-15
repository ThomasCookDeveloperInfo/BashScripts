echo "Starting Service Dump"

adb </dev/null shell "dumpsys -l" > serviceList.txt

echo "Created serviceList.txt file"

while read p; do
  if ((counter > 0)); then
     echo "Dumping service $p to $p.txt"
     adb </dev/null shell "dumpsys $p" > $p.txt
  fi
  let counter++
done < serviceList.txt
