.intel_syntax noprefix
.text
.global is_prime
is_prime:		# int is_prime (int num) ;
# fuggveny prologus : start
push ebp
mov ebp, esp
# fuggveny prologus : end
push ebx			#konvencio

mov ecx, 1 			# i "valtozo" inicializalasa - counter register

mov eax, [ebp + 8]	# az input az eax regiszterben

mov ebx, 0			# sum(osztok szama) "valtozo" inicializalasa  - base register

# for : start
loop:
	cmp ecx, eax		
	jg vege

	push ebx			# sum "elmentese"
	push eax			# input "elmentese"

	mov edx, 0			# maradekot 0-ra allaitjuk
	mov ebx, ecx		# ebx(osztó) = ecx(counter)
	mov eax, [ebp + 8]	# osztandó(input)
	div ebx				# osztas -> eax = hanyados edx = maradek

	pop eax				#visszaallitom amit elmentettem
	pop ebx

	inc ecx				# "i++"
	cmp edx, 0			# ha a maradek 0 goto osztocount, else "continue"
	je osztocount
	jmp loop

osztocount:
	inc ebx				# "sum++" - növeljük az osztók számát
	jmp loop

vege:					# "vege a for-nak"
	cmp ebx, 2
	je igaz
	jmp hamis

igaz:
	mov eax, 1			#ha 2 osztoja volt return 1
	jmp end

hamis:
	mov eax, 0			#else return 0
	jmp end

end:
	pop ebx				# visszaallitjuk az ebx erteket

# fuggveny epilogus : start
mov esp, ebp
pop ebp
# fuggveny epilogus : end
ret