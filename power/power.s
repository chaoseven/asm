#purpose: calculate 3^2 + 4^2

.section .data

.section .text

.globl _start
_start:
	pushl $2
	pushl $3
	call power
	addl $8,%esp

	pushl %eax

	pushl $2
	pushl $4
	call power
	addl $8,%esp

	popl %ebx
	addl %eax,%ebx
	
	movl $1,%eax
	int $0x80

.type power,@function

power:
	pushl %ebp
	movl %esp,%ebp
	
	subl $4,%esp

	movl 8(%ebp),%ebx
	movl 12(%ebp),%ecx

	movl %ebx,-4(%ebp)

power_loop_start:
	cmpl $1,%ecx
	je power_loop_end
	movl -4(%ebp),%eax
	imull %ebx,%eax
	movl %eax,-4(%ebp)
	decl %ecx
	jmp power_loop_start

power_loop_end:
	movl -4(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	ret
