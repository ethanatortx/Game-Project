/// scrTrimTimeStack(id, arg_count)

var stackid = argument0;
var arg_count = argument1;
var stack_len = ds_stack_size(stackid);

while(stack_len % arg_count != 0)
{
    ds_stack_pop(stackid);
    stack_len = ds_stack_size(stackid);
}
