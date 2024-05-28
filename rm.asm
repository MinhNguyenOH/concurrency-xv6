
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  12:	bf 01 00 00 00       	mov    $0x1,%edi
  17:	56                   	push   %esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 08             	sub    $0x8,%esp
  1d:	8b 59 04             	mov    0x4(%ecx),%ebx
  20:	8b 31                	mov    (%ecx),%esi
  22:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  25:	83 fe 01             	cmp    $0x1,%esi
  28:	7e 3a                	jle    64 <main+0x64>
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 29 04 00 00       	call   463 <unlink>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 c3 03 00 00       	call   413 <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 fc 08 00 00       	push   $0x8fc
  58:	6a 02                	push   $0x2
  5a:	e8 21 05 00 00       	call   580 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: rm files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 e8 08 00 00       	push   $0x8e8
  6b:	6a 02                	push   $0x2
  6d:	e8 0e 05 00 00       	call   580 <printf>
    exit();
  72:	e8 9c 03 00 00       	call   413 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "x86.h"
#include "mmu.h"  // PGSIZE // Code added by Greg, Shawn, and Minh, Homework 6

char*
strcpy(char *s, const char *t)
{
  80:	f3 0f 1e fb          	endbr32 
  84:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  85:	31 c0                	xor    %eax,%eax
{
  87:	89 e5                	mov    %esp,%ebp
  89:	53                   	push   %ebx
  8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	89 c8                	mov    %ecx,%eax
  a0:	5b                   	pop    %ebx
  a1:	5d                   	pop    %ebp
  a2:	c3                   	ret    
  a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	53                   	push   %ebx
  b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  be:	0f b6 01             	movzbl (%ecx),%eax
  c1:	0f b6 1a             	movzbl (%edx),%ebx
  c4:	84 c0                	test   %al,%al
  c6:	75 19                	jne    e1 <strcmp+0x31>
  c8:	eb 26                	jmp    f0 <strcmp+0x40>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  d4:	83 c1 01             	add    $0x1,%ecx
  d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  da:	0f b6 1a             	movzbl (%edx),%ebx
  dd:	84 c0                	test   %al,%al
  df:	74 0f                	je     f0 <strcmp+0x40>
  e1:	38 d8                	cmp    %bl,%al
  e3:	74 eb                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  e5:	29 d8                	sub    %ebx,%eax
}
  e7:	5b                   	pop    %ebx
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fe:	66 90                	xchg   %ax,%ax

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 10a:	80 3a 00             	cmpb   $0x0,(%edx)
 10d:	74 21                	je     130 <strlen+0x30>
 10f:	31 c0                	xor    %eax,%eax
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 118:	83 c0 01             	add    $0x1,%eax
 11b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 11f:	89 c1                	mov    %eax,%ecx
 121:	75 f5                	jne    118 <strlen+0x18>
    ;
  return n;
}
 123:	89 c8                	mov    %ecx,%eax
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	57                   	push   %edi
 148:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 14b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	89 d7                	mov    %edx,%edi
 153:	fc                   	cld    
 154:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 156:	89 d0                	mov    %edx,%eax
 158:	5f                   	pop    %edi
 159:	5d                   	pop    %ebp
 15a:	c3                   	ret    
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	8b 45 08             	mov    0x8(%ebp),%eax
 16a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16e:	0f b6 10             	movzbl (%eax),%edx
 171:	84 d2                	test   %dl,%dl
 173:	75 16                	jne    18b <strchr+0x2b>
 175:	eb 21                	jmp    198 <strchr+0x38>
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax
 180:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 184:	83 c0 01             	add    $0x1,%eax
 187:	84 d2                	test   %dl,%dl
 189:	74 0d                	je     198 <strchr+0x38>
    if(*s == c)
 18b:	38 d1                	cmp    %dl,%cl
 18d:	75 f1                	jne    180 <strchr+0x20>
      return (char*)s;
  return 0;
}
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 198:	31 c0                	xor    %eax,%eax
}
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	57                   	push   %edi
 1a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a9:	31 f6                	xor    %esi,%esi
{
 1ab:	53                   	push   %ebx
 1ac:	89 f3                	mov    %esi,%ebx
 1ae:	83 ec 1c             	sub    $0x1c,%esp
 1b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1b4:	eb 33                	jmp    1e9 <gets+0x49>
 1b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1c6:	6a 01                	push   $0x1
 1c8:	50                   	push   %eax
 1c9:	6a 00                	push   $0x0
 1cb:	e8 5b 02 00 00       	call   42b <read>
    if(cc < 1)
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	85 c0                	test   %eax,%eax
 1d5:	7e 1c                	jle    1f3 <gets+0x53>
      break;
    buf[i++] = c;
 1d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1db:	83 c7 01             	add    $0x1,%edi
 1de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1e1:	3c 0a                	cmp    $0xa,%al
 1e3:	74 23                	je     208 <gets+0x68>
 1e5:	3c 0d                	cmp    $0xd,%al
 1e7:	74 1f                	je     208 <gets+0x68>
  for(i=0; i+1 < max; ){
 1e9:	83 c3 01             	add    $0x1,%ebx
 1ec:	89 fe                	mov    %edi,%esi
 1ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f1:	7c cd                	jl     1c0 <gets+0x20>
 1f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1f8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fe:	5b                   	pop    %ebx
 1ff:	5e                   	pop    %esi
 200:	5f                   	pop    %edi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	8b 75 08             	mov    0x8(%ebp),%esi
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	01 de                	add    %ebx,%esi
 210:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 212:	c6 03 00             	movb   $0x0,(%ebx)
}
 215:	8d 65 f4             	lea    -0xc(%ebp),%esp
 218:	5b                   	pop    %ebx
 219:	5e                   	pop    %esi
 21a:	5f                   	pop    %edi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi

00000220 <stat>:

int
stat(const char *n, struct stat *st)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	6a 00                	push   $0x0
 22e:	ff 75 08             	pushl  0x8(%ebp)
 231:	e8 1d 02 00 00       	call   453 <open>
  if(fd < 0)
 236:	83 c4 10             	add    $0x10,%esp
 239:	85 c0                	test   %eax,%eax
 23b:	78 2b                	js     268 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 23d:	83 ec 08             	sub    $0x8,%esp
 240:	ff 75 0c             	pushl  0xc(%ebp)
 243:	89 c3                	mov    %eax,%ebx
 245:	50                   	push   %eax
 246:	e8 20 02 00 00       	call   46b <fstat>
  close(fd);
 24b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 24e:	89 c6                	mov    %eax,%esi
  close(fd);
 250:	e8 e6 01 00 00       	call   43b <close>
  return r;
 255:	83 c4 10             	add    $0x10,%esp
}
 258:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25b:	89 f0                	mov    %esi,%eax
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 268:	be ff ff ff ff       	mov    $0xffffffff,%esi
 26d:	eb e9                	jmp    258 <stat+0x38>
 26f:	90                   	nop

