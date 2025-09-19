def readcsv = Channel.fromPath("exercises/01_building_blocks/input.csv").splitCsv(header:true)

def tuple1 = readcsv.map{ row -> tuple(row.sampleId, file(row.forward_read))}
def tuple2 = readcsv.map{ row -> tuple(row.sampleId, file(row.reverse_read))}
readcsv.view()
tuple1.view()
tuple2.view()