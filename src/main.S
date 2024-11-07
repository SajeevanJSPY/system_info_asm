	.section .data

vendor_str: .space 13

	.section .text
	.global _start
_start:
	// processor information
	mov $0, %rax
	cpuid
	mov %ebx, vendor_str
	mov %edx, vendor_str + 4
	mov %ecx, vendor_str + 8
	movb $0, vendor_str + 12

print_message:
	mov $1, %rax
	mov $1, %rdi
	lea vendor_str(%rip), %rsi
	mov $12, %rdx
	syscall

	// exit syscall
	mov $60, %rax
	xor %rdi, %rdi
	syscall

