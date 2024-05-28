
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 50                	jle    7d <main+0x7d>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 a7 04 00 00       	call   4e3 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 6f 04 00 00       	call   4cb <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 3a 04 00 00       	call   4a3 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 9b 09 00 00       	push   $0x99b
  71:	6a 01                	push   $0x1
  73:	e8 98 05 00 00       	call   610 <printf>
      exit();
  78:	e8 26 04 00 00       	call   4a3 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 17 04 00 00       	call   4a3 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	56                   	push   %esi
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  9b:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9c:	eb 19                	jmp    b7 <cat+0x27>
  9e:	66 90                	xchg   %ax,%ax
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 80 0d 00 00       	push   $0xd80
  a9:	6a 01                	push   $0x1
  ab:	e8 13 04 00 00       	call   4c3 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 80 0d 00 00       	push   $0xd80
  c4:	56                   	push   %esi
  c5:	e8 f1 03 00 00       	call   4bb <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 78 09 00 00       	push   $0x978
  e4:	6a 01                	push   $0x1
  e6:	e8 25 05 00 00       	call   610 <printf>
      exit();
  eb:	e8 b3 03 00 00       	call   4a3 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 8a 09 00 00       	push   $0x98a
  f7:	6a 01                	push   $0x1
  f9:	e8 12 05 00 00       	call   610 <printf>
    exit();
  fe:	e8 a0 03 00 00       	call   4a3 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "x86.h"
#include "mmu.h"  // PGSIZE // Code added by Greg, Shawn, and Minh, Homework 6

