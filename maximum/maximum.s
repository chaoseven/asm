.section .data

data_items:
	.long 3,67,34,221,45,75,54,34,44,225,22,11,66,0
.equ length, (.-data_items)>>2
.section .text

.globl _start
_start:
	movl $0,%edi
	movl data_items(,%edi,4),%eax
	movl %eax,%ebx

start_loop:
	cmpl $length,%edi
	je loop_exit
	incl %edi
	movl data_items(,%edi,4),%eax
	cmpl %ebx,%eax
	jle start_loop
	movl %eax,%ebx
	jmp start_loop

loop_exit:
	movl $1,%eax
	int $0x80
	
