
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 27 05 00 00       	call   563 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 ed 04 00 00       	call   54b <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 b8 04 00 00       	call   523 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 1b 0a 00 00       	push   $0xa1b
  73:	6a 01                	push   $0x1
  75:	e8 16 06 00 00       	call   690 <printf>
      exit();
  7a:	e8 a4 04 00 00       	call   523 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 0d 0a 00 00       	push   $0xa0d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 91 04 00 00       	call   523 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 00 0e 00 00       	push   $0xe00
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 5e 04 00 00       	call   53b <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 00 0e 00 00 	movsbl 0xe00(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 f8 09 00 00       	push   $0x9f8
 117:	e8 54 01 00 00       	call   270 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 0e 0a 00 00       	push   $0xa0e
 15c:	6a 01                	push   $0x1
 15e:	e8 2d 05 00 00       	call   690 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 fe 09 00 00       	push   $0x9fe
 175:	6a 01                	push   $0x1
 177:	e8 14 05 00 00       	call   690 <printf>
    exit();
 17c:	e8 a2 03 00 00       	call   523 <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "x86.h"
#include "mmu.h"  // PGSIZE // Code added by Greg, Shawn, and Minh, Homework 6

char*
strcpy(char *s, const char *t)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	31 c0                	xor    %eax,%eax
{
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	0f b6 1a             	movzbl (%edx),%ebx
 1d4:	84 c0                	test   %al,%al
 1d6:	75 19                	jne    1f1 <strcmp+0x31>
 1d8:	eb 26                	jmp    200 <strcmp+0x40>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1e4:	83 c1 01             	add    $0x1,%ecx
 1e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ea:	0f b6 1a             	movzbl (%edx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	38 d8                	cmp    %bl,%al
 1f3:	74 eb                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 3a 00             	cmpb   $0x0,(%edx)
 21d:	74 21                	je     240 <strlen+0x30>
 21f:	31 c0                	xor    %eax,%eax
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 22f:	89 c1                	mov    %eax,%ecx
 231:	75 f5                	jne    228 <strlen+0x18>
    ;
  return n;
}
 233:	89 c8                	mov    %ecx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 d7                	mov    %edx,%edi
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27e:	0f b6 10             	movzbl (%eax),%edx
 281:	84 d2                	test   %dl,%dl
 283:	75 16                	jne    29b <strchr+0x2b>
 285:	eb 21                	jmp    2a8 <strchr+0x38>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b9:	31 f6                	xor    %esi,%esi
{
 2bb:	53                   	push   %ebx
 2bc:	89 f3                	mov    %esi,%ebx
 2be:	83 ec 1c             	sub    $0x1c,%esp
 2c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2c4:	eb 33                	jmp    2f9 <gets+0x49>
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d6:	6a 01                	push   $0x1
 2d8:	50                   	push   %eax
 2d9:	6a 00                	push   $0x0
 2db:	e8 5b 02 00 00       	call   53b <read>
    if(cc < 1)
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	85 c0                	test   %eax,%eax
 2e5:	7e 1c                	jle    303 <gets+0x53>
      break;
    buf[i++] = c;
 2e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2eb:	83 c7 01             	add    $0x1,%edi
 2ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 23                	je     318 <gets+0x68>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 1f                	je     318 <gets+0x68>
  for(i=0; i+1 < max; ){
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	89 fe                	mov    %edi,%esi
 2fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 301:	7c cd                	jl     2d0 <gets+0x20>
 303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 308:	c6 03 00             	movb   $0x0,(%ebx)
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	8b 75 08             	mov    0x8(%ebp),%esi
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	01 de                	add    %ebx,%esi
 320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 322:	c6 03 00             	movb   $0x0,(%ebx)
}
 325:	8d 65 f4             	lea    -0xc(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	6a 00                	push   $0x0
 33e:	ff 75 08             	pushl  0x8(%ebp)
 341:	e8 1d 02 00 00       	call   563 <open>
  if(fd < 0)
 346:	83 c4 10             	add    $0x10,%esp
 349:	85 c0                	test   %eax,%eax
 34b:	78 2b                	js     378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	pushl  0xc(%ebp)
 353:	89 c3                	mov    %eax,%ebx
 355:	50                   	push   %eax
 356:	e8 20 02 00 00       	call   57b <fstat>
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35e:	89 c6                	mov    %eax,%esi
  close(fd);
 360:	e8 e6 01 00 00       	call   54b <close>
  return r;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	89 f0                	mov    %esi,%eax
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37d:	eb e9                	jmp    368 <stat+0x38>
 37f:	90                   	nop

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 38b:	0f be 02             	movsbl (%edx),%eax
 38e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 399:	77 1a                	ja     3b5 <atoi+0x35>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	8b 45 10             	mov    0x10(%ebp),%eax
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ce:	56                   	push   %esi
 3cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 0f                	jle    3e5 <memmove+0x25>
 3d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d8:	89 d7                	mov    %edx,%edi
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_create>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	53                   	push   %ebx
 3f8:	83 ec 20             	sub    $0x20,%esp
  void *stack = malloc(PGSIZE*2);
 3fb:	68 00 20 00 00       	push   $0x2000
 400:	e8 eb 04 00 00       	call   8f0 <malloc>
  if (stack == 0)
 405:	83 c4 10             	add    $0x10,%esp
 408:	85 c0                	test   %eax,%eax
 40a:	74 53                	je     45f <thread_create+0x6f>
 40c:	89 c3                	mov    %eax,%ebx
    return -1;
  if ((uint)stack % PGSIZE) {
 40e:	25 ff 0f 00 00       	and    $0xfff,%eax
 413:	75 23                	jne    438 <thread_create+0x48>
    stack = stack + (4096 - (uint)stack % PGSIZE);
  }
  int r = clone(start_routine, arg1, arg2, stack);
 415:	53                   	push   %ebx
 416:	ff 75 10             	pushl  0x10(%ebp)
 419:	ff 75 0c             	pushl  0xc(%ebp)
 41c:	ff 75 08             	pushl  0x8(%ebp)
 41f:	e8 9f 01 00 00       	call   5c3 <clone>
  if (r == -1)
 424:	83 c4 10             	add    $0x10,%esp
 427:	83 f8 ff             	cmp    $0xffffffff,%eax
 42a:	74 1c                	je     448 <thread_create+0x58>
    free(stack);
  return r;
}
 42c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 42f:	c9                   	leave  
 430:	c3                   	ret    
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    stack = stack + (4096 - (uint)stack % PGSIZE);
 438:	29 c3                	sub    %eax,%ebx
 43a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 440:	eb d3                	jmp    415 <thread_create+0x25>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(stack);
 448:	83 ec 0c             	sub    $0xc,%esp
 44b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 44e:	53                   	push   %ebx
 44f:	e8 0c 04 00 00       	call   860 <free>
 454:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 457:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(stack);
 45a:	83 c4 10             	add    $0x10,%esp
}
 45d:	c9                   	leave  
 45e:	c3                   	ret    
    return -1;
 45f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 464:	eb c6                	jmp    42c <thread_create+0x3c>
 466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46d:	8d 76 00             	lea    0x0(%esi),%esi

00000470 <thread_join>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_join() {
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	56                   	push   %esi
 478:	83 ec 20             	sub    $0x20,%esp
  // 
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 47b:	6a 04                	push   $0x4
 47d:	e8 6e 04 00 00       	call   8f0 <malloc>
  int pidThread = join(stack);
 482:	89 04 24             	mov    %eax,(%esp)
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 485:	89 c6                	mov    %eax,%esi
  int pidThread = join(stack);
 487:	e8 3f 01 00 00       	call   5cb <join>
  if (pidThread != -1) {
 48c:	83 c4 10             	add    $0x10,%esp
 48f:	83 f8 ff             	cmp    $0xffffffff,%eax
 492:	74 12                	je     4a6 <thread_join+0x36>
    // if stack is not allocated correctly => free stack
    free(stack);
 494:	83 ec 0c             	sub    $0xc,%esp
 497:	89 45 f4             	mov    %eax,-0xc(%ebp)
 49a:	56                   	push   %esi
 49b:	e8 c0 03 00 00       	call   860 <free>
 4a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a3:	83 c4 10             	add    $0x10,%esp
  }

  return pidThread;
}
 4a6:	8b 75 fc             	mov    -0x4(%ebp),%esi
 4a9:	c9                   	leave  
 4aa:	c3                   	ret    
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop

000004b0 <lock_init>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_init(lock_t * lock) {
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 4ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 4c0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004d0 <lock_aquire>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_aquire(lock_t * lock) {
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 4d5:	ba 01 00 00 00       	mov    $0x1,%edx
void lock_aquire(lock_t * lock) {
 4da:	89 e5                	mov    %esp,%ebp
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
    __asm__ volatile("lock; xaddl %0, %1"
 4df:	f0 0f c1 10          	lock xadd %edx,(%eax)
  int myTurn = fetch_and_add(&lock->ticket, 1);
  while(lock->turn != myTurn)
 4e3:	3b 50 04             	cmp    0x4(%eax),%edx
 4e6:	74 12                	je     4fa <lock_aquire+0x2a>
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
    __sync_synchronize();
 4f0:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  while(lock->turn != myTurn)
 4f5:	39 50 04             	cmp    %edx,0x4(%eax)
 4f8:	75 f6                	jne    4f0 <lock_aquire+0x20>
}
 4fa:	5d                   	pop    %ebp
 4fb:	c3                   	ret    
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000500 <lock_release>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_release(lock_t * lock) {
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 505:	b8 01 00 00 00       	mov    $0x1,%eax
void lock_release(lock_t * lock) {
 50a:	89 e5                	mov    %esp,%ebp
 50c:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 50f:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
 514:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 519:	5d                   	pop    %ebp
 51a:	c3                   	ret    

0000051b <fork>:
 51b:	b8 01 00 00 00       	mov    $0x1,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <exit>:
 523:	b8 02 00 00 00       	mov    $0x2,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <wait>:
 52b:	b8 03 00 00 00       	mov    $0x3,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <pipe>:
 533:	b8 04 00 00 00       	mov    $0x4,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <read>:
 53b:	b8 05 00 00 00       	mov    $0x5,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <write>:
 543:	b8 10 00 00 00       	mov    $0x10,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <close>:
 54b:	b8 15 00 00 00       	mov    $0x15,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <kill>:
 553:	b8 06 00 00 00       	mov    $0x6,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <exec>:
 55b:	b8 07 00 00 00       	mov    $0x7,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <open>:
 563:	b8 0f 00 00 00       	mov    $0xf,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <mknod>:
 56b:	b8 11 00 00 00       	mov    $0x11,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <unlink>:
 573:	b8 12 00 00 00       	mov    $0x12,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <fstat>:
 57b:	b8 08 00 00 00       	mov    $0x8,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <link>:
 583:	b8 13 00 00 00       	mov    $0x13,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <mkdir>:
 58b:	b8 14 00 00 00       	mov    $0x14,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <chdir>:
 593:	b8 09 00 00 00       	mov    $0x9,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <dup>:
 59b:	b8 0a 00 00 00       	mov    $0xa,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <getpid>:
 5a3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <sbrk>:
 5ab:	b8 0c 00 00 00       	mov    $0xc,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <sleep>:
 5b3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <uptime>:
 5bb:	b8 0e 00 00 00       	mov    $0xe,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <clone>:
 5c3:	b8 16 00 00 00       	mov    $0x16,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <join>:
 5cb:	b8 17 00 00 00       	mov    $0x17,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    
 5d3:	66 90                	xchg   %ax,%ax
 5d5:	66 90                	xchg   %ax,%ax
 5d7:	66 90                	xchg   %ax,%ax
 5d9:	66 90                	xchg   %ax,%ax
 5db:	66 90                	xchg   %ax,%ax
 5dd:	66 90                	xchg   %ax,%ax
 5df:	90                   	nop

000005e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 3c             	sub    $0x3c,%esp
 5e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ec:	89 d1                	mov    %edx,%ecx
{
 5ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5f1:	85 d2                	test   %edx,%edx
 5f3:	0f 89 7f 00 00 00    	jns    678 <printint+0x98>
 5f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5fd:	74 79                	je     678 <printint+0x98>
    neg = 1;
 5ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 606:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 608:	31 db                	xor    %ebx,%ebx
 60a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 610:	89 c8                	mov    %ecx,%eax
 612:	31 d2                	xor    %edx,%edx
 614:	89 cf                	mov    %ecx,%edi
 616:	f7 75 c4             	divl   -0x3c(%ebp)
 619:	0f b6 92 38 0a 00 00 	movzbl 0xa38(%edx),%edx
 620:	89 45 c0             	mov    %eax,-0x40(%ebp)
 623:	89 d8                	mov    %ebx,%eax
 625:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 628:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 62b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 62e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 631:	76 dd                	jbe    610 <printint+0x30>
  if(neg)
 633:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 636:	85 c9                	test   %ecx,%ecx
 638:	74 0c                	je     646 <printint+0x66>
    buf[i++] = '-';
 63a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 63f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 641:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 646:	8b 7d b8             	mov    -0x48(%ebp),%edi
 649:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 64d:	eb 07                	jmp    656 <printint+0x76>
 64f:	90                   	nop
 650:	0f b6 13             	movzbl (%ebx),%edx
 653:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 656:	83 ec 04             	sub    $0x4,%esp
 659:	88 55 d7             	mov    %dl,-0x29(%ebp)
 65c:	6a 01                	push   $0x1
 65e:	56                   	push   %esi
 65f:	57                   	push   %edi
 660:	e8 de fe ff ff       	call   543 <write>
  while(--i >= 0)
 665:	83 c4 10             	add    $0x10,%esp
 668:	39 de                	cmp    %ebx,%esi
 66a:	75 e4                	jne    650 <printint+0x70>
    putc(fd, buf[i]);
}
 66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 678:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 67f:	eb 87                	jmp    608 <printint+0x28>
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop

00000690 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 690:	f3 0f 1e fb          	endbr32 
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	57                   	push   %edi
 698:	56                   	push   %esi
 699:	53                   	push   %ebx
 69a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 69d:	8b 75 0c             	mov    0xc(%ebp),%esi
 6a0:	0f b6 1e             	movzbl (%esi),%ebx
 6a3:	84 db                	test   %bl,%bl
 6a5:	0f 84 b4 00 00 00    	je     75f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6ab:	8d 45 10             	lea    0x10(%ebp),%eax
 6ae:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6b1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6b4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b9:	eb 33                	jmp    6ee <printf+0x5e>
 6bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6bf:	90                   	nop
 6c0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6c3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6c8:	83 f8 25             	cmp    $0x25,%eax
 6cb:	74 17                	je     6e4 <printf+0x54>
  write(fd, &c, 1);
 6cd:	83 ec 04             	sub    $0x4,%esp
 6d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6d3:	6a 01                	push   $0x1
 6d5:	57                   	push   %edi
 6d6:	ff 75 08             	pushl  0x8(%ebp)
 6d9:	e8 65 fe ff ff       	call   543 <write>
 6de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6e1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6e4:	0f b6 1e             	movzbl (%esi),%ebx
 6e7:	83 c6 01             	add    $0x1,%esi
 6ea:	84 db                	test   %bl,%bl
 6ec:	74 71                	je     75f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ee:	0f be cb             	movsbl %bl,%ecx
 6f1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6f4:	85 d2                	test   %edx,%edx
 6f6:	74 c8                	je     6c0 <printf+0x30>
      }
    } else if(state == '%'){
 6f8:	83 fa 25             	cmp    $0x25,%edx
 6fb:	75 e7                	jne    6e4 <printf+0x54>
      if(c == 'd'){
 6fd:	83 f8 64             	cmp    $0x64,%eax
 700:	0f 84 9a 00 00 00    	je     7a0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 706:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 70c:	83 f9 70             	cmp    $0x70,%ecx
 70f:	74 5f                	je     770 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 711:	83 f8 73             	cmp    $0x73,%eax
 714:	0f 84 d6 00 00 00    	je     7f0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 71a:	83 f8 63             	cmp    $0x63,%eax
 71d:	0f 84 8d 00 00 00    	je     7b0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 723:	83 f8 25             	cmp    $0x25,%eax
 726:	0f 84 b4 00 00 00    	je     7e0 <printf+0x150>
  write(fd, &c, 1);
 72c:	83 ec 04             	sub    $0x4,%esp
 72f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 733:	6a 01                	push   $0x1
 735:	57                   	push   %edi
 736:	ff 75 08             	pushl  0x8(%ebp)
 739:	e8 05 fe ff ff       	call   543 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 73e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 741:	83 c4 0c             	add    $0xc,%esp
 744:	6a 01                	push   $0x1
 746:	83 c6 01             	add    $0x1,%esi
 749:	57                   	push   %edi
 74a:	ff 75 08             	pushl  0x8(%ebp)
 74d:	e8 f1 fd ff ff       	call   543 <write>
  for(i = 0; fmt[i]; i++){
 752:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 756:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 759:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 75b:	84 db                	test   %bl,%bl
 75d:	75 8f                	jne    6ee <printf+0x5e>
    }
  }
}
 75f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 762:	5b                   	pop    %ebx
 763:	5e                   	pop    %esi
 764:	5f                   	pop    %edi
 765:	5d                   	pop    %ebp
 766:	c3                   	ret    
 767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 10 00 00 00       	mov    $0x10,%ecx
 778:	6a 00                	push   $0x0
 77a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	8b 13                	mov    (%ebx),%edx
 782:	e8 59 fe ff ff       	call   5e0 <printint>
        ap++;
 787:	89 d8                	mov    %ebx,%eax
 789:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78c:	31 d2                	xor    %edx,%edx
        ap++;
 78e:	83 c0 04             	add    $0x4,%eax
 791:	89 45 d0             	mov    %eax,-0x30(%ebp)
 794:	e9 4b ff ff ff       	jmp    6e4 <printf+0x54>
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7a0:	83 ec 0c             	sub    $0xc,%esp
 7a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7a8:	6a 01                	push   $0x1
 7aa:	eb ce                	jmp    77a <printf+0xea>
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7b6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7b8:	6a 01                	push   $0x1
        ap++;
 7ba:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7bd:	57                   	push   %edi
 7be:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7c1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7c4:	e8 7a fd ff ff       	call   543 <write>
        ap++;
 7c9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7cf:	31 d2                	xor    %edx,%edx
 7d1:	e9 0e ff ff ff       	jmp    6e4 <printf+0x54>
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7e3:	83 ec 04             	sub    $0x4,%esp
 7e6:	e9 59 ff ff ff       	jmp    744 <printf+0xb4>
 7eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
        s = (char*)*ap;
 7f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7f3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7f5:	83 c0 04             	add    $0x4,%eax
 7f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7fb:	85 db                	test   %ebx,%ebx
 7fd:	74 17                	je     816 <printf+0x186>
        while(*s != 0){
 7ff:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 802:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 804:	84 c0                	test   %al,%al
 806:	0f 84 d8 fe ff ff    	je     6e4 <printf+0x54>
 80c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 80f:	89 de                	mov    %ebx,%esi
 811:	8b 5d 08             	mov    0x8(%ebp),%ebx
 814:	eb 1a                	jmp    830 <printf+0x1a0>
          s = "(null)";
 816:	bb 2f 0a 00 00       	mov    $0xa2f,%ebx
        while(*s != 0){
 81b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 81e:	b8 28 00 00 00       	mov    $0x28,%eax
 823:	89 de                	mov    %ebx,%esi
 825:	8b 5d 08             	mov    0x8(%ebp),%ebx
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
  write(fd, &c, 1);
 830:	83 ec 04             	sub    $0x4,%esp
          s++;
 833:	83 c6 01             	add    $0x1,%esi
 836:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 839:	6a 01                	push   $0x1
 83b:	57                   	push   %edi
 83c:	53                   	push   %ebx
 83d:	e8 01 fd ff ff       	call   543 <write>
        while(*s != 0){
 842:	0f b6 06             	movzbl (%esi),%eax
 845:	83 c4 10             	add    $0x10,%esp
 848:	84 c0                	test   %al,%al
 84a:	75 e4                	jne    830 <printf+0x1a0>
 84c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 84f:	31 d2                	xor    %edx,%edx
 851:	e9 8e fe ff ff       	jmp    6e4 <printf+0x54>
 856:	66 90                	xchg   %ax,%ax
 858:	66 90                	xchg   %ax,%ax
 85a:	66 90                	xchg   %ax,%ax
 85c:	66 90                	xchg   %ax,%ax
 85e:	66 90                	xchg   %ax,%ax

00000860 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 860:	f3 0f 1e fb          	endbr32 
 864:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 865:	a1 e0 0d 00 00       	mov    0xde0,%eax
{
 86a:	89 e5                	mov    %esp,%ebp
 86c:	57                   	push   %edi
 86d:	56                   	push   %esi
 86e:	53                   	push   %ebx
 86f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 872:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 874:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 877:	39 c8                	cmp    %ecx,%eax
 879:	73 15                	jae    890 <free+0x30>
 87b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
 880:	39 d1                	cmp    %edx,%ecx
 882:	72 14                	jb     898 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 884:	39 d0                	cmp    %edx,%eax
 886:	73 10                	jae    898 <free+0x38>
{
 888:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88a:	8b 10                	mov    (%eax),%edx
 88c:	39 c8                	cmp    %ecx,%eax
 88e:	72 f0                	jb     880 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 890:	39 d0                	cmp    %edx,%eax
 892:	72 f4                	jb     888 <free+0x28>
 894:	39 d1                	cmp    %edx,%ecx
 896:	73 f0                	jae    888 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 898:	8b 73 fc             	mov    -0x4(%ebx),%esi
 89b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 89e:	39 fa                	cmp    %edi,%edx
 8a0:	74 1e                	je     8c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8a5:	8b 50 04             	mov    0x4(%eax),%edx
 8a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8ab:	39 f1                	cmp    %esi,%ecx
 8ad:	74 28                	je     8d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8af:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 8b1:	5b                   	pop    %ebx
  freep = p;
 8b2:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 8b7:	5e                   	pop    %esi
 8b8:	5f                   	pop    %edi
 8b9:	5d                   	pop    %ebp
 8ba:	c3                   	ret    
 8bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8bf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 8c0:	03 72 04             	add    0x4(%edx),%esi
 8c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8c6:	8b 10                	mov    (%eax),%edx
 8c8:	8b 12                	mov    (%edx),%edx
 8ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8cd:	8b 50 04             	mov    0x4(%eax),%edx
 8d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8d3:	39 f1                	cmp    %esi,%ecx
 8d5:	75 d8                	jne    8af <free+0x4f>
    p->s.size += bp->s.size;
 8d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8da:	a3 e0 0d 00 00       	mov    %eax,0xde0
    p->s.size += bp->s.size;
 8df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8e5:	89 10                	mov    %edx,(%eax)
}
 8e7:	5b                   	pop    %ebx
 8e8:	5e                   	pop    %esi
 8e9:	5f                   	pop    %edi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8f0:	f3 0f 1e fb          	endbr32 
 8f4:	55                   	push   %ebp
 8f5:	89 e5                	mov    %esp,%ebp
 8f7:	57                   	push   %edi
 8f8:	56                   	push   %esi
 8f9:	53                   	push   %ebx
 8fa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8fd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 900:	8b 3d e0 0d 00 00    	mov    0xde0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 906:	8d 70 07             	lea    0x7(%eax),%esi
 909:	c1 ee 03             	shr    $0x3,%esi
 90c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 90f:	85 ff                	test   %edi,%edi
 911:	0f 84 a9 00 00 00    	je     9c0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 917:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 919:	8b 48 04             	mov    0x4(%eax),%ecx
 91c:	39 f1                	cmp    %esi,%ecx
 91e:	73 6d                	jae    98d <malloc+0x9d>
 920:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 926:	bb 00 10 00 00       	mov    $0x1000,%ebx
 92b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 92e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 935:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 938:	eb 17                	jmp    951 <malloc+0x61>
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 940:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 942:	8b 4a 04             	mov    0x4(%edx),%ecx
 945:	39 f1                	cmp    %esi,%ecx
 947:	73 4f                	jae    998 <malloc+0xa8>
 949:	8b 3d e0 0d 00 00    	mov    0xde0,%edi
 94f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 951:	39 c7                	cmp    %eax,%edi
 953:	75 eb                	jne    940 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	ff 75 e4             	pushl  -0x1c(%ebp)
 95b:	e8 4b fc ff ff       	call   5ab <sbrk>
  if(p == (char*)-1)
 960:	83 c4 10             	add    $0x10,%esp
 963:	83 f8 ff             	cmp    $0xffffffff,%eax
 966:	74 1b                	je     983 <malloc+0x93>
  hp->s.size = nu;
 968:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 96b:	83 ec 0c             	sub    $0xc,%esp
 96e:	83 c0 08             	add    $0x8,%eax
 971:	50                   	push   %eax
 972:	e8 e9 fe ff ff       	call   860 <free>
  return freep;
 977:	a1 e0 0d 00 00       	mov    0xde0,%eax
      if((p = morecore(nunits)) == 0)
 97c:	83 c4 10             	add    $0x10,%esp
 97f:	85 c0                	test   %eax,%eax
 981:	75 bd                	jne    940 <malloc+0x50>
        return 0;
  }
}
 983:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 986:	31 c0                	xor    %eax,%eax
}
 988:	5b                   	pop    %ebx
 989:	5e                   	pop    %esi
 98a:	5f                   	pop    %edi
 98b:	5d                   	pop    %ebp
 98c:	c3                   	ret    
    if(p->s.size >= nunits){
 98d:	89 c2                	mov    %eax,%edx
 98f:	89 f8                	mov    %edi,%eax
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 998:	39 ce                	cmp    %ecx,%esi
 99a:	74 54                	je     9f0 <malloc+0x100>
        p->s.size -= nunits;
 99c:	29 f1                	sub    %esi,%ecx
 99e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 9a1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 9a4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 9a7:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 9ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9af:	8d 42 08             	lea    0x8(%edx),%eax
}
 9b2:	5b                   	pop    %ebx
 9b3:	5e                   	pop    %esi
 9b4:	5f                   	pop    %edi
 9b5:	5d                   	pop    %ebp
 9b6:	c3                   	ret    
 9b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9be:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 9c0:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 9c7:	0d 00 00 
    base.s.size = 0;
 9ca:	bf e4 0d 00 00       	mov    $0xde4,%edi
    base.s.ptr = freep = prevp = &base;
 9cf:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 9d6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 9db:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 9e2:	00 00 00 
    if(p->s.size >= nunits){
 9e5:	e9 36 ff ff ff       	jmp    920 <malloc+0x30>
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 0a                	mov    (%edx),%ecx
 9f2:	89 08                	mov    %ecx,(%eax)
 9f4:	eb b1                	jmp    9a7 <malloc+0xb7>
