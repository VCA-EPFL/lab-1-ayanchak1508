import Vector::*;

typedef Bit#(16) Word;

function Vector#(16, Word) naiveShfl(Vector#(16, Word) in, Bit#(4) shftAmnt);
    Vector#(16, Word) resultVector = in; 
    for (Integer i = 0; i < 16; i = i + 1) begin
        Bit#(4) idx = fromInteger(i);
        resultVector[i] = in[shftAmnt+idx];
    end
    return resultVector;
endfunction


function Vector#(16, Word) barrelLeft(Vector#(16, Word) in, Bit#(4) shftAmnt);
    Vector#(5, Vector#(16, Word)) temp;

    temp[0] = in;
    for(Integer i = 1; i < 5; i = i + 1) begin
        temp[i] = (shftAmnt[i-1] == 1) ? naiveShfl(temp[i-1], 1 << (i-1)) : temp[i-1];
    end
    return temp[4];

endfunction
