**Repository for HubSpot API code.**

This repository has a separate subdirectory for each component of the solution as follows:

\\batch (HubSpot API batch files)

\\doc (documentation)

\\HUBSPOT_API (MS Visual Studio solution files)
  
\\MSSQL (MSSQL scripts to build the HUBSPOT database, including data for static tables)
  
\\SSIS (SSIS packages and supporting files that generate the data for the HubSpot upload)
  Neptune
  NeptuneCRM
  TritonCelerity
  TritonCelerity_ENews
  HubSpotAPI


The G: drive folder structure supporting the SSIS packages has been revised and simplified as follows:

G:\\
+--Marine
   +--Neptune
   |  +--data
   |     +--Archive
   |     +--FullLoad
   +--NeptuneCRM
   |  +--data
   |     +--Archive
   |     +--FullLoad
   +--MarineCRM 
   |  +--HUBSPOT
   +--Triton
      +--data
      |  +--Archive
      |  +--FullLoad
      +--Batch_files



