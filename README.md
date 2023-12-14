# final_project-rosenbaumge
Final project for BINF6308

# Author Information
Gracie Rosenbaum; NUID 001474752; GitHub ID rosenbaumge; email rosenbaum.g@northeastern.edu <br/>
Species selected: Rhodobacter spheroides

# Introduction
## Goal
The ultimate purpose of this project is to hypothesize the function of proteins, beginning from DNA-seq and RNA-seq data. At each step, the goals are to reformat and analyze data for the next part of the pipeline. Specifically, genomes are assembled, transcriptomes are assembled, sequences of predicted proteins are annotated, and the functions themselves are identified.

## Inputs
DNA-seq and RNA-seq data must be inputted, specifically through their NCBI SRA ascession numbers. This project authomatically uses the data for B. subtilis to run.

## Tools and Resources
1. BLAST (Basic Local Alignment Search Tool): "finds regions of local similarity between sequences."[1] 
2. GSNAP (Genomic Short-read Nucleotide Alignment Program): "a tool to align single- and paired-end reads to a reference genome" [2]
3. hmmscan: tool for "biosequence analysis using profile hidden Markov Models" [3]
4. InterProScan: "combines different protein signature recognition methods into one resource" [4] 
5. QUAST (Quality Assessment Tool for Genome Assemblies): "a quality assessment tool for evaluating and comparing genome assemblies" [5]
6. SAMtools (Sequence Alignment/Map Tools): a tool for "analyzing high-throughput sequencing data" [6]
7. SPAdes: "assembler for both single-cell and standard (multicell) assembly... generates single-cell assemblies, providing information about genomes of uncultivatable bacteria that vastly exceeds what may be obtained via traditional metagenomics studies" [7]
8. SRA-toolkit (Sequence Reads Archives tools): "generates loading and dumping tools with their respective libraries for building new and accessing existing runs" [8]
9. Transdecoder: "identifies candidate coding regions within transcript sequences, such as those generated by de novo RNA-Seq transcript assembly using Trinity, or constructed based on RNA-Seq alignments to the genome" [9]
10. trimmomatic: "a flexible read trimming tool for Illumina NGS data" [10]
11. Trinity: "fully reconstructs a large fraction of the transcripts present in... data, also reporting alternative splice isoforms and transcripts from recently duplicated genes" [11]

## Expected Output
The four steps of the process will each output a different dataset. The data should go from the input into assemblies (as fastas), through transcriptome assembly (again via fastas and a reference genome, as well as a quality report and sam file with alignment information), into gene annotation (to get predicted protein products), to finally receive text files of predicted protein information.

# Steps
## 1: Genome Assembly
### Goal
Once the ascession input has been made, this step ensures that the DNA-seq data is received from the NCBI SRA (sequence read archive) and trimmed for quality. The final assembly is also tested for quality.
### Inputs
These scripts use data from Bacillus subtilis sequencing, meaning that getNGS.sh and sbatch_assembleGenome have the accession number SRR22271830 hardcoded in. The data input from this value means that DNA-seq files (in fastq) can be accessed. 
### Tools and Resources
1. SRA-toolkit [8]
2. Trimmomatic [10]
3. SPAdes [7]
4. QUAST [5]
Details for each tool are recorded in the introduction.
### Parameters
SRA-toolkit
- vdb-config –prefetch-to-cwd: bring files to current working directory <br/>
- prefetch SRR22271830: specifies the accession number to fetch <br/>
- fasterq-dump –split-3 SRR22271830: mate pair split; move unpaired sequences to a new file; all with the speciied accession number <br/>

Trimmomatic
- PE: paired-end settings <br/>
- phred-33: quality score in Phred-33 format <br/>
- HEADCROP:0: no lead base pairs trimmed <br/>
- SLIDINGWINDOW:4:30: sliding window size with quality mean minimum within the window <br/>
- MINLEN:36: mimumum length of read <br/>
- ILLUMINACLIP: identifies path to adapters <br/>
- LEADING:20 and TRAILING:20: eliminates base pairs at the beginning and end of the sequence if below threshold quality <br/>

SPAdes
- -1 and -2: path to input files (the 1st and 2nd mate pairs) <br/>
- -o: output file location <br/>

QUAST
- -o: output file location <br/>

### Expected Output
A fasta file of a genome assembly (from the contigs provided) and a text file of QUAST output (the quality check) are expected.

## 2: Transcriptome Assembly
### Goal
Following genome assembly, a transcriptome of the organism is produced from RNA-seq data and analyzed for quality. 
### Inputs
This step requires organized RNA-seq data, specifically in a fastq file and organized into paired reads. getRNAseq.sh is able to take in and organize this data as needed.
### Tools and Resources
1. SRA-toolkit [8]
2. Trimmomatic [10]
3. GSNAP [2]
4. Trinity [11]
5. SAMtools [6]
Details for each tool are recorded in the introduction.
### Expected Output
A reference genome of the organism, assembled transcriptome, and the quality analysis should all be output from this step.

