import FWCore.ParameterSet.Config as cms
loadFiles = cms.untracked.vstring()
seclFiles = cms.untracked.vstring()
source = cms.Source('PoolSource', fileNames = loadFiles, secondaryFileNames = seclFiles)
loadFiles.extend( [
'file:/home/ltsai/Data/pileupFile1.root',
'file:/home/ltsai/Data/pileupFile2.root' ] );
seclFiles.extend( [
] );
