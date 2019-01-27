#!/usr/bin/env sh

# automatically gen MC fragment

#fileName:
if [ "${1}" != "" ]; then
    targetPy="${1}"
else
    echo "you need to input a file"
    exit
    #targetPy="Configuration/GenProduction/python/LbJpsiKP.py"
fi

#number of event
num=100000





### STEP1: GEN-SIM
echo "1"
#cmsDriver.py ${targetPy} --fileout file:step1.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1  --no_exec -n ${num}


# 8_0_14
#### STEP2: DIGI + PU mixing + HLT
echo "2"
cmsDriver.py ${targetPy} --filein file:step1.root --fileout file:step2.root --pileup_input /home/ltsai/Data/pileupFile1.root --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 80X_mcRun2_asymptotic_v14 --step DIGIPREMIX_S2,DATAMIX,L1,DIGI2RAW,HLT:25ns10e33_v2 --nThreads 3 --datamix PreMix --era Run2_2016  --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n -1
#
#
#### STEP3: RECO (or AOD, --eventcontent AOD)
echo "3"

cmsDriver.py $targetPy --filein file:step2.root --fileout file:step3.root --mc --eventcontent AODSIM,DQM --runUnscheduled --datatier AODSIM,DQMIO --conditions 80X_mcRun2_asymptotic_v14 --step RAW2DIGI,RECO,EI,DQM:DQMOfflinePOGMC --nThreads 4 --era Run2_2016  --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n -1