## 3: Annotation
### Goal
Once the genes have been compiled from steps 1 and 2, they must be annotated so that the products of the proteins in these sequences can be determined and output by the end.
### Inputs
All of the data for this step should have been determined via steps 1 and 2. Speciiccally, it needs the assembled transcriptome.
### Tools and Resources
1. BLAST [1]
2. hmmscan [3]
3. Transdecoder [9]
Details for each tool are recorded in the introduction.
### Expected Output
A text file of predicted proteins should be output. The data should analyze the information received from the transcriptome (step 2) in a readable format.

## 4: Protein Function Prediction
### Goal
The final step is meant to wrap up the process by determining the functions of the proteins found in Step 3. Specifically, it expresses the data detailing domains, gene ontology (GO), and pathways.
### Inputs
Again, the data for this step is determined by the former. The list of predicted proteins should have been made in step 2.
### Tools and Resources
1. InterProScan [4]
### Expected Output
The domains, GOs, and pathways should each be expressed in their own text files.

# References
[1] NCBI. (2023). BLAST: Basic Local Alignment Search Tool. Nih.gov. https://blast.ncbi.nlm.nih.gov/Blast.cgi <br/>
[2] Tammi, Dr. M. T. (n.d.). GSNAP. Bioinformaticshome.com. Retrieved December 13, 2023, from https://bioinformaticshome.com/tools/rna-seq/descriptions/GSNAP.html#gsc.tab=0 <br/>
[3] Finn, R. D., Clements, J., & Eddy, S. R. (2011). HMMER web server: interactive sequence similarity searching. Nucleic Acids Research, 39(suppl), W29–W37. https://doi.org/10.1093/nar/gkr367 <br/>
[4] Jones, P., Binns, D., Chang, H.-Y., Fraser, M., Li, W., McAnulla, C., McWilliam, H., Maslen, J., Mitchell, A., Nuka, G., Pesseat, S., Quinn, A. F., Sangrador-Vegas, A., Scheremetjew, M., Yong, S.-Y., Lopez, R., & Hunter, S. (2014). InterProScan 5: genome-scale protein function classification. Bioinformatics, 30(9), 1236–1240. https://doi.org/10.1093/bioinformatics/btu031 <br/>
[5] Gurevich, A., Saveliev, V., Vyahhi, N., & Tesler, G. (2013). QUAST: quality assessment tool for genome assemblies. Bioinformatics, 29(8), 1072–1075. https://doi.org/10.1093/bioinformatics/btt086 <br/>
[6] An Introduction to SAMtools: A Powerful Tool for A - Pluto Bioinformatics. (n.d.). Pluto.bio. Retrieved December 13, 2023, from https://pluto.bio/blog/intro-to-samtools <br/>
[7] Bankevich, A., Nurk, S., Antipov, D., Gurevich, A. A., Dvorkin, M., Kulikov, A. S., Lesin, V. M., Nikolenko, S. I., Pham, S., Prjibelski, A. D., Pyshkin, A. V., Sirotkin, A. V., Vyahhi, N., Tesler, G., Alekseyev, M. A., & Pevzner, P. A. (2012). SPAdes: A New Genome Assembly Algorithm and Its Applications to Single-Cell Sequencing. Journal of Computational Biology, 19(5), 455–477. https://doi.org/10.1089/cmb.2012.0021 <br/>
[8] Lesson 6: Downloading data from the SRA - Bioinformatics for Beginners 2022. (n.d.). Bioinformatics.ccr.cancer.gov. https://bioinformatics.ccr.cancer.gov/docs/b4b/Module1_Unix_Biowulf/Lesson6/ <br/>
[9] Presa, E. (2023, February 4). Predict Coding Regions with TransDecoder. BioBam. https://www.biobam.com/transdecoder-predicting-coding-regions-within-transcripts/ <br/>
[10] Bolger, A. M., Lohse, M., & Usadel, B. (2014). Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics, 30(15), 2114–2120. https://doi.org/10.1093/bioinformatics/btu170 <br/>
[11] Grabherr, M. G., Haas, B. J., Yassour, M., Levin, J. Z., Thompson, D. A., Amit, I., Adiconis, X., Fan, L., Raychowdhury, R., Zeng, Q., Chen, Z., Mauceli, E., Hacohen, N., Gnirke, A., Rhind, N., di Palma, F., Birren, B. W., Nusbaum, C., Lindblad-Toh, K., & Friedman, N. (2011). Full-length transcriptome assembly from RNA-Seq data without a reference genome. Nature Biotechnology, 29(7), 644–652. https://doi.org/10.1038/nbt.1883 <br/>
