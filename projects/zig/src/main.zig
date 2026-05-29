const std = @import("std");

const Status = enum { todo, doing, done };

const Task = struct {
    title: []const u8,
    status: Status,
};

pub fn main() !void {
    const tasks = [_]Task{
        .{ .title = "Add Zig fixture", .status = .doing },
        .{ .title = "Check syntax colors", .status = .todo },
    };

    var counts = std.EnumMap(Status, usize).init(.{});
    for (tasks) |task| {
        counts.put(task.status, (counts.get(task.status) orelse 0) + 1);
    }

    std.debug.print("{any}\n", .{counts});
}
