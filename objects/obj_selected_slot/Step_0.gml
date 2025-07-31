var ind = min(global.pointer, array_length(global.memory) - 1)
var target_instance = global.slot_instances[ind];
x = lerp(x, target_instance.x, 0.5);
y = lerp(y, target_instance.y, 0.5);

