/// scrCreateTimeTrackGrid(length)

// argument0 -- length:
//  The length of time in seconds to hold before deleting extraneous records
// argument1 -- frequency:
//  The amount of time per seconds to snapshot and store instance position

// This frequently uses glogal delta commands to create consistent
//      position tracking -- make sure a delta time scale object exists
//      to handle delta calculations
