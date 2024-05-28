
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 58 09 00 00       	push   $0x958
  1d:	e8 a1 04 00 00       	call   4c3 <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 c4 04 00 00       	call   4fb <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 b8 04 00 00       	call   4fb <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 60 09 00 00       	push   $0x960
  58:	6a 01                	push   $0x1
  5a:	e8 91 05 00 00       	call   5f0 <printf>
    pid = fork();
  5f:	e8 17 04 00 00       	call   47b <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 16 04 00 00       	call   48b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 9f 09 00 00       	push   $0x99f
  85:	6a 01                	push   $0x1
  87:	e8 64 05 00 00       	call   5f0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 73 09 00 00       	push   $0x973
  98:	6a 01                	push   $0x1
  9a:	e8 51 05 00 00       	call   5f0 <printf>
      exit();
  9f:	e8 df 03 00 00       	call   483 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 10 0d 00 00       	push   $0xd10
  ab:	68 86 09 00 00       	push   $0x986
  b0:	e8 06 04 00 00       	call   4bb <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 89 09 00 00       	push   $0x989
  bc:	6a 01                	push   $0x1
  be:	e8 2d 05 00 00       	call   5f0 <printf>
      exit();
  c3:	e8 bb 03 00 00       	call   483 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 58 09 00 00       	push   $0x958
  d2:	e8 f4 03 00 00       	call   4cb <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 58 09 00 00       	push   $0x958
  e0:	e8 de 03 00 00       	call   4c3 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "x86.h"
#include "mmu.h"  // PGSIZE // Code added by Greg, Shawn, and Minh, Homework 6

