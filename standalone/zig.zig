const std = @import("std");

pub fn main() !void {
    const status: enum { todo, doing, done } = .doing;
    try std.io.getStdOut().writer().print("{s}\n", .{@tagName(status)});
}
