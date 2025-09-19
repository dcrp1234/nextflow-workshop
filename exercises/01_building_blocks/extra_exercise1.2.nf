#!/usr/bin/env nextflow
params.input = 'exercises/01_building_blocks/input.csv'


process readFrom {
    input:
    tuple val(sampleId), file(read1), file(read2)

    script:
    """
    echo "Printing" --sample $sampleId --reads $read1 $read2
    """
}


workflow {
    def input_ch = Channel.fromPath(params.input)
    def input_csv = input_ch.splitCsv(header:true).map{ row -> tuple(row.sampleId, file(row.forward_read), file(row.reverse_read))}
    input_csv.view()
    readFrom(input_csv)
}
