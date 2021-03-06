\name{MEDIPS.createSet}
\alias{MEDIPS.createSet}
\alias{getMObjectFromWIG}
\alias{readRegionsFile}
\alias{getPairedGRange}
\alias{scanBamToGRanges}

\title{
Creates a MEDIPS SET by reading a suitable input file
}
\description{
Reads the input file and calculates genome wide short read coverage (counts) at the specified window size.
After reading of the input file, the MEDIPS SET contains information about the input file name, 
the dependent organism, the chromosomes included in the input file, the length of the included chromosomes (automatically loaded), and the number of regions. 
}
\usage{
MEDIPS.createSet(file=NULL, extend=0, shift=0, window_size=300, BSgenome=NULL, uniq=1e-3, chr.select=NULL, paired = F, sample_name=NULL, isSecondaryAlignment = FALSE, simpleCigar=TRUE)
}
\arguments{
   \item{file}{
Path and file name of the input data
}
  \item{BSgenome}{
The reference genome name as defined by BSgenome 
}
  \item{extend}{
defines the number of bases by which the region will be extended before the genome vector is calculated.
Regions will be extended along the plus or the minus strand as defined by their provided strand information.
}
\item{shift}{
As an alternative to the extend parameter, the shift parameter can be specified. Here, the reads are not extended but shifted by the specified number of nucleotides with respect to the given strand infomation.
One of the two parameters extend or shift has to be 0. 
}
\item{uniq}{
The uniq parameter determines, if all reads mapping to exactly the same genomic position should be kept (uniq = 0), replaced by only one representative (uniq = 1), or if the number of stacked reads should be capped by a maximal number of stacked reads per genomic position determined by a poisson distribution of stacked reads genome wide and by a given p-value (1 > uniq > 0) (deafult: 1e-3). The smaller the p-value, the more reads at the same genomic position are potentially allowed.
}
\item{chr.select}{
only data at the specified chromosomes will be processed.
}
\item{window_size}{
defines the genomic resolution by which short read coverage is calculated. 
}
\item{paired}{
option for paired end reads
}
\item{sample_name}{
name of the sample to be stored with the MEDIPS SET.
}
\item{isSecondaryAlignment}{
option to import only primary alignments.
}
\item{simpleCigar}{
option to import only alignments with simple Cigar string.
}
}
\value{
An object of class MEDIPSset.
}
\author{
Lukas Chavez, Mathias Lienhard, Isaac Lopez Moyado
}
\examples{

library("BSgenome.Hsapiens.UCSC.hg19")
bam.file.hESCs.Rep1.MeDIP = system.file("extdata", "hESCs.MeDIP.Rep1.chr22.bam", package="MEDIPSData")

MSet=MEDIPS.createSet(file=bam.file.hESCs.Rep1.MeDIP, BSgenome="BSgenome.Hsapiens.UCSC.hg19", chr.select="chr22", extend=250, shift=0, uniq=1e-3)

}