00000270 <atoi>:

int
atoi(const char *s)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	53                   	push   %ebx
 278:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27b:	0f be 02             	movsbl (%edx),%eax
 27e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 281:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 284:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 289:	77 1a                	ja     2a5 <atoi+0x35>
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop
    n = n*10 + *s++ - '0';
 290:	83 c2 01             	add    $0x1,%edx
 293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 29a:	0f be 02             	movsbl (%edx),%eax
 29d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
  return n;
}
 2a5:	89 c8                	mov    %ecx,%eax
 2a7:	5b                   	pop    %ebx
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	8b 45 10             	mov    0x10(%ebp),%eax
 2bb:	8b 55 08             	mov    0x8(%ebp),%edx
 2be:	56                   	push   %esi
 2bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c2:	85 c0                	test   %eax,%eax
 2c4:	7e 0f                	jle    2d5 <memmove+0x25>
 2c6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2c8:	89 d7                	mov    %edx,%edi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2d1:	39 f8                	cmp    %edi,%eax
 2d3:	75 fb                	jne    2d0 <memmove+0x20>
  return vdst;
}
 2d5:	5e                   	pop    %esi
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <thread_create>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	83 ec 20             	sub    $0x20,%esp
  void *stack = malloc(PGSIZE*2);
 2eb:	68 00 20 00 00       	push   $0x2000
 2f0:	e8 eb 04 00 00       	call   7e0 <malloc>
  if (stack == 0)
 2f5:	83 c4 10             	add    $0x10,%esp
 2f8:	85 c0                	test   %eax,%eax
 2fa:	74 53                	je     34f <thread_create+0x6f>
 2fc:	89 c3                	mov    %eax,%ebx
    return -1;
  if ((uint)stack % PGSIZE) {
 2fe:	25 ff 0f 00 00       	and    $0xfff,%eax
 303:	75 23                	jne    328 <thread_create+0x48>
    stack = stack + (4096 - (uint)stack % PGSIZE);
  }
  int r = clone(start_routine, arg1, arg2, stack);
 305:	53                   	push   %ebx
 306:	ff 75 10             	pushl  0x10(%ebp)
 309:	ff 75 0c             	pushl  0xc(%ebp)
 30c:	ff 75 08             	pushl  0x8(%ebp)
 30f:	e8 9f 01 00 00       	call   4b3 <clone>
  if (r == -1)
 314:	83 c4 10             	add    $0x10,%esp
 317:	83 f8 ff             	cmp    $0xffffffff,%eax
 31a:	74 1c                	je     338 <thread_create+0x58>
    free(stack);
  return r;
}
 31c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 31f:	c9                   	leave  
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    stack = stack + (4096 - (uint)stack % PGSIZE);
 328:	29 c3                	sub    %eax,%ebx
 32a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 330:	eb d3                	jmp    305 <thread_create+0x25>
 332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(stack);
 338:	83 ec 0c             	sub    $0xc,%esp
 33b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 33e:	53                   	push   %ebx
 33f:	e8 0c 04 00 00       	call   750 <free>
 344:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(stack);
 34a:	83 c4 10             	add    $0x10,%esp
}
 34d:	c9                   	leave  
 34e:	c3                   	ret    
    return -1;
 34f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 354:	eb c6                	jmp    31c <thread_create+0x3c>
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <thread_join>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_join() {
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	56                   	push   %esi
 368:	83 ec 20             	sub    $0x20,%esp
  // 
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 36b:	6a 04                	push   $0x4
 36d:	e8 6e 04 00 00       	call   7e0 <malloc>
  int pidThread = join(stack);
 372:	89 04 24             	mov    %eax,(%esp)
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 375:	89 c6                	mov    %eax,%esi
  int pidThread = join(stack);
 377:	e8 3f 01 00 00       	call   4bb <join>
  if (pidThread != -1) {
 37c:	83 c4 10             	add    $0x10,%esp
 37f:	83 f8 ff             	cmp    $0xffffffff,%eax
 382:	74 12                	je     396 <thread_join+0x36>
    // if stack is not allocated correctly => free stack
    free(stack);
 384:	83 ec 0c             	sub    $0xc,%esp
 387:	89 45 f4             	mov    %eax,-0xc(%ebp)
 38a:	56                   	push   %esi
 38b:	e8 c0 03 00 00       	call   750 <free>
 390:	8b 45 f4             	mov    -0xc(%ebp),%eax
 393:	83 c4 10             	add    $0x10,%esp
  }

  return pidThread;
}
 396:	8b 75 fc             	mov    -0x4(%ebp),%esi
 399:	c9                   	leave  
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <lock_init>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_init(lock_t * lock) {
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3b0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <lock_aquire>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_aquire(lock_t * lock) {
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 3c5:	ba 01 00 00 00       	mov    $0x1,%edx
void lock_aquire(lock_t * lock) {
 3ca:	89 e5                	mov    %esp,%ebp
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
    __asm__ volatile("lock; xaddl %0, %1"
 3cf:	f0 0f c1 10          	lock xadd %edx,(%eax)
  int myTurn = fetch_and_add(&lock->ticket, 1);
  while(lock->turn != myTurn)
 3d3:	3b 50 04             	cmp    0x4(%eax),%edx
 3d6:	74 12                	je     3ea <lock_aquire+0x2a>
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
    __sync_synchronize();
 3e0:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  while(lock->turn != myTurn)
 3e5:	39 50 04             	cmp    %edx,0x4(%eax)
 3e8:	75 f6                	jne    3e0 <lock_aquire+0x20>
}
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <lock_release>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_release(lock_t * lock) {
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 3f5:	b8 01 00 00 00       	mov    $0x1,%eax
void lock_release(lock_t * lock) {
 3fa:	89 e5                	mov    %esp,%ebp
 3fc:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 3ff:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
 404:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <fork>:
 40b:	b8 01 00 00 00       	mov    $0x1,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <exit>:
 413:	b8 02 00 00 00       	mov    $0x2,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <wait>:
 41b:	b8 03 00 00 00       	mov    $0x3,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <pipe>:
 423:	b8 04 00 00 00       	mov    $0x4,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <read>:
 42b:	b8 05 00 00 00       	mov    $0x5,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <write>:
 433:	b8 10 00 00 00       	mov    $0x10,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <close>:
 43b:	b8 15 00 00 00       	mov    $0x15,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <kill>:
 443:	b8 06 00 00 00       	mov    $0x6,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <exec>:
 44b:	b8 07 00 00 00       	mov    $0x7,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <open>:
 453:	b8 0f 00 00 00       	mov    $0xf,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mknod>:
 45b:	b8 11 00 00 00       	mov    $0x11,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <unlink>:
 463:	b8 12 00 00 00       	mov    $0x12,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <fstat>:
 46b:	b8 08 00 00 00       	mov    $0x8,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <link>:
 473:	b8 13 00 00 00       	mov    $0x13,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <mkdir>:
 47b:	b8 14 00 00 00       	mov    $0x14,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <chdir>:
 483:	b8 09 00 00 00       	mov    $0x9,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <dup>:
 48b:	b8 0a 00 00 00       	mov    $0xa,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getpid>:
 493:	b8 0b 00 00 00       	mov    $0xb,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <sbrk>:
 49b:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sleep>:
 4a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <uptime>:
 4ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <clone>:
 4b3:	b8 16 00 00 00       	mov    $0x16,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <join>:
 4bb:	b8 17 00 00 00       	mov    $0x17,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    
 4c3:	66 90                	xchg   %ax,%ax
 4c5:	66 90                	xchg   %ax,%ax
 4c7:	66 90                	xchg   %ax,%ax
 4c9:	66 90                	xchg   %ax,%ax
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
 4d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4dc:	89 d1                	mov    %edx,%ecx
{
 4de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4e1:	85 d2                	test   %edx,%edx
 4e3:	0f 89 7f 00 00 00    	jns    568 <printint+0x98>
 4e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ed:	74 79                	je     568 <printint+0x98>
    neg = 1;
 4ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4f8:	31 db                	xor    %ebx,%ebx
 4fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 c8                	mov    %ecx,%eax
 502:	31 d2                	xor    %edx,%edx
 504:	89 cf                	mov    %ecx,%edi
 506:	f7 75 c4             	divl   -0x3c(%ebp)
 509:	0f b6 92 1c 09 00 00 	movzbl 0x91c(%edx),%edx
 510:	89 45 c0             	mov    %eax,-0x40(%ebp)
 513:	89 d8                	mov    %ebx,%eax
 515:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 518:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 51b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 51e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 521:	76 dd                	jbe    500 <printint+0x30>
  if(neg)
 523:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 526:	85 c9                	test   %ecx,%ecx
 528:	74 0c                	je     536 <printint+0x66>
    buf[i++] = '-';
 52a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 52f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 531:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 536:	8b 7d b8             	mov    -0x48(%ebp),%edi
 539:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 53d:	eb 07                	jmp    546 <printint+0x76>
 53f:	90                   	nop
 540:	0f b6 13             	movzbl (%ebx),%edx
 543:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 546:	83 ec 04             	sub    $0x4,%esp
 549:	88 55 d7             	mov    %dl,-0x29(%ebp)
 54c:	6a 01                	push   $0x1
 54e:	56                   	push   %esi
 54f:	57                   	push   %edi
 550:	e8 de fe ff ff       	call   433 <write>
  while(--i >= 0)
 555:	83 c4 10             	add    $0x10,%esp
 558:	39 de                	cmp    %ebx,%esi
 55a:	75 e4                	jne    540 <printint+0x70>
    putc(fd, buf[i]);
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 568:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 56f:	eb 87                	jmp    4f8 <printint+0x28>
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	57                   	push   %edi
 588:	56                   	push   %esi
 589:	53                   	push   %ebx
 58a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 58d:	8b 75 0c             	mov    0xc(%ebp),%esi
 590:	0f b6 1e             	movzbl (%esi),%ebx
 593:	84 db                	test   %bl,%bl
 595:	0f 84 b4 00 00 00    	je     64f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 59b:	8d 45 10             	lea    0x10(%ebp),%eax
 59e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5a1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5a4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a9:	eb 33                	jmp    5de <printf+0x5e>
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
 5b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5b8:	83 f8 25             	cmp    $0x25,%eax
 5bb:	74 17                	je     5d4 <printf+0x54>
  write(fd, &c, 1);
 5bd:	83 ec 04             	sub    $0x4,%esp
 5c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5c3:	6a 01                	push   $0x1
 5c5:	57                   	push   %edi
 5c6:	ff 75 08             	pushl  0x8(%ebp)
 5c9:	e8 65 fe ff ff       	call   433 <write>
 5ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5d4:	0f b6 1e             	movzbl (%esi),%ebx
 5d7:	83 c6 01             	add    $0x1,%esi
 5da:	84 db                	test   %bl,%bl
 5dc:	74 71                	je     64f <printf+0xcf>
    c = fmt[i] & 0xff;
 5de:	0f be cb             	movsbl %bl,%ecx
 5e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5e4:	85 d2                	test   %edx,%edx
 5e6:	74 c8                	je     5b0 <printf+0x30>
      }
    } else if(state == '%'){
 5e8:	83 fa 25             	cmp    $0x25,%edx
 5eb:	75 e7                	jne    5d4 <printf+0x54>
      if(c == 'd'){
 5ed:	83 f8 64             	cmp    $0x64,%eax
 5f0:	0f 84 9a 00 00 00    	je     690 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5fc:	83 f9 70             	cmp    $0x70,%ecx
 5ff:	74 5f                	je     660 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 601:	83 f8 73             	cmp    $0x73,%eax
 604:	0f 84 d6 00 00 00    	je     6e0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 60a:	83 f8 63             	cmp    $0x63,%eax
 60d:	0f 84 8d 00 00 00    	je     6a0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 613:	83 f8 25             	cmp    $0x25,%eax
 616:	0f 84 b4 00 00 00    	je     6d0 <printf+0x150>
  write(fd, &c, 1);
 61c:	83 ec 04             	sub    $0x4,%esp
 61f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	ff 75 08             	pushl  0x8(%ebp)
 629:	e8 05 fe ff ff       	call   433 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 62e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 631:	83 c4 0c             	add    $0xc,%esp
 634:	6a 01                	push   $0x1
 636:	83 c6 01             	add    $0x1,%esi
 639:	57                   	push   %edi
 63a:	ff 75 08             	pushl  0x8(%ebp)
 63d:	e8 f1 fd ff ff       	call   433 <write>
  for(i = 0; fmt[i]; i++){
 642:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 646:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 649:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 64b:	84 db                	test   %bl,%bl
 64d:	75 8f                	jne    5de <printf+0x5e>
    }
  }
}
 64f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5f                   	pop    %edi
 655:	5d                   	pop    %ebp
 656:	c3                   	ret    
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	8b 13                	mov    (%ebx),%edx
 672:	e8 59 fe ff ff       	call   4d0 <printint>
        ap++;
 677:	89 d8                	mov    %ebx,%eax
 679:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67c:	31 d2                	xor    %edx,%edx
        ap++;
 67e:	83 c0 04             	add    $0x4,%eax
 681:	89 45 d0             	mov    %eax,-0x30(%ebp)
 684:	e9 4b ff ff ff       	jmp    5d4 <printf+0x54>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
 698:	6a 01                	push   $0x1
 69a:	eb ce                	jmp    66a <printf+0xea>
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6a6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6a8:	6a 01                	push   $0x1
        ap++;
 6aa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6ad:	57                   	push   %edi
 6ae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b4:	e8 7a fd ff ff       	call   433 <write>
        ap++;
 6b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 0e ff ff ff       	jmp    5d4 <printf+0x54>
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
 6d6:	e9 59 ff ff ff       	jmp    634 <printf+0xb4>
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
        s = (char*)*ap;
 6e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6e5:	83 c0 04             	add    $0x4,%eax
 6e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6eb:	85 db                	test   %ebx,%ebx
 6ed:	74 17                	je     706 <printf+0x186>
        while(*s != 0){
 6ef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6f2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6f4:	84 c0                	test   %al,%al
 6f6:	0f 84 d8 fe ff ff    	je     5d4 <printf+0x54>
 6fc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ff:	89 de                	mov    %ebx,%esi
 701:	8b 5d 08             	mov    0x8(%ebp),%ebx
 704:	eb 1a                	jmp    720 <printf+0x1a0>
          s = "(null)";
 706:	bb 15 09 00 00       	mov    $0x915,%ebx
        while(*s != 0){
 70b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 70e:	b8 28 00 00 00       	mov    $0x28,%eax
 713:	89 de                	mov    %ebx,%esi
 715:	8b 5d 08             	mov    0x8(%ebp),%ebx
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
          s++;
 723:	83 c6 01             	add    $0x1,%esi
 726:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 729:	6a 01                	push   $0x1
 72b:	57                   	push   %edi
 72c:	53                   	push   %ebx
 72d:	e8 01 fd ff ff       	call   433 <write>
        while(*s != 0){
 732:	0f b6 06             	movzbl (%esi),%eax
 735:	83 c4 10             	add    $0x10,%esp
 738:	84 c0                	test   %al,%al
 73a:	75 e4                	jne    720 <printf+0x1a0>
 73c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 73f:	31 d2                	xor    %edx,%edx
 741:	e9 8e fe ff ff       	jmp    5d4 <printf+0x54>
 746:	66 90                	xchg   %ax,%ax
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	f3 0f 1e fb          	endbr32 
 754:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 755:	a1 88 0c 00 00       	mov    0xc88,%eax
{
 75a:	89 e5                	mov    %esp,%ebp
 75c:	57                   	push   %edi
 75d:	56                   	push   %esi
 75e:	53                   	push   %ebx
 75f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 762:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 764:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 767:	39 c8                	cmp    %ecx,%eax
 769:	73 15                	jae    780 <free+0x30>
 76b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
 770:	39 d1                	cmp    %edx,%ecx
 772:	72 14                	jb     788 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	39 d0                	cmp    %edx,%eax
 776:	73 10                	jae    788 <free+0x38>
{
 778:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77a:	8b 10                	mov    (%eax),%edx
 77c:	39 c8                	cmp    %ecx,%eax
 77e:	72 f0                	jb     770 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 d0                	cmp    %edx,%eax
 782:	72 f4                	jb     778 <free+0x28>
 784:	39 d1                	cmp    %edx,%ecx
 786:	73 f0                	jae    778 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 fa                	cmp    %edi,%edx
 790:	74 1e                	je     7b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 792:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 28                	je     7c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 79f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7a1:	5b                   	pop    %ebx
  freep = p;
 7a2:	a3 88 0c 00 00       	mov    %eax,0xc88
}
 7a7:	5e                   	pop    %esi
 7a8:	5f                   	pop    %edi
 7a9:	5d                   	pop    %ebp
 7aa:	c3                   	ret    
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7b0:	03 72 04             	add    0x4(%edx),%esi
 7b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 12                	mov    (%edx),%edx
 7ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	75 d8                	jne    79f <free+0x4f>
    p->s.size += bp->s.size;
 7c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ca:	a3 88 0c 00 00       	mov    %eax,0xc88
    p->s.size += bp->s.size;
 7cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d5:	89 10                	mov    %edx,(%eax)
}
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	f3 0f 1e fb          	endbr32 
 7e4:	55                   	push   %ebp
 7e5:	89 e5                	mov    %esp,%ebp
 7e7:	57                   	push   %edi
 7e8:	56                   	push   %esi
 7e9:	53                   	push   %ebx
 7ea:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7f0:	8b 3d 88 0c 00 00    	mov    0xc88,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f6:	8d 70 07             	lea    0x7(%eax),%esi
 7f9:	c1 ee 03             	shr    $0x3,%esi
 7fc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7ff:	85 ff                	test   %edi,%edi
 801:	0f 84 a9 00 00 00    	je     8b0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 807:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 809:	8b 48 04             	mov    0x4(%eax),%ecx
 80c:	39 f1                	cmp    %esi,%ecx
 80e:	73 6d                	jae    87d <malloc+0x9d>
 810:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 816:	bb 00 10 00 00       	mov    $0x1000,%ebx
 81b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 81e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 825:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 828:	eb 17                	jmp    841 <malloc+0x61>
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 832:	8b 4a 04             	mov    0x4(%edx),%ecx
 835:	39 f1                	cmp    %esi,%ecx
 837:	73 4f                	jae    888 <malloc+0xa8>
 839:	8b 3d 88 0c 00 00    	mov    0xc88,%edi
 83f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	39 c7                	cmp    %eax,%edi
 843:	75 eb                	jne    830 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	ff 75 e4             	pushl  -0x1c(%ebp)
 84b:	e8 4b fc ff ff       	call   49b <sbrk>
  if(p == (char*)-1)
 850:	83 c4 10             	add    $0x10,%esp
 853:	83 f8 ff             	cmp    $0xffffffff,%eax
 856:	74 1b                	je     873 <malloc+0x93>
  hp->s.size = nu;
 858:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	83 c0 08             	add    $0x8,%eax
 861:	50                   	push   %eax
 862:	e8 e9 fe ff ff       	call   750 <free>
  return freep;
 867:	a1 88 0c 00 00       	mov    0xc88,%eax
      if((p = morecore(nunits)) == 0)
 86c:	83 c4 10             	add    $0x10,%esp
 86f:	85 c0                	test   %eax,%eax
 871:	75 bd                	jne    830 <malloc+0x50>
        return 0;
  }
}
 873:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 876:	31 c0                	xor    %eax,%eax
}
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5f                   	pop    %edi
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret    
    if(p->s.size >= nunits){
 87d:	89 c2                	mov    %eax,%edx
 87f:	89 f8                	mov    %edi,%eax
 881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 888:	39 ce                	cmp    %ecx,%esi
 88a:	74 54                	je     8e0 <malloc+0x100>
        p->s.size -= nunits;
 88c:	29 f1                	sub    %esi,%ecx
 88e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 891:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 894:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 897:	a3 88 0c 00 00       	mov    %eax,0xc88
}
 89c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 89f:	8d 42 08             	lea    0x8(%edx),%eax
}
 8a2:	5b                   	pop    %ebx
 8a3:	5e                   	pop    %esi
 8a4:	5f                   	pop    %edi
 8a5:	5d                   	pop    %ebp
 8a6:	c3                   	ret    
 8a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 88 0c 00 00 8c 	movl   $0xc8c,0xc88
 8b7:	0c 00 00 
    base.s.size = 0;
 8ba:	bf 8c 0c 00 00       	mov    $0xc8c,%edi
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 8c 0c 00 00 8c 	movl   $0xc8c,0xc8c
 8c6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 8cb:	c7 05 90 0c 00 00 00 	movl   $0x0,0xc90
 8d2:	00 00 00 
    if(p->s.size >= nunits){
 8d5:	e9 36 ff ff ff       	jmp    810 <malloc+0x30>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 0a                	mov    (%edx),%ecx
 8e2:	89 08                	mov    %ecx,(%eax)
 8e4:	eb b1                	jmp    897 <malloc+0xb7>
