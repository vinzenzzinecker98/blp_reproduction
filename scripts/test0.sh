#!/bin/bash
source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate
timestamp() {
  date +"%d.%m.%Y - %T - starting job:" # current time
}
timestamp
echo 'this is a test'
timestamp