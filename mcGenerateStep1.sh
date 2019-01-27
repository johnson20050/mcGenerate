#!/usr/bin/env sh
# usage:
#   ./mcGenerateStep1.sh Con Configuration/GenProduction/python/LbToPcK.py

num=50000
### STEP1: GEN-SIM
echo "$1"
cmsDriver.py $1 --fileout file:step1.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1  --no_exec -n ${num}



