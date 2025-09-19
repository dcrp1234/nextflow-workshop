#!/usr/bin/env nextflow

params.reads = "${launchDir}/data/*{1,2}.fq.gz"

/**
 * Quality control fastq
 */
    
process fastqc {
    // container 'quay.io/biocontainers/fastqc:0.11.9--0'

    input:
    tuple val(sample), file(read1) 
    
    script:
    """
    fastqc ${read1}
    """
}

workflow {
    def reads_ch = Channel
        .fromFilePairs( params.reads, checksIfExists:true )
        .view()
    fastqc(reads_ch)
}