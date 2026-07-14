mkdir circ_output
mkdir GERBERS
mkdir FILES
kicad-cli sch erc --severity-error --exit-code-violations .\circular_electrodes\circular_electrodes.kicad_sch 
kicad-cli sch export pdf -b --output .\circ_output\FILES\sch.pdf .\circular_electrodes\circular_electrodes.kicad_sch
kicad-cli sch export bom --output .\circ_output\FILES\bom.csv .\circular_electrodes\circular_electrodes.kicad_sch 
kicad-cli pcb drc --schematic-parity --refill-zones --severity-error --exit-code-violations .\circular_electrodes\circular_electrodes.kicad_pcb
kicad-cli pcb export gerbers --layers "F.Cu,B.Cu,F.Paste,B.Paste,F.Mask,B.Mask,F.Silkscreen,B.Silkscreen,Edge.Cuts" --use-drill-file-origin --output .\circ_output\GERBERS\ .\circular_electrodes\circular_electrodes.kicad_pcb
kicad-cli pcb export drill --excellon-separate-th --drill-origin plot --output .\circ_output\GERBERS\ .\circular_electrodes\circular_electrodes.kicad_pcb
kicad-cli pcb export step .\circular_electrodes\circular_electrodes.kicad_pcb