package basicfiles.authz

default allow := false

allow if {
    input.user.role == "admin"
}

allow if {
    input.action == "read"
    input.resource.owner == input.user.id
}