char*
strcpy(char *s, const char *t)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 115:	31 c0                	xor    %eax,%eax
{
 117:	89 e5                	mov    %esp,%ebp
 119:	53                   	push   %ebx
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	89 c8                	mov    %ecx,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	53                   	push   %ebx
 148:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14e:	0f b6 01             	movzbl (%ecx),%eax
 151:	0f b6 1a             	movzbl (%edx),%ebx
 154:	84 c0                	test   %al,%al
 156:	75 19                	jne    171 <strcmp+0x31>
 158:	eb 26                	jmp    180 <strcmp+0x40>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 164:	83 c1 01             	add    $0x1,%ecx
 167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16a:	0f b6 1a             	movzbl (%edx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	38 d8                	cmp    %bl,%al
 173:	74 eb                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 175:	29 d8                	sub    %ebx,%eax
}
 177:	5b                   	pop    %ebx
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 3a 00             	cmpb   $0x0,(%edx)
 19d:	74 21                	je     1c0 <strlen+0x30>
 19f:	31 c0                	xor    %eax,%eax
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1af:	89 c1                	mov    %eax,%ecx
 1b1:	75 f5                	jne    1a8 <strlen+0x18>
    ;
  return n;
}
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	89 d7                	mov    %edx,%edi
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fe:	0f b6 10             	movzbl (%eax),%edx
 201:	84 d2                	test   %dl,%dl
 203:	75 16                	jne    21b <strchr+0x2b>
 205:	eb 21                	jmp    228 <strchr+0x38>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
 210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 214:	83 c0 01             	add    $0x1,%eax
 217:	84 d2                	test   %dl,%dl
 219:	74 0d                	je     228 <strchr+0x38>
    if(*s == c)
 21b:	38 d1                	cmp    %dl,%cl
 21d:	75 f1                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 228:	31 c0                	xor    %eax,%eax
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	31 f6                	xor    %esi,%esi
{
 23b:	53                   	push   %ebx
 23c:	89 f3                	mov    %esi,%ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
 241:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 244:	eb 33                	jmp    279 <gets+0x49>
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	8d 45 e7             	lea    -0x19(%ebp),%eax
 256:	6a 01                	push   $0x1
 258:	50                   	push   %eax
 259:	6a 00                	push   $0x0
 25b:	e8 5b 02 00 00       	call   4bb <read>
    if(cc < 1)
 260:	83 c4 10             	add    $0x10,%esp
 263:	85 c0                	test   %eax,%eax
 265:	7e 1c                	jle    283 <gets+0x53>
      break;
    buf[i++] = c;
 267:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 26b:	83 c7 01             	add    $0x1,%edi
 26e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 23                	je     298 <gets+0x68>
 275:	3c 0d                	cmp    $0xd,%al
 277:	74 1f                	je     298 <gets+0x68>
  for(i=0; i+1 < max; ){
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	89 fe                	mov    %edi,%esi
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7c cd                	jl     250 <gets+0x20>
 283:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 285:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 288:	c6 03 00             	movb   $0x0,(%ebx)
}
 28b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28e:	5b                   	pop    %ebx
 28f:	5e                   	pop    %esi
 290:	5f                   	pop    %edi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	8b 75 08             	mov    0x8(%ebp),%esi
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	01 de                	add    %ebx,%esi
 2a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	56                   	push   %esi
 2b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	6a 00                	push   $0x0
 2be:	ff 75 08             	pushl  0x8(%ebp)
 2c1:	e8 1d 02 00 00       	call   4e3 <open>
  if(fd < 0)
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	78 2b                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2cd:	83 ec 08             	sub    $0x8,%esp
 2d0:	ff 75 0c             	pushl  0xc(%ebp)
 2d3:	89 c3                	mov    %eax,%ebx
 2d5:	50                   	push   %eax
 2d6:	e8 20 02 00 00       	call   4fb <fstat>
  close(fd);
 2db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2de:	89 c6                	mov    %eax,%esi
  close(fd);
 2e0:	e8 e6 01 00 00       	call   4cb <close>
  return r;
 2e5:	83 c4 10             	add    $0x10,%esp
}
 2e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2eb:	89 f0                	mov    %esi,%eax
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fd:	eb e9                	jmp    2e8 <stat+0x38>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	53                   	push   %ebx
 308:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30b:	0f be 02             	movsbl (%edx),%eax
 30e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 311:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 314:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 319:	77 1a                	ja     335 <atoi+0x35>
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	89 c8                	mov    %ecx,%eax
 337:	5b                   	pop    %ebx
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 45 10             	mov    0x10(%ebp),%eax
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
 34e:	56                   	push   %esi
 34f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	85 c0                	test   %eax,%eax
 354:	7e 0f                	jle    365 <memmove+0x25>
 356:	01 d0                	add    %edx,%eax
  dst = vdst;
 358:	89 d7                	mov    %edx,%edi
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_create>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	83 ec 20             	sub    $0x20,%esp
  void *stack = malloc(PGSIZE*2);
 37b:	68 00 20 00 00       	push   $0x2000
 380:	e8 eb 04 00 00       	call   870 <malloc>
  if (stack == 0)
 385:	83 c4 10             	add    $0x10,%esp
 388:	85 c0                	test   %eax,%eax
 38a:	74 53                	je     3df <thread_create+0x6f>
 38c:	89 c3                	mov    %eax,%ebx
    return -1;
  if ((uint)stack % PGSIZE) {
 38e:	25 ff 0f 00 00       	and    $0xfff,%eax
 393:	75 23                	jne    3b8 <thread_create+0x48>
    stack = stack + (4096 - (uint)stack % PGSIZE);
  }
  int r = clone(start_routine, arg1, arg2, stack);
 395:	53                   	push   %ebx
 396:	ff 75 10             	pushl  0x10(%ebp)
 399:	ff 75 0c             	pushl  0xc(%ebp)
 39c:	ff 75 08             	pushl  0x8(%ebp)
 39f:	e8 9f 01 00 00       	call   543 <clone>
  if (r == -1)
 3a4:	83 c4 10             	add    $0x10,%esp
 3a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 3aa:	74 1c                	je     3c8 <thread_create+0x58>
    free(stack);
  return r;
}
 3ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3af:	c9                   	leave  
 3b0:	c3                   	ret    
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    stack = stack + (4096 - (uint)stack % PGSIZE);
 3b8:	29 c3                	sub    %eax,%ebx
 3ba:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 3c0:	eb d3                	jmp    395 <thread_create+0x25>
 3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(stack);
 3c8:	83 ec 0c             	sub    $0xc,%esp
 3cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ce:	53                   	push   %ebx
 3cf:	e8 0c 04 00 00       	call   7e0 <free>
 3d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 3d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(stack);
 3da:	83 c4 10             	add    $0x10,%esp
}
 3dd:	c9                   	leave  
 3de:	c3                   	ret    
    return -1;
 3df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3e4:	eb c6                	jmp    3ac <thread_create+0x3c>
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <thread_join>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_join() {
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	56                   	push   %esi
 3f8:	83 ec 20             	sub    $0x20,%esp
  // 
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 3fb:	6a 04                	push   $0x4
 3fd:	e8 6e 04 00 00       	call   870 <malloc>
  int pidThread = join(stack);
 402:	89 04 24             	mov    %eax,(%esp)
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 405:	89 c6                	mov    %eax,%esi
  int pidThread = join(stack);
 407:	e8 3f 01 00 00       	call   54b <join>
  if (pidThread != -1) {
 40c:	83 c4 10             	add    $0x10,%esp
 40f:	83 f8 ff             	cmp    $0xffffffff,%eax
 412:	74 12                	je     426 <thread_join+0x36>
    // if stack is not allocated correctly => free stack
    free(stack);
 414:	83 ec 0c             	sub    $0xc,%esp
 417:	89 45 f4             	mov    %eax,-0xc(%ebp)
 41a:	56                   	push   %esi
 41b:	e8 c0 03 00 00       	call   7e0 <free>
 420:	8b 45 f4             	mov    -0xc(%ebp),%eax
 423:	83 c4 10             	add    $0x10,%esp
  }

  return pidThread;
}
 426:	8b 75 fc             	mov    -0x4(%ebp),%esi
 429:	c9                   	leave  
 42a:	c3                   	ret    
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <lock_init>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_init(lock_t * lock) {
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 43a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 440:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <lock_aquire>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_aquire(lock_t * lock) {
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 455:	ba 01 00 00 00       	mov    $0x1,%edx
void lock_aquire(lock_t * lock) {
 45a:	89 e5                	mov    %esp,%ebp
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
    __asm__ volatile("lock; xaddl %0, %1"
 45f:	f0 0f c1 10          	lock xadd %edx,(%eax)
  int myTurn = fetch_and_add(&lock->ticket, 1);
  while(lock->turn != myTurn)
 463:	3b 50 04             	cmp    0x4(%eax),%edx
 466:	74 12                	je     47a <lock_aquire+0x2a>
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
    __sync_synchronize();
 470:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  while(lock->turn != myTurn)
 475:	39 50 04             	cmp    %edx,0x4(%eax)
 478:	75 f6                	jne    470 <lock_aquire+0x20>
}
 47a:	5d                   	pop    %ebp
 47b:	c3                   	ret    
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000480 <lock_release>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_release(lock_t * lock) {
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 485:	b8 01 00 00 00       	mov    $0x1,%eax
void lock_release(lock_t * lock) {
 48a:	89 e5                	mov    %esp,%ebp
 48c:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 48f:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
 494:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    

0000049b <fork>:
 49b:	b8 01 00 00 00       	mov    $0x1,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <exit>:
 4a3:	b8 02 00 00 00       	mov    $0x2,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <wait>:
 4ab:	b8 03 00 00 00       	mov    $0x3,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <pipe>:
 4b3:	b8 04 00 00 00       	mov    $0x4,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <read>:
 4bb:	b8 05 00 00 00       	mov    $0x5,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <write>:
 4c3:	b8 10 00 00 00       	mov    $0x10,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <close>:
 4cb:	b8 15 00 00 00       	mov    $0x15,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <kill>:
 4d3:	b8 06 00 00 00       	mov    $0x6,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <exec>:
 4db:	b8 07 00 00 00       	mov    $0x7,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <open>:
 4e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <mknod>:
 4eb:	b8 11 00 00 00       	mov    $0x11,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <unlink>:
 4f3:	b8 12 00 00 00       	mov    $0x12,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <fstat>:
 4fb:	b8 08 00 00 00       	mov    $0x8,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <link>:
 503:	b8 13 00 00 00       	mov    $0x13,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mkdir>:
 50b:	b8 14 00 00 00       	mov    $0x14,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <chdir>:
 513:	b8 09 00 00 00       	mov    $0x9,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <dup>:
 51b:	b8 0a 00 00 00       	mov    $0xa,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <getpid>:
 523:	b8 0b 00 00 00       	mov    $0xb,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <sbrk>:
 52b:	b8 0c 00 00 00       	mov    $0xc,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <sleep>:
 533:	b8 0d 00 00 00       	mov    $0xd,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <uptime>:
 53b:	b8 0e 00 00 00       	mov    $0xe,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <clone>:
 543:	b8 16 00 00 00       	mov    $0x16,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <join>:
 54b:	b8 17 00 00 00       	mov    $0x17,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    
 553:	66 90                	xchg   %ax,%ax
 555:	66 90                	xchg   %ax,%ax
 557:	66 90                	xchg   %ax,%ax
 559:	66 90                	xchg   %ax,%ax
 55b:	66 90                	xchg   %ax,%ax
 55d:	66 90                	xchg   %ax,%ax
 55f:	90                   	nop

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
 569:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 56c:	89 d1                	mov    %edx,%ecx
{
 56e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 571:	85 d2                	test   %edx,%edx
 573:	0f 89 7f 00 00 00    	jns    5f8 <printint+0x98>
 579:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 57d:	74 79                	je     5f8 <printint+0x98>
    neg = 1;
 57f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 586:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 588:	31 db                	xor    %ebx,%ebx
 58a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 c8                	mov    %ecx,%eax
 592:	31 d2                	xor    %edx,%edx
 594:	89 cf                	mov    %ecx,%edi
 596:	f7 75 c4             	divl   -0x3c(%ebp)
 599:	0f b6 92 b8 09 00 00 	movzbl 0x9b8(%edx),%edx
 5a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5a3:	89 d8                	mov    %ebx,%eax
 5a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5b1:	76 dd                	jbe    590 <printint+0x30>
  if(neg)
 5b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5b6:	85 c9                	test   %ecx,%ecx
 5b8:	74 0c                	je     5c6 <printint+0x66>
    buf[i++] = '-';
 5ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5cd:	eb 07                	jmp    5d6 <printint+0x76>
 5cf:	90                   	nop
 5d0:	0f b6 13             	movzbl (%ebx),%edx
 5d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5d6:	83 ec 04             	sub    $0x4,%esp
 5d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5dc:	6a 01                	push   $0x1
 5de:	56                   	push   %esi
 5df:	57                   	push   %edi
 5e0:	e8 de fe ff ff       	call   4c3 <write>
  while(--i >= 0)
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	39 de                	cmp    %ebx,%esi
 5ea:	75 e4                	jne    5d0 <printint+0x70>
    putc(fd, buf[i]);
}
 5ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5f                   	pop    %edi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ff:	eb 87                	jmp    588 <printint+0x28>
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 61d:	8b 75 0c             	mov    0xc(%ebp),%esi
 620:	0f b6 1e             	movzbl (%esi),%ebx
 623:	84 db                	test   %bl,%bl
 625:	0f 84 b4 00 00 00    	je     6df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 62b:	8d 45 10             	lea    0x10(%ebp),%eax
 62e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 631:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 634:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 636:	89 45 d0             	mov    %eax,-0x30(%ebp)
 639:	eb 33                	jmp    66e <printf+0x5e>
 63b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
 640:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 643:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	74 17                	je     664 <printf+0x54>
  write(fd, &c, 1);
 64d:	83 ec 04             	sub    $0x4,%esp
 650:	88 5d e7             	mov    %bl,-0x19(%ebp)
 653:	6a 01                	push   $0x1
 655:	57                   	push   %edi
 656:	ff 75 08             	pushl  0x8(%ebp)
 659:	e8 65 fe ff ff       	call   4c3 <write>
 65e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 661:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 664:	0f b6 1e             	movzbl (%esi),%ebx
 667:	83 c6 01             	add    $0x1,%esi
 66a:	84 db                	test   %bl,%bl
 66c:	74 71                	je     6df <printf+0xcf>
    c = fmt[i] & 0xff;
 66e:	0f be cb             	movsbl %bl,%ecx
 671:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 674:	85 d2                	test   %edx,%edx
 676:	74 c8                	je     640 <printf+0x30>
      }
    } else if(state == '%'){
 678:	83 fa 25             	cmp    $0x25,%edx
 67b:	75 e7                	jne    664 <printf+0x54>
      if(c == 'd'){
 67d:	83 f8 64             	cmp    $0x64,%eax
 680:	0f 84 9a 00 00 00    	je     720 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 686:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 68c:	83 f9 70             	cmp    $0x70,%ecx
 68f:	74 5f                	je     6f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 691:	83 f8 73             	cmp    $0x73,%eax
 694:	0f 84 d6 00 00 00    	je     770 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 69a:	83 f8 63             	cmp    $0x63,%eax
 69d:	0f 84 8d 00 00 00    	je     730 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6a3:	83 f8 25             	cmp    $0x25,%eax
 6a6:	0f 84 b4 00 00 00    	je     760 <printf+0x150>
  write(fd, &c, 1);
 6ac:	83 ec 04             	sub    $0x4,%esp
 6af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6b3:	6a 01                	push   $0x1
 6b5:	57                   	push   %edi
 6b6:	ff 75 08             	pushl  0x8(%ebp)
 6b9:	e8 05 fe ff ff       	call   4c3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6c1:	83 c4 0c             	add    $0xc,%esp
 6c4:	6a 01                	push   $0x1
 6c6:	83 c6 01             	add    $0x1,%esi
 6c9:	57                   	push   %edi
 6ca:	ff 75 08             	pushl  0x8(%ebp)
 6cd:	e8 f1 fd ff ff       	call   4c3 <write>
  for(i = 0; fmt[i]; i++){
 6d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6db:	84 db                	test   %bl,%bl
 6dd:	75 8f                	jne    66e <printf+0x5e>
    }
  }
}
 6df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e2:	5b                   	pop    %ebx
 6e3:	5e                   	pop    %esi
 6e4:	5f                   	pop    %edi
 6e5:	5d                   	pop    %ebp
 6e6:	c3                   	ret    
 6e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f8:	6a 00                	push   $0x0
 6fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	8b 13                	mov    (%ebx),%edx
 702:	e8 59 fe ff ff       	call   560 <printint>
        ap++;
 707:	89 d8                	mov    %ebx,%eax
 709:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70c:	31 d2                	xor    %edx,%edx
        ap++;
 70e:	83 c0 04             	add    $0x4,%eax
 711:	89 45 d0             	mov    %eax,-0x30(%ebp)
 714:	e9 4b ff ff ff       	jmp    664 <printf+0x54>
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 0a 00 00 00       	mov    $0xa,%ecx
 728:	6a 01                	push   $0x1
 72a:	eb ce                	jmp    6fa <printf+0xea>
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 730:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 736:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 738:	6a 01                	push   $0x1
        ap++;
 73a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 73d:	57                   	push   %edi
 73e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 741:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 744:	e8 7a fd ff ff       	call   4c3 <write>
        ap++;
 749:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 74c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74f:	31 d2                	xor    %edx,%edx
 751:	e9 0e ff ff ff       	jmp    664 <printf+0x54>
 756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 760:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
 766:	e9 59 ff ff ff       	jmp    6c4 <printf+0xb4>
 76b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
        s = (char*)*ap;
 770:	8b 45 d0             	mov    -0x30(%ebp),%eax
 773:	8b 18                	mov    (%eax),%ebx
        ap++;
 775:	83 c0 04             	add    $0x4,%eax
 778:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 77b:	85 db                	test   %ebx,%ebx
 77d:	74 17                	je     796 <printf+0x186>
        while(*s != 0){
 77f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 782:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 784:	84 c0                	test   %al,%al
 786:	0f 84 d8 fe ff ff    	je     664 <printf+0x54>
 78c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 78f:	89 de                	mov    %ebx,%esi
 791:	8b 5d 08             	mov    0x8(%ebp),%ebx
 794:	eb 1a                	jmp    7b0 <printf+0x1a0>
          s = "(null)";
 796:	bb b0 09 00 00       	mov    $0x9b0,%ebx
        while(*s != 0){
 79b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 79e:	b8 28 00 00 00       	mov    $0x28,%eax
 7a3:	89 de                	mov    %ebx,%esi
 7a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7b3:	83 c6 01             	add    $0x1,%esi
 7b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7b9:	6a 01                	push   $0x1
 7bb:	57                   	push   %edi
 7bc:	53                   	push   %ebx
 7bd:	e8 01 fd ff ff       	call   4c3 <write>
        while(*s != 0){
 7c2:	0f b6 06             	movzbl (%esi),%eax
 7c5:	83 c4 10             	add    $0x10,%esp
 7c8:	84 c0                	test   %al,%al
 7ca:	75 e4                	jne    7b0 <printf+0x1a0>
 7cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7cf:	31 d2                	xor    %edx,%edx
 7d1:	e9 8e fe ff ff       	jmp    664 <printf+0x54>
 7d6:	66 90                	xchg   %ax,%ax
 7d8:	66 90                	xchg   %ax,%ax
 7da:	66 90                	xchg   %ax,%ax
 7dc:	66 90                	xchg   %ax,%ax
 7de:	66 90                	xchg   %ax,%ax

000007e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e0:	f3 0f 1e fb          	endbr32 
 7e4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e5:	a1 60 0d 00 00       	mov    0xd60,%eax
{
 7ea:	89 e5                	mov    %esp,%ebp
 7ec:	57                   	push   %edi
 7ed:	56                   	push   %esi
 7ee:	53                   	push   %ebx
 7ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7f2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 7f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f7:	39 c8                	cmp    %ecx,%eax
 7f9:	73 15                	jae    810 <free+0x30>
 7fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
 800:	39 d1                	cmp    %edx,%ecx
 802:	72 14                	jb     818 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 804:	39 d0                	cmp    %edx,%eax
 806:	73 10                	jae    818 <free+0x38>
{
 808:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80a:	8b 10                	mov    (%eax),%edx
 80c:	39 c8                	cmp    %ecx,%eax
 80e:	72 f0                	jb     800 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 810:	39 d0                	cmp    %edx,%eax
 812:	72 f4                	jb     808 <free+0x28>
 814:	39 d1                	cmp    %edx,%ecx
 816:	73 f0                	jae    808 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 fa                	cmp    %edi,%edx
 820:	74 1e                	je     840 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 822:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 825:	8b 50 04             	mov    0x4(%eax),%edx
 828:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 82b:	39 f1                	cmp    %esi,%ecx
 82d:	74 28                	je     857 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 82f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 831:	5b                   	pop    %ebx
  freep = p;
 832:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 837:	5e                   	pop    %esi
 838:	5f                   	pop    %edi
 839:	5d                   	pop    %ebp
 83a:	c3                   	ret    
 83b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 840:	03 72 04             	add    0x4(%edx),%esi
 843:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 846:	8b 10                	mov    (%eax),%edx
 848:	8b 12                	mov    (%edx),%edx
 84a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84d:	8b 50 04             	mov    0x4(%eax),%edx
 850:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 853:	39 f1                	cmp    %esi,%ecx
 855:	75 d8                	jne    82f <free+0x4f>
    p->s.size += bp->s.size;
 857:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 85a:	a3 60 0d 00 00       	mov    %eax,0xd60
    p->s.size += bp->s.size;
 85f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 862:	8b 53 f8             	mov    -0x8(%ebx),%edx
 865:	89 10                	mov    %edx,(%eax)
}
 867:	5b                   	pop    %ebx
 868:	5e                   	pop    %esi
 869:	5f                   	pop    %edi
 86a:	5d                   	pop    %ebp
 86b:	c3                   	ret    
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000870 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 870:	f3 0f 1e fb          	endbr32 
 874:	55                   	push   %ebp
 875:	89 e5                	mov    %esp,%ebp
 877:	57                   	push   %edi
 878:	56                   	push   %esi
 879:	53                   	push   %ebx
 87a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 880:	8b 3d 60 0d 00 00    	mov    0xd60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 886:	8d 70 07             	lea    0x7(%eax),%esi
 889:	c1 ee 03             	shr    $0x3,%esi
 88c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 88f:	85 ff                	test   %edi,%edi
 891:	0f 84 a9 00 00 00    	je     940 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 897:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 899:	8b 48 04             	mov    0x4(%eax),%ecx
 89c:	39 f1                	cmp    %esi,%ecx
 89e:	73 6d                	jae    90d <malloc+0x9d>
 8a0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8a6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8ab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8ae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8b8:	eb 17                	jmp    8d1 <malloc+0x61>
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8c2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8c5:	39 f1                	cmp    %esi,%ecx
 8c7:	73 4f                	jae    918 <malloc+0xa8>
 8c9:	8b 3d 60 0d 00 00    	mov    0xd60,%edi
 8cf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8d1:	39 c7                	cmp    %eax,%edi
 8d3:	75 eb                	jne    8c0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 8d5:	83 ec 0c             	sub    $0xc,%esp
 8d8:	ff 75 e4             	pushl  -0x1c(%ebp)
 8db:	e8 4b fc ff ff       	call   52b <sbrk>
  if(p == (char*)-1)
 8e0:	83 c4 10             	add    $0x10,%esp
 8e3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e6:	74 1b                	je     903 <malloc+0x93>
  hp->s.size = nu;
 8e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8eb:	83 ec 0c             	sub    $0xc,%esp
 8ee:	83 c0 08             	add    $0x8,%eax
 8f1:	50                   	push   %eax
 8f2:	e8 e9 fe ff ff       	call   7e0 <free>
  return freep;
 8f7:	a1 60 0d 00 00       	mov    0xd60,%eax
      if((p = morecore(nunits)) == 0)
 8fc:	83 c4 10             	add    $0x10,%esp
 8ff:	85 c0                	test   %eax,%eax
 901:	75 bd                	jne    8c0 <malloc+0x50>
        return 0;
  }
}
 903:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 906:	31 c0                	xor    %eax,%eax
}
 908:	5b                   	pop    %ebx
 909:	5e                   	pop    %esi
 90a:	5f                   	pop    %edi
 90b:	5d                   	pop    %ebp
 90c:	c3                   	ret    
    if(p->s.size >= nunits){
 90d:	89 c2                	mov    %eax,%edx
 90f:	89 f8                	mov    %edi,%eax
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 918:	39 ce                	cmp    %ecx,%esi
 91a:	74 54                	je     970 <malloc+0x100>
        p->s.size -= nunits;
 91c:	29 f1                	sub    %esi,%ecx
 91e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 921:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 924:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 927:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 92c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 92f:	8d 42 08             	lea    0x8(%edx),%eax
}
 932:	5b                   	pop    %ebx
 933:	5e                   	pop    %esi
 934:	5f                   	pop    %edi
 935:	5d                   	pop    %ebp
 936:	c3                   	ret    
 937:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 940:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 947:	0d 00 00 
    base.s.size = 0;
 94a:	bf 64 0d 00 00       	mov    $0xd64,%edi
    base.s.ptr = freep = prevp = &base;
 94f:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 956:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 959:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 95b:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 962:	00 00 00 
    if(p->s.size >= nunits){
 965:	e9 36 ff ff ff       	jmp    8a0 <malloc+0x30>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 970:	8b 0a                	mov    (%edx),%ecx
 972:	89 08                	mov    %ecx,(%eax)
 974:	eb b1                	jmp    927 <malloc+0xb7>
