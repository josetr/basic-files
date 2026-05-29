# @version ^0.3.10

event StatusChanged:
    operator: indexed(address)
    status: uint256

status: public(HashMap[address, uint256])

@external
def set_status(status: uint256):
    assert status > 0, "status must advance"
    self.status[msg.sender] = status
    log StatusChanged(msg.sender, status)