char*
strcpy(char *s, const char *t)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f5:	31 c0                	xor    %eax,%eax
{
  f7:	89 e5                	mov    %esp,%ebp
  f9:	53                   	push   %ebx
  fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	89 c8                	mov    %ecx,%eax
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	53                   	push   %ebx
 128:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 12e:	0f b6 01             	movzbl (%ecx),%eax
 131:	0f b6 1a             	movzbl (%edx),%ebx
 134:	84 c0                	test   %al,%al
 136:	75 19                	jne    151 <strcmp+0x31>
 138:	eb 26                	jmp    160 <strcmp+0x40>
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 144:	83 c1 01             	add    $0x1,%ecx
 147:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 14a:	0f b6 1a             	movzbl (%edx),%ebx
 14d:	84 c0                	test   %al,%al
 14f:	74 0f                	je     160 <strcmp+0x40>
 151:	38 d8                	cmp    %bl,%al
 153:	74 eb                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 155:	29 d8                	sub    %ebx,%eax
}
 157:	5b                   	pop    %ebx
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 162:	29 d8                	sub    %ebx,%eax
}
 164:	5b                   	pop    %ebx
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 17a:	80 3a 00             	cmpb   $0x0,(%edx)
 17d:	74 21                	je     1a0 <strlen+0x30>
 17f:	31 c0                	xor    %eax,%eax
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 188:	83 c0 01             	add    $0x1,%eax
 18b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 18f:	89 c1                	mov    %eax,%ecx
 191:	75 f5                	jne    188 <strlen+0x18>
    ;
  return n;
}
 193:	89 c8                	mov    %ecx,%eax
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 d7                	mov    %edx,%edi
 1c3:	fc                   	cld    
 1c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c6:	89 d0                	mov    %edx,%eax
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1de:	0f b6 10             	movzbl (%eax),%edx
 1e1:	84 d2                	test   %dl,%dl
 1e3:	75 16                	jne    1fb <strchr+0x2b>
 1e5:	eb 21                	jmp    208 <strchr+0x38>
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
 1f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	84 d2                	test   %dl,%dl
 1f9:	74 0d                	je     208 <strchr+0x38>
    if(*s == c)
 1fb:	38 d1                	cmp    %dl,%cl
 1fd:	75 f1                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 208:	31 c0                	xor    %eax,%eax
}
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 219:	31 f6                	xor    %esi,%esi
{
 21b:	53                   	push   %ebx
 21c:	89 f3                	mov    %esi,%ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 224:	eb 33                	jmp    259 <gets+0x49>
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 230:	83 ec 04             	sub    $0x4,%esp
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	6a 01                	push   $0x1
 238:	50                   	push   %eax
 239:	6a 00                	push   $0x0
 23b:	e8 5b 02 00 00       	call   49b <read>
    if(cc < 1)
 240:	83 c4 10             	add    $0x10,%esp
 243:	85 c0                	test   %eax,%eax
 245:	7e 1c                	jle    263 <gets+0x53>
      break;
    buf[i++] = c;
 247:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24b:	83 c7 01             	add    $0x1,%edi
 24e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 251:	3c 0a                	cmp    $0xa,%al
 253:	74 23                	je     278 <gets+0x68>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 1f                	je     278 <gets+0x68>
  for(i=0; i+1 < max; ){
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	89 fe                	mov    %edi,%esi
 25e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 261:	7c cd                	jl     230 <gets+0x20>
 263:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 265:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 268:	c6 03 00             	movb   $0x0,(%ebx)
}
 26b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26e:	5b                   	pop    %ebx
 26f:	5e                   	pop    %esi
 270:	5f                   	pop    %edi
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	8b 75 08             	mov    0x8(%ebp),%esi
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	01 de                	add    %ebx,%esi
 280:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 282:	c6 03 00             	movb   $0x0,(%ebx)
}
 285:	8d 65 f4             	lea    -0xc(%ebp),%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	56                   	push   %esi
 298:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	6a 00                	push   $0x0
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 1d 02 00 00       	call   4c3 <open>
  if(fd < 0)
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	78 2b                	js     2d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	89 c3                	mov    %eax,%ebx
 2b5:	50                   	push   %eax
 2b6:	e8 20 02 00 00       	call   4db <fstat>
  close(fd);
 2bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2be:	89 c6                	mov    %eax,%esi
  close(fd);
 2c0:	e8 e6 01 00 00       	call   4ab <close>
  return r;
 2c5:	83 c4 10             	add    $0x10,%esp
}
 2c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2dd:	eb e9                	jmp    2c8 <stat+0x38>
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2eb:	0f be 02             	movsbl (%edx),%eax
 2ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f9:	77 1a                	ja     315 <atoi+0x35>
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	89 c8                	mov    %ecx,%eax
 317:	5b                   	pop    %ebx
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	8b 45 10             	mov    0x10(%ebp),%eax
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
 32e:	56                   	push   %esi
 32f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	85 c0                	test   %eax,%eax
 334:	7e 0f                	jle    345 <memmove+0x25>
 336:	01 d0                	add    %edx,%eax
  dst = vdst;
 338:	89 d7                	mov    %edx,%edi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
}
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <thread_create>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	53                   	push   %ebx
 358:	83 ec 20             	sub    $0x20,%esp
  void *stack = malloc(PGSIZE*2);
 35b:	68 00 20 00 00       	push   $0x2000
 360:	e8 eb 04 00 00       	call   850 <malloc>
  if (stack == 0)
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	74 53                	je     3bf <thread_create+0x6f>
 36c:	89 c3                	mov    %eax,%ebx
    return -1;
  if ((uint)stack % PGSIZE) {
 36e:	25 ff 0f 00 00       	and    $0xfff,%eax
 373:	75 23                	jne    398 <thread_create+0x48>
    stack = stack + (4096 - (uint)stack % PGSIZE);
  }
  int r = clone(start_routine, arg1, arg2, stack);
 375:	53                   	push   %ebx
 376:	ff 75 10             	pushl  0x10(%ebp)
 379:	ff 75 0c             	pushl  0xc(%ebp)
 37c:	ff 75 08             	pushl  0x8(%ebp)
 37f:	e8 9f 01 00 00       	call   523 <clone>
  if (r == -1)
 384:	83 c4 10             	add    $0x10,%esp
 387:	83 f8 ff             	cmp    $0xffffffff,%eax
 38a:	74 1c                	je     3a8 <thread_create+0x58>
    free(stack);
  return r;
}
 38c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38f:	c9                   	leave  
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    stack = stack + (4096 - (uint)stack % PGSIZE);
 398:	29 c3                	sub    %eax,%ebx
 39a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 3a0:	eb d3                	jmp    375 <thread_create+0x25>
 3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(stack);
 3a8:	83 ec 0c             	sub    $0xc,%esp
 3ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ae:	53                   	push   %ebx
 3af:	e8 0c 04 00 00       	call   7c0 <free>
 3b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 3b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(stack);
 3ba:	83 c4 10             	add    $0x10,%esp
}
 3bd:	c9                   	leave  
 3be:	c3                   	ret    
    return -1;
 3bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3c4:	eb c6                	jmp    38c <thread_create+0x3c>
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <thread_join>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_join() {
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	56                   	push   %esi
 3d8:	83 ec 20             	sub    $0x20,%esp
  // 
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 3db:	6a 04                	push   $0x4
 3dd:	e8 6e 04 00 00       	call   850 <malloc>
  int pidThread = join(stack);
 3e2:	89 04 24             	mov    %eax,(%esp)
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 3e5:	89 c6                	mov    %eax,%esi
  int pidThread = join(stack);
 3e7:	e8 3f 01 00 00       	call   52b <join>
  if (pidThread != -1) {
 3ec:	83 c4 10             	add    $0x10,%esp
 3ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 3f2:	74 12                	je     406 <thread_join+0x36>
    // if stack is not allocated correctly => free stack
    free(stack);
 3f4:	83 ec 0c             	sub    $0xc,%esp
 3f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3fa:	56                   	push   %esi
 3fb:	e8 c0 03 00 00       	call   7c0 <free>
 400:	8b 45 f4             	mov    -0xc(%ebp),%eax
 403:	83 c4 10             	add    $0x10,%esp
  }

  return pidThread;
}
 406:	8b 75 fc             	mov    -0x4(%ebp),%esi
 409:	c9                   	leave  
 40a:	c3                   	ret    
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <lock_init>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_init(lock_t * lock) {
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 41a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 420:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <lock_aquire>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_aquire(lock_t * lock) {
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 435:	ba 01 00 00 00       	mov    $0x1,%edx
void lock_aquire(lock_t * lock) {
 43a:	89 e5                	mov    %esp,%ebp
 43c:	8b 45 08             	mov    0x8(%ebp),%eax
    __asm__ volatile("lock; xaddl %0, %1"
 43f:	f0 0f c1 10          	lock xadd %edx,(%eax)
  int myTurn = fetch_and_add(&lock->ticket, 1);
  while(lock->turn != myTurn)
 443:	3b 50 04             	cmp    0x4(%eax),%edx
 446:	74 12                	je     45a <lock_aquire+0x2a>
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
    __sync_synchronize();
 450:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  while(lock->turn != myTurn)
 455:	39 50 04             	cmp    %edx,0x4(%eax)
 458:	75 f6                	jne    450 <lock_aquire+0x20>
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <lock_release>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_release(lock_t * lock) {
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 465:	b8 01 00 00 00       	mov    $0x1,%eax
void lock_release(lock_t * lock) {
 46a:	89 e5                	mov    %esp,%ebp
 46c:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 46f:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
 474:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    

0000047b <fork>:
 47b:	b8 01 00 00 00       	mov    $0x1,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <exit>:
 483:	b8 02 00 00 00       	mov    $0x2,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <wait>:
 48b:	b8 03 00 00 00       	mov    $0x3,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <pipe>:
 493:	b8 04 00 00 00       	mov    $0x4,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <read>:
 49b:	b8 05 00 00 00       	mov    $0x5,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <write>:
 4a3:	b8 10 00 00 00       	mov    $0x10,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <close>:
 4ab:	b8 15 00 00 00       	mov    $0x15,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <kill>:
 4b3:	b8 06 00 00 00       	mov    $0x6,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <exec>:
 4bb:	b8 07 00 00 00       	mov    $0x7,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <open>:
 4c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <mknod>:
 4cb:	b8 11 00 00 00       	mov    $0x11,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <unlink>:
 4d3:	b8 12 00 00 00       	mov    $0x12,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <fstat>:
 4db:	b8 08 00 00 00       	mov    $0x8,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <link>:
 4e3:	b8 13 00 00 00       	mov    $0x13,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <mkdir>:
 4eb:	b8 14 00 00 00       	mov    $0x14,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <chdir>:
 4f3:	b8 09 00 00 00       	mov    $0x9,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <dup>:
 4fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <getpid>:
 503:	b8 0b 00 00 00       	mov    $0xb,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <sbrk>:
 50b:	b8 0c 00 00 00       	mov    $0xc,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <sleep>:
 513:	b8 0d 00 00 00       	mov    $0xd,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <uptime>:
 51b:	b8 0e 00 00 00       	mov    $0xe,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <clone>:
 523:	b8 16 00 00 00       	mov    $0x16,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <join>:
 52b:	b8 17 00 00 00       	mov    $0x17,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    
 533:	66 90                	xchg   %ax,%ax
 535:	66 90                	xchg   %ax,%ax
 537:	66 90                	xchg   %ax,%ax
 539:	66 90                	xchg   %ax,%ax
 53b:	66 90                	xchg   %ax,%ax
 53d:	66 90                	xchg   %ax,%ax
 53f:	90                   	nop

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 3c             	sub    $0x3c,%esp
 549:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 54c:	89 d1                	mov    %edx,%ecx
{
 54e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 551:	85 d2                	test   %edx,%edx
 553:	0f 89 7f 00 00 00    	jns    5d8 <printint+0x98>
 559:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55d:	74 79                	je     5d8 <printint+0x98>
    neg = 1;
 55f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 566:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 568:	31 db                	xor    %ebx,%ebx
 56a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 570:	89 c8                	mov    %ecx,%eax
 572:	31 d2                	xor    %edx,%edx
 574:	89 cf                	mov    %ecx,%edi
 576:	f7 75 c4             	divl   -0x3c(%ebp)
 579:	0f b6 92 b0 09 00 00 	movzbl 0x9b0(%edx),%edx
 580:	89 45 c0             	mov    %eax,-0x40(%ebp)
 583:	89 d8                	mov    %ebx,%eax
 585:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 588:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 58b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 58e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 591:	76 dd                	jbe    570 <printint+0x30>
  if(neg)
 593:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 596:	85 c9                	test   %ecx,%ecx
 598:	74 0c                	je     5a6 <printint+0x66>
    buf[i++] = '-';
 59a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 59f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ad:	eb 07                	jmp    5b6 <printint+0x76>
 5af:	90                   	nop
 5b0:	0f b6 13             	movzbl (%ebx),%edx
 5b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5bc:	6a 01                	push   $0x1
 5be:	56                   	push   %esi
 5bf:	57                   	push   %edi
 5c0:	e8 de fe ff ff       	call   4a3 <write>
  while(--i >= 0)
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	39 de                	cmp    %ebx,%esi
 5ca:	75 e4                	jne    5b0 <printint+0x70>
    putc(fd, buf[i]);
}
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5df:	eb 87                	jmp    568 <printint+0x28>
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	f3 0f 1e fb          	endbr32 
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	57                   	push   %edi
 5f8:	56                   	push   %esi
 5f9:	53                   	push   %ebx
 5fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 600:	0f b6 1e             	movzbl (%esi),%ebx
 603:	84 db                	test   %bl,%bl
 605:	0f 84 b4 00 00 00    	je     6bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 60b:	8d 45 10             	lea    0x10(%ebp),%eax
 60e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 611:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 614:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 616:	89 45 d0             	mov    %eax,-0x30(%ebp)
 619:	eb 33                	jmp    64e <printf+0x5e>
 61b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
 620:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 623:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	74 17                	je     644 <printf+0x54>
  write(fd, &c, 1);
 62d:	83 ec 04             	sub    $0x4,%esp
 630:	88 5d e7             	mov    %bl,-0x19(%ebp)
 633:	6a 01                	push   $0x1
 635:	57                   	push   %edi
 636:	ff 75 08             	pushl  0x8(%ebp)
 639:	e8 65 fe ff ff       	call   4a3 <write>
 63e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 641:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 644:	0f b6 1e             	movzbl (%esi),%ebx
 647:	83 c6 01             	add    $0x1,%esi
 64a:	84 db                	test   %bl,%bl
 64c:	74 71                	je     6bf <printf+0xcf>
    c = fmt[i] & 0xff;
 64e:	0f be cb             	movsbl %bl,%ecx
 651:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 654:	85 d2                	test   %edx,%edx
 656:	74 c8                	je     620 <printf+0x30>
      }
    } else if(state == '%'){
 658:	83 fa 25             	cmp    $0x25,%edx
 65b:	75 e7                	jne    644 <printf+0x54>
      if(c == 'd'){
 65d:	83 f8 64             	cmp    $0x64,%eax
 660:	0f 84 9a 00 00 00    	je     700 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 666:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 66c:	83 f9 70             	cmp    $0x70,%ecx
 66f:	74 5f                	je     6d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 671:	83 f8 73             	cmp    $0x73,%eax
 674:	0f 84 d6 00 00 00    	je     750 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67a:	83 f8 63             	cmp    $0x63,%eax
 67d:	0f 84 8d 00 00 00    	je     710 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 683:	83 f8 25             	cmp    $0x25,%eax
 686:	0f 84 b4 00 00 00    	je     740 <printf+0x150>
  write(fd, &c, 1);
 68c:	83 ec 04             	sub    $0x4,%esp
 68f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	ff 75 08             	pushl  0x8(%ebp)
 699:	e8 05 fe ff ff       	call   4a3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 69e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6a1:	83 c4 0c             	add    $0xc,%esp
 6a4:	6a 01                	push   $0x1
 6a6:	83 c6 01             	add    $0x1,%esi
 6a9:	57                   	push   %edi
 6aa:	ff 75 08             	pushl  0x8(%ebp)
 6ad:	e8 f1 fd ff ff       	call   4a3 <write>
  for(i = 0; fmt[i]; i++){
 6b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6bb:	84 db                	test   %bl,%bl
 6bd:	75 8f                	jne    64e <printf+0x5e>
    }
  }
}
 6bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5f                   	pop    %edi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    
 6c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d8:	6a 00                	push   $0x0
 6da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	8b 13                	mov    (%ebx),%edx
 6e2:	e8 59 fe ff ff       	call   540 <printint>
        ap++;
 6e7:	89 d8                	mov    %ebx,%eax
 6e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ec:	31 d2                	xor    %edx,%edx
        ap++;
 6ee:	83 c0 04             	add    $0x4,%eax
 6f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f4:	e9 4b ff ff ff       	jmp    644 <printf+0x54>
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	eb ce                	jmp    6da <printf+0xea>
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 710:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
        ap++;
 71a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 71d:	57                   	push   %edi
 71e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 721:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 724:	e8 7a fd ff ff       	call   4a3 <write>
        ap++;
 729:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 72c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 0e ff ff ff       	jmp    644 <printf+0x54>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 740:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
 746:	e9 59 ff ff ff       	jmp    6a4 <printf+0xb4>
 74b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
        s = (char*)*ap;
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
 753:	8b 18                	mov    (%eax),%ebx
        ap++;
 755:	83 c0 04             	add    $0x4,%eax
 758:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 75b:	85 db                	test   %ebx,%ebx
 75d:	74 17                	je     776 <printf+0x186>
        while(*s != 0){
 75f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 762:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 764:	84 c0                	test   %al,%al
 766:	0f 84 d8 fe ff ff    	je     644 <printf+0x54>
 76c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 76f:	89 de                	mov    %ebx,%esi
 771:	8b 5d 08             	mov    0x8(%ebp),%ebx
 774:	eb 1a                	jmp    790 <printf+0x1a0>
          s = "(null)";
 776:	bb a8 09 00 00       	mov    $0x9a8,%ebx
        while(*s != 0){
 77b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 77e:	b8 28 00 00 00       	mov    $0x28,%eax
 783:	89 de                	mov    %ebx,%esi
 785:	8b 5d 08             	mov    0x8(%ebp),%ebx
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
          s++;
 793:	83 c6 01             	add    $0x1,%esi
 796:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 799:	6a 01                	push   $0x1
 79b:	57                   	push   %edi
 79c:	53                   	push   %ebx
 79d:	e8 01 fd ff ff       	call   4a3 <write>
        while(*s != 0){
 7a2:	0f b6 06             	movzbl (%esi),%eax
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	84 c0                	test   %al,%al
 7aa:	75 e4                	jne    790 <printf+0x1a0>
 7ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 8e fe ff ff       	jmp    644 <printf+0x54>
 7b6:	66 90                	xchg   %ax,%ax
 7b8:	66 90                	xchg   %ax,%ax
 7ba:	66 90                	xchg   %ax,%ax
 7bc:	66 90                	xchg   %ax,%ax
 7be:	66 90                	xchg   %ax,%ax

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	f3 0f 1e fb          	endbr32 
 7c4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c5:	a1 18 0d 00 00       	mov    0xd18,%eax
{
 7ca:	89 e5                	mov    %esp,%ebp
 7cc:	57                   	push   %edi
 7cd:	56                   	push   %esi
 7ce:	53                   	push   %ebx
 7cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 7d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d7:	39 c8                	cmp    %ecx,%eax
 7d9:	73 15                	jae    7f0 <free+0x30>
 7db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
 7e0:	39 d1                	cmp    %edx,%ecx
 7e2:	72 14                	jb     7f8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e4:	39 d0                	cmp    %edx,%eax
 7e6:	73 10                	jae    7f8 <free+0x38>
{
 7e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ea:	8b 10                	mov    (%eax),%edx
 7ec:	39 c8                	cmp    %ecx,%eax
 7ee:	72 f0                	jb     7e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f0:	39 d0                	cmp    %edx,%eax
 7f2:	72 f4                	jb     7e8 <free+0x28>
 7f4:	39 d1                	cmp    %edx,%ecx
 7f6:	73 f0                	jae    7e8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fe:	39 fa                	cmp    %edi,%edx
 800:	74 1e                	je     820 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 802:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 805:	8b 50 04             	mov    0x4(%eax),%edx
 808:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 80b:	39 f1                	cmp    %esi,%ecx
 80d:	74 28                	je     837 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 811:	5b                   	pop    %ebx
  freep = p;
 812:	a3 18 0d 00 00       	mov    %eax,0xd18
}
 817:	5e                   	pop    %esi
 818:	5f                   	pop    %edi
 819:	5d                   	pop    %ebp
 81a:	c3                   	ret    
 81b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 820:	03 72 04             	add    0x4(%edx),%esi
 823:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 826:	8b 10                	mov    (%eax),%edx
 828:	8b 12                	mov    (%edx),%edx
 82a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82d:	8b 50 04             	mov    0x4(%eax),%edx
 830:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 833:	39 f1                	cmp    %esi,%ecx
 835:	75 d8                	jne    80f <free+0x4f>
    p->s.size += bp->s.size;
 837:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 83a:	a3 18 0d 00 00       	mov    %eax,0xd18
    p->s.size += bp->s.size;
 83f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 842:	8b 53 f8             	mov    -0x8(%ebx),%edx
 845:	89 10                	mov    %edx,(%eax)
}
 847:	5b                   	pop    %ebx
 848:	5e                   	pop    %esi
 849:	5f                   	pop    %edi
 84a:	5d                   	pop    %ebp
 84b:	c3                   	ret    
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 850:	f3 0f 1e fb          	endbr32 
 854:	55                   	push   %ebp
 855:	89 e5                	mov    %esp,%ebp
 857:	57                   	push   %edi
 858:	56                   	push   %esi
 859:	53                   	push   %ebx
 85a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 860:	8b 3d 18 0d 00 00    	mov    0xd18,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 866:	8d 70 07             	lea    0x7(%eax),%esi
 869:	c1 ee 03             	shr    $0x3,%esi
 86c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 86f:	85 ff                	test   %edi,%edi
 871:	0f 84 a9 00 00 00    	je     920 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 877:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 879:	8b 48 04             	mov    0x4(%eax),%ecx
 87c:	39 f1                	cmp    %esi,%ecx
 87e:	73 6d                	jae    8ed <malloc+0x9d>
 880:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 886:	bb 00 10 00 00       	mov    $0x1000,%ebx
 88b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 88e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 895:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 898:	eb 17                	jmp    8b1 <malloc+0x61>
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8a2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8a5:	39 f1                	cmp    %esi,%ecx
 8a7:	73 4f                	jae    8f8 <malloc+0xa8>
 8a9:	8b 3d 18 0d 00 00    	mov    0xd18,%edi
 8af:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8b1:	39 c7                	cmp    %eax,%edi
 8b3:	75 eb                	jne    8a0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 8b5:	83 ec 0c             	sub    $0xc,%esp
 8b8:	ff 75 e4             	pushl  -0x1c(%ebp)
 8bb:	e8 4b fc ff ff       	call   50b <sbrk>
  if(p == (char*)-1)
 8c0:	83 c4 10             	add    $0x10,%esp
 8c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c6:	74 1b                	je     8e3 <malloc+0x93>
  hp->s.size = nu;
 8c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8cb:	83 ec 0c             	sub    $0xc,%esp
 8ce:	83 c0 08             	add    $0x8,%eax
 8d1:	50                   	push   %eax
 8d2:	e8 e9 fe ff ff       	call   7c0 <free>
  return freep;
 8d7:	a1 18 0d 00 00       	mov    0xd18,%eax
      if((p = morecore(nunits)) == 0)
 8dc:	83 c4 10             	add    $0x10,%esp
 8df:	85 c0                	test   %eax,%eax
 8e1:	75 bd                	jne    8a0 <malloc+0x50>
        return 0;
  }
}
 8e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8e6:	31 c0                	xor    %eax,%eax
}
 8e8:	5b                   	pop    %ebx
 8e9:	5e                   	pop    %esi
 8ea:	5f                   	pop    %edi
 8eb:	5d                   	pop    %ebp
 8ec:	c3                   	ret    
    if(p->s.size >= nunits){
 8ed:	89 c2                	mov    %eax,%edx
 8ef:	89 f8                	mov    %edi,%eax
 8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8f8:	39 ce                	cmp    %ecx,%esi
 8fa:	74 54                	je     950 <malloc+0x100>
        p->s.size -= nunits;
 8fc:	29 f1                	sub    %esi,%ecx
 8fe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 901:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 904:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 907:	a3 18 0d 00 00       	mov    %eax,0xd18
}
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 90f:	8d 42 08             	lea    0x8(%edx),%eax
}
 912:	5b                   	pop    %ebx
 913:	5e                   	pop    %esi
 914:	5f                   	pop    %edi
 915:	5d                   	pop    %ebp
 916:	c3                   	ret    
 917:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 920:	c7 05 18 0d 00 00 1c 	movl   $0xd1c,0xd18
 927:	0d 00 00 
    base.s.size = 0;
 92a:	bf 1c 0d 00 00       	mov    $0xd1c,%edi
    base.s.ptr = freep = prevp = &base;
 92f:	c7 05 1c 0d 00 00 1c 	movl   $0xd1c,0xd1c
 936:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 939:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 93b:	c7 05 20 0d 00 00 00 	movl   $0x0,0xd20
 942:	00 00 00 
    if(p->s.size >= nunits){
 945:	e9 36 ff ff ff       	jmp    880 <malloc+0x30>
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 950:	8b 0a                	mov    (%edx),%ecx
 952:	89 08                	mov    %ecx,(%eax)
 954:	eb b1                	jmp    907 <malloc+0xb7>
