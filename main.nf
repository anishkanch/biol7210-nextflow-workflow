#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { FASTP        } from './modules/nf-core/fastp/main'
include { SPADES       } from './modules/nf-core/spades/main'
include { SEQKIT_STATS } from './modules/nf-core/seqkit/stats/main'

workflow {
    def meta = [id: 'sample', single_end: false]

    reads_ch = Channel.of([meta, [file(params.read1), file(params.read2)]])
   
    FASTP(reads_ch.map { m, reads -> [m, reads, []] }, false, false, false)

    SPADES(FASTP.out.reads.map { m, reads -> [m, reads, [], []] }, [], [])

    SEQKIT_STATS(FASTP.out.reads)
}
	
