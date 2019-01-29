.section .data

.section .text

.globl _start
_start:
	pushl $5
	call factorial

	movl $1,%eax
	int $0x80

.type factorial,@function
factorial:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%ebx
	movl 8(%ebp),%ecx

factorial_loop_start:
	cmpl $1,%ecx
	je factorial_loop_end
	decl %ecx
	imull %ecx,%ebx
	jmp factorial_loop_start

factorial_loop_end:
	movl %ebx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
