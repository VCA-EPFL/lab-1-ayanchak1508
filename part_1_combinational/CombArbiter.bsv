import Vector::*;

typedef struct {
 Bool valid;
 Bit#(31) data;
 Bit#(4) index;
} ResultArbiter deriving (Eq, FShow);

function ResultArbiter arbitrate(Vector#(16, Bit#(1)) ready, Vector#(16, Bit#(31)) data);
	ResultArbiter result = ResultArbiter{valid: False, data: 0, index: 0};
	for(Integer i = 0; i < 16; i = i + 1) begin
		if(!result.valid && (ready[i] == 1'b1)) result = ResultArbiter{valid: True, data: data[i], index: fromInteger(i)};
	end
	return result;
endfunction

