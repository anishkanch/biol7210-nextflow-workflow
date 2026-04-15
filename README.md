# BIOL7210 Nextflow Workflow

Nextflow pipeline for QC, assembly, and read stat using fastp, SPAdes, and SeqKit.

## Workflow Overview

![DAG](dag.png)

- **Module 1 (fastp)**: QC and trim raw reads
- **Module 2 (SPAdes)**: Assemble trimmed reads
- **Module 3 (SeqKit Stats)**: Compute read statistics

- Module 2 and 3 run in parallel 

## Requirements

- Nextflow: v25.10.4
- Conda: v26.1.1
- OS: macOS (arm64)

## Test Data

Paired-end Illumina reads from *Staphylococcus aureus* (most well known genome, SRR1972917), trimmed to 25,000 reads.
Located in `test_data/`.

## Usage

```bash
conda activate nf

nextflow run main.nf -profile conda \
    --read1 test_data/sample_R1.fastq.gz \
    --read2 test_data/sample_R2.fastq.gz \
    --outdir results
```

## Output

Results are saved to `results/`.
