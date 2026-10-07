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
PRINT_START BED_TEMP=[bed_temperature_initial_layer_single] EXTRUDER_TEMP=[nozzle_temperature_initial_layer] AREA_START={first_layer_print_min[0]},{first_layer_print_min[1]} AREA_END={first_layer_print_max[0]},{first_layer_print_max[1]} BED_HEAT_SOAK_MINUTES=0 BED_MESH=adaptive PURGE_LENGTH=50 PURGE_AMOUNT=24 PURGE_FLOW_RATE=6 PURGE_RETRACT=0.8 PURGE_UNRETRACT=0.7
