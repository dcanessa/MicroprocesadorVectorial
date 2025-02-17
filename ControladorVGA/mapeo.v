module mapeo (address_VGA, data_mem, VGA_value);
input [16:0] address_VGA;
input [31:0] data_mem;
output reg [7:0] VGA_value;




reg [1:0] cont;

always @(address_VGA)
	begin 
		case (cont)
		2'd0 : 
			begin
				cont = cont + 1;
				VGA_value = data_mem[7:0];
			end
		2'd1 : 
			begin
				cont = cont + 1;
				VGA_value = data_mem[15:8];
			end
		2'd2 : 
			begin
				cont = cont + 1;
				VGA_value = data_mem[23:16];
			end
		2'd3 : 
			begin
				cont = 0;
				VGA_value = data_mem[31:24];
			end
		default:
			begin
				cont = 0;
				VGA_value = data_mem[31:24];
			end
		endcase
	end

 initial begin
     cont = 0;
  end

endmodule 