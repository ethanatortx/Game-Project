/// scrUpdateTimeTrack(id, frequency, duration, px, py, ph)

var stackid = argument0;
var freq, len;
freq = argument1;
len = argument2;
var arg_push_const = 3;
var max_index = freq*len*arg_push_const;
var px, py, ph;
px = argument3;
py = argument4;
ph = argument5;
var stack_len = ds_stack_size(stackid);

while(stack_len >= (max_index))
{
    ds_stack_pop(stackid);
    stack_len = ds_stack_size(stackid);
}

scrTrimTimeStack(stackid, arg_push_const);

ds_stack_push(stackid, px, py, ph);
