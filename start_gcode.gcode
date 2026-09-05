;Nozzle diameter = [nozzle_diameter]
;Filament type = [filament_type]
;Filament name = [filament_vendor] 
;Filament weight = [filament_density]
M118 Plate selected: {curr_bed_type}
M118 Plate bed temp: [bed_temperature_initial_layer_single]
{if curr_bed_type=="Textured PEI Plate"}
    SET_GCODE_OFFSET Z=-0.03
    RESPOND MSG="Plate : Textured PEI | Offset : -0.03"
{elsif curr_bed_type=="Textured Cool Plate"}
    SET_GCODE_OFFSET Z=0.0
    RESPOND MSG="Plate : Textured Cool Plate | Offset : 0.0"
{else}
    RESPOND TYPE=error MSG="ERREUR : Plate '{curr_bed_type}' non authorized."
    CANCEL_PRINT
{endif}
PRINT_START BED_TEMP=[bed_temperature_initial_layer_single] EXTRUDER_TEMP=[nozzle_temperature_initial_layer] AREA_START={first_layer_print_min[0]},{first_layer_print_min[1]} AREA_END={first_layer_print_max[0]},{first_layer_print_max[1]} BED_HEAT_SOAK_MINUTES=0 BED_MESH=adaptive
