version 1.0

import "../tasks/dipdiff.wdl" as dipdiff_t

workflow structuralVariantsDenovoAssembly {

    input {
        File referenceFile
        File assemblyHap1
        File assemblyHap2
		Int minSvSize = 30
        Int threads = 32
    }

	### dipdiff
	call dipdiff_t.dipdiff_t as dipdiff_t {
		input:
			threads=threads,
			reference=referenceFile,
			ctgsPat=assemblyHap1,
			ctgsMat=assmeblyHap2,
			minSvSize=minSvSize
	}

	output {
		File vcfUnphased = dipdiff_t.dipdiffUnphasedVcf
		File vcfPhased = dipdiff_t.dipdiffPhasedVcf
	}
}
