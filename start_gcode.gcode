;Nozzle diameter = [nozzle_diameter]
;Filament type = [filament_type]
;Filament name = [filament_vendor] 
;Filament weight = [filament_density]
M118 Plate selected: {curr_bed_type}
M118 Plate bed temp: [bed_temperature_initial_layer_single]
{local plate_offset = curr_bed_type=="Textured PEI Plate" ? -0.03 : 0.0}
{local filament_offset = filament_type[0]=="TPU" ? 0.09 : 0.0}
{local total_offset = plate_offset + filament_offset}
{if !(curr_bed_type=="Textured PEI Plate" || curr_bed_type=="Textured Cool Plate") || !(filament_type[0]=="PLA" || filament_type[0]=="TPU")}
    RESPOND TYPE=error MSG="ERREUR : Plate '{curr_bed_type}' ou filament '{filament_type[0]}' non authorized."
    CANCEL_PRINT
{endif}
SET_GCODE_OFFSET Z={total_offset}
RESPOND MSG="Plate : {curr_bed_type} | Filament : {filament_type[0]} | Offset : {total_offset}"
PRINT_START BED_TEMP=[bed_temperature_initial_layer_single] EXTRUDER_TEMP=[nozzle_temperature_initial_layer] PROBE_TEMP=160 PROBE_HEAT_SOAK_MINUTES=3 BED_HEAT_SOAK_MINUTES=0 BED_MESH=adaptive KAMP_PARK=disabled RIGHT_PURGE=disabled LEFT_PURGE=enabled TEMP_Z_OFFSET_BOTTOM=60 TEMP_Z_OFFSET_TOP=160 TEMP_Z_OFFSET_HEIGHT=0.09
