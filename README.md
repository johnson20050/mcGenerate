These are files generating MC from pythia8 in CMSSW @ 13TeV ( mainly for 2016 Data )


Use mcGenerateStep1.sh, codes are in workspaceStep1
step1 : Gen-Sim : using CMSSW_7_1_25_patch5

Use mcGenerateStep23.sh codes are in workspaceStep23
step23: Raw2Digi-HLT-Digi2Raw-RECO : using CMSSW_8_0_14

usefulScripts/ :
    this folder collects all scripts you may need. 
    Including checking the content of the output files, the code to generate by lots of CPU.
    And so on.

GeneraterFileList/ :
    this folder owns the CMSSW format, which can be recgnized in CMSSW.
    it records the file list for generated files in step1.
    If you want to run step2,3 locally, you can edit this and load this files in python file.

GeneratorInterface/ :
    EvtGenInterface/ folder records the decay files formally. Please do not edit this folder
    ExternalDecays/ folder records user personal decay files. All you need to change is this file.
    What you can do is 1. edit the decay mode. 2. edit particle mass and width.
    There is possibility to edit the spin and charge. But I haven't found the option.

Configuration/ :
    This folder records the genFragment files used in pythia8.
    You need to input python files into mcGenerate.sh to get each step files.
    And this file records which formal decay list you want, which personal decay files you want.
    And the filter you need.
    There are some advanced options in this file. But I think it needs to mail MC contacts to edit it.
