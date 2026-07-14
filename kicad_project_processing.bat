mkdir output
mkdir GERBERS
mkdir FILES
kicad-cli sch erc --severity-error --exit-code-violations .\line_electrodes\line_electrodes.kicad_sch 
kicad-cli sch export pdf -b --output .\output\FILES\sch.pdf .\line_electrodes\line_electrodes.kicad_sch
kicad-cli sch export bom --output .\output\FILES\bom.csv .\line_electrodes\line_electrodes.kicad_sch 
kicad-cli pcb drc --schematic-parity --refill-zones --severity-error --exit-code-violations .\line_electrodes\line_electrodes.kicad_pcb
kicad-cli pcb export gerbers --layers "F.Cu,B.Cu,F.Paste,B.Paste,F.Mask,B.Mask,F.Silkscreen,B.Silkscreen,Edge.Cuts" --use-drill-file-origin --output .\output\GERBERS\ .\line_electrodes\line_electrodes.kicad_pcb
kicad-cli pcb export drill --excellon-separate-th --drill-origin plot --output .\output\GERBERS\ .\line_electrodes\line_electrodes.kicad_pcb
kicad-cli pcb export step .\line_electrodes\line_electrodes.kicad_pcb