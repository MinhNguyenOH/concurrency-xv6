
_test_thread:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
  printf(1, "Value: %d\n", *(int *)ptrVal);
  exit();
}

int main(){
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  char * s = "Hello";
  int a = 0;
  int * i = &a;
  lock_t myLock;
  lock_init(&myLock);
  13:	8d 45 f0             	lea    -0x10(%ebp),%eax
  thread_create(addVar, i, s);
  16:	8d 5d ec             	lea    -0x14(%ebp),%ebx
int main(){
  19:	83 ec 1c             	sub    $0x1c,%esp
  int a = 0;
  1c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  lock_init(&myLock);
  23:	50                   	push   %eax
  24:	e8 47 04 00 00       	call   470 <lock_init>
  thread_create(addVar, i, s);
  29:	83 c4 0c             	add    $0xc,%esp
  2c:	68 09 0a 00 00       	push   $0xa09
  31:	53                   	push   %ebx
  32:	68 a0 00 00 00       	push   $0xa0
  37:	e8 74 03 00 00       	call   3b0 <thread_create>
  thread_create(addVar, i, s);
  3c:	83 c4 0c             	add    $0xc,%esp
  3f:	68 09 0a 00 00       	push   $0xa09
  44:	53                   	push   %ebx
  45:	68 a0 00 00 00       	push   $0xa0
  4a:	e8 61 03 00 00       	call   3b0 <thread_create>
  thread_create(addVar, i, s);
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 09 0a 00 00       	push   $0xa09
  57:	53                   	push   %ebx
  58:	68 a0 00 00 00       	push   $0xa0
  5d:	e8 4e 03 00 00       	call   3b0 <thread_create>
  thread_create(addVar, i, s);
  62:	83 c4 0c             	add    $0xc,%esp
  65:	68 09 0a 00 00       	push   $0xa09
  6a:	53                   	push   %ebx
  6b:	68 a0 00 00 00       	push   $0xa0
  70:	e8 3b 03 00 00       	call   3b0 <thread_create>
  thread_join();
  75:	e8 b6 03 00 00       	call   430 <thread_join>
  thread_join();
  7a:	e8 b1 03 00 00       	call   430 <thread_join>
  thread_join();
  7f:	e8 ac 03 00 00       	call   430 <thread_join>
  thread_join();
  84:	e8 a7 03 00 00       	call   430 <thread_join>
  printf(1, "This should print after lock is released\n");
  89:	58                   	pop    %eax
  8a:	5a                   	pop    %edx
  8b:	68 30 0a 00 00       	push   $0xa30
  90:	6a 01                	push   $0x1
  92:	e8 b9 05 00 00       	call   650 <printf>
  exit();
  97:	e8 47 04 00 00       	call   4e3 <exit>
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <addVar>:
void addVar(void * ptrVal, void * secondArg) {
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	56                   	push   %esi
  a8:	8b 75 08             	mov    0x8(%ebp),%esi
  ab:	53                   	push   %ebx
  ac:	bb 64 00 00 00       	mov    $0x64,%ebx
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lock_aquire(&myLock);
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 14 0e 00 00       	push   $0xe14
  c0:	e8 cb 03 00 00       	call   490 <lock_aquire>
    *(int *)ptrVal += 1;
  c5:	83 06 01             	addl   $0x1,(%esi)
    printf(1, "No race condition allowed\n");
  c8:	58                   	pop    %eax
  c9:	5a                   	pop    %edx
  ca:	68 b8 09 00 00       	push   $0x9b8
  cf:	6a 01                	push   $0x1
  d1:	e8 7a 05 00 00       	call   650 <printf>
    lock_release(&myLock);
  d6:	c7 04 24 14 0e 00 00 	movl   $0xe14,(%esp)
  dd:	e8 de 03 00 00       	call   4c0 <lock_release>
  for (int i = 0; i < 100; i++) {
  e2:	83 c4 10             	add    $0x10,%esp
  e5:	83 eb 01             	sub    $0x1,%ebx
  e8:	75 ce                	jne    b8 <addVar+0x18>
  printf(1, "Value: %d\n", *(int *)ptrVal);
  ea:	83 ec 04             	sub    $0x4,%esp
  ed:	ff 36                	pushl  (%esi)
  ef:	68 d3 09 00 00       	push   $0x9d3
  f4:	6a 01                	push   $0x1
  f6:	e8 55 05 00 00       	call   650 <printf>
  exit();
  fb:	e8 e3 03 00 00       	call   4e3 <exit>

00000100 <thread_func>:
void thread_func(void *s, void *i) {
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	83 ec 08             	sub    $0x8,%esp
  printf(1, "First arg: %s, second arg: %d\n", s, (int)i); // how to dereference void data type
 10a:	ff 75 0c             	pushl  0xc(%ebp)
 10d:	ff 75 08             	pushl  0x8(%ebp)
 110:	68 10 0a 00 00       	push   $0xa10
 115:	6a 01                	push   $0x1
 117:	e8 34 05 00 00       	call   650 <printf>
  printf(1, "test_number in thread: %d\n", test_number);   // make sure number in thread is not changed
 11c:	83 c4 0c             	add    $0xc,%esp
 11f:	ff 35 00 0e 00 00    	pushl  0xe00
 125:	68 de 09 00 00       	push   $0x9de
 12a:	6a 01                	push   $0x1
 12c:	e8 1f 05 00 00       	call   650 <printf>
  printf(1, "thread pid: %d\n", getpid());
 131:	e8 2d 04 00 00       	call   563 <getpid>
 136:	83 c4 0c             	add    $0xc,%esp
 139:	50                   	push   %eax
 13a:	68 f9 09 00 00       	push   $0x9f9
 13f:	6a 01                	push   $0x1
 141:	e8 0a 05 00 00       	call   650 <printf>
  exit();
 146:	e8 98 03 00 00       	call   4e3 <exit>
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "x86.h"
#include "mmu.h"  // PGSIZE // Code added by Greg, Shawn, and Minh, Homework 6

char*
strcpy(char *s, const char *t)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 155:	31 c0                	xor    %eax,%eax
{
 157:	89 e5                	mov    %esp,%ebp
 159:	53                   	push   %ebx
 15a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	89 c8                	mov    %ecx,%eax
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18e:	0f b6 01             	movzbl (%ecx),%eax
 191:	0f b6 1a             	movzbl (%edx),%ebx
 194:	84 c0                	test   %al,%al
 196:	75 19                	jne    1b1 <strcmp+0x31>
 198:	eb 26                	jmp    1c0 <strcmp+0x40>
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 1a             	movzbl (%edx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	38 d8                	cmp    %bl,%al
 1b3:	74 eb                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b5:	29 d8                	sub    %ebx,%eax
}
 1b7:	5b                   	pop    %ebx
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1da:	80 3a 00             	cmpb   $0x0,(%edx)
 1dd:	74 21                	je     200 <strlen+0x30>
 1df:	31 c0                	xor    %eax,%eax
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1ef:	89 c1                	mov    %eax,%ecx
 1f1:	75 f5                	jne    1e8 <strlen+0x18>
    ;
  return n;
}
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 21b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21e:	8b 45 0c             	mov    0xc(%ebp),%eax
 221:	89 d7                	mov    %edx,%edi
 223:	fc                   	cld    
 224:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 226:	89 d0                	mov    %edx,%eax
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23e:	0f b6 10             	movzbl (%eax),%edx
 241:	84 d2                	test   %dl,%dl
 243:	75 16                	jne    25b <strchr+0x2b>
 245:	eb 21                	jmp    268 <strchr+0x38>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
 250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 254:	83 c0 01             	add    $0x1,%eax
 257:	84 d2                	test   %dl,%dl
 259:	74 0d                	je     268 <strchr+0x38>
    if(*s == c)
 25b:	38 d1                	cmp    %dl,%cl
 25d:	75 f1                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 268:	31 c0                	xor    %eax,%eax
}
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 279:	31 f6                	xor    %esi,%esi
{
 27b:	53                   	push   %ebx
 27c:	89 f3                	mov    %esi,%ebx
 27e:	83 ec 1c             	sub    $0x1c,%esp
 281:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 284:	eb 33                	jmp    2b9 <gets+0x49>
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	8d 45 e7             	lea    -0x19(%ebp),%eax
 296:	6a 01                	push   $0x1
 298:	50                   	push   %eax
 299:	6a 00                	push   $0x0
 29b:	e8 5b 02 00 00       	call   4fb <read>
    if(cc < 1)
 2a0:	83 c4 10             	add    $0x10,%esp
 2a3:	85 c0                	test   %eax,%eax
 2a5:	7e 1c                	jle    2c3 <gets+0x53>
      break;
    buf[i++] = c;
 2a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ab:	83 c7 01             	add    $0x1,%edi
 2ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2b1:	3c 0a                	cmp    $0xa,%al
 2b3:	74 23                	je     2d8 <gets+0x68>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 1f                	je     2d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2b9:	83 c3 01             	add    $0x1,%ebx
 2bc:	89 fe                	mov    %edi,%esi
 2be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c1:	7c cd                	jl     290 <gets+0x20>
 2c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5f                   	pop    %edi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	8b 75 08             	mov    0x8(%ebp),%esi
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	01 de                	add    %ebx,%esi
 2e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e8:	5b                   	pop    %ebx
 2e9:	5e                   	pop    %esi
 2ea:	5f                   	pop    %edi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	6a 00                	push   $0x0
 2fe:	ff 75 08             	pushl  0x8(%ebp)
 301:	e8 1d 02 00 00       	call   523 <open>
  if(fd < 0)
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	78 2b                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 30d:	83 ec 08             	sub    $0x8,%esp
 310:	ff 75 0c             	pushl  0xc(%ebp)
 313:	89 c3                	mov    %eax,%ebx
 315:	50                   	push   %eax
 316:	e8 20 02 00 00       	call   53b <fstat>
  close(fd);
 31b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31e:	89 c6                	mov    %eax,%esi
  close(fd);
 320:	e8 e6 01 00 00       	call   50b <close>
  return r;
 325:	83 c4 10             	add    $0x10,%esp
}
 328:	8d 65 f8             	lea    -0x8(%ebp),%esp
 32b:	89 f0                	mov    %esi,%eax
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	be ff ff ff ff       	mov    $0xffffffff,%esi
 33d:	eb e9                	jmp    328 <stat+0x38>
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	0f be 02             	movsbl (%edx),%eax
 34e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 359:	77 1a                	ja     375 <atoi+0x35>
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	89 c8                	mov    %ecx,%eax
 377:	5b                   	pop    %ebx
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	8b 45 10             	mov    0x10(%ebp),%eax
 38b:	8b 55 08             	mov    0x8(%ebp),%edx
 38e:	56                   	push   %esi
 38f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 392:	85 c0                	test   %eax,%eax
 394:	7e 0f                	jle    3a5 <memmove+0x25>
 396:	01 d0                	add    %edx,%eax
  dst = vdst;
 398:	89 d7                	mov    %edx,%edi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <thread_create>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	53                   	push   %ebx
 3b8:	83 ec 20             	sub    $0x20,%esp
  void *stack = malloc(PGSIZE*2);
 3bb:	68 00 20 00 00       	push   $0x2000
 3c0:	e8 eb 04 00 00       	call   8b0 <malloc>
  if (stack == 0)
 3c5:	83 c4 10             	add    $0x10,%esp
 3c8:	85 c0                	test   %eax,%eax
 3ca:	74 53                	je     41f <thread_create+0x6f>
 3cc:	89 c3                	mov    %eax,%ebx
    return -1;
  if ((uint)stack % PGSIZE) {
 3ce:	25 ff 0f 00 00       	and    $0xfff,%eax
 3d3:	75 23                	jne    3f8 <thread_create+0x48>
    stack = stack + (4096 - (uint)stack % PGSIZE);
  }
  int r = clone(start_routine, arg1, arg2, stack);
 3d5:	53                   	push   %ebx
 3d6:	ff 75 10             	pushl  0x10(%ebp)
 3d9:	ff 75 0c             	pushl  0xc(%ebp)
 3dc:	ff 75 08             	pushl  0x8(%ebp)
 3df:	e8 9f 01 00 00       	call   583 <clone>
  if (r == -1)
 3e4:	83 c4 10             	add    $0x10,%esp
 3e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 3ea:	74 1c                	je     408 <thread_create+0x58>
    free(stack);
  return r;
}
 3ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ef:	c9                   	leave  
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    stack = stack + (4096 - (uint)stack % PGSIZE);
 3f8:	29 c3                	sub    %eax,%ebx
 3fa:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 400:	eb d3                	jmp    3d5 <thread_create+0x25>
 402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(stack);
 408:	83 ec 0c             	sub    $0xc,%esp
 40b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 40e:	53                   	push   %ebx
 40f:	e8 0c 04 00 00       	call   820 <free>
 414:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 417:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(stack);
 41a:	83 c4 10             	add    $0x10,%esp
}
 41d:	c9                   	leave  
 41e:	c3                   	ret    
    return -1;
 41f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 424:	eb c6                	jmp    3ec <thread_create+0x3c>
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <thread_join>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_join() {
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	56                   	push   %esi
 438:	83 ec 20             	sub    $0x20,%esp
  // 
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 43b:	6a 04                	push   $0x4
 43d:	e8 6e 04 00 00       	call   8b0 <malloc>
  int pidThread = join(stack);
 442:	89 04 24             	mov    %eax,(%esp)
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 445:	89 c6                	mov    %eax,%esi
  int pidThread = join(stack);
 447:	e8 3f 01 00 00       	call   58b <join>
  if (pidThread != -1) {
 44c:	83 c4 10             	add    $0x10,%esp
 44f:	83 f8 ff             	cmp    $0xffffffff,%eax
 452:	74 12                	je     466 <thread_join+0x36>
    // if stack is not allocated correctly => free stack
    free(stack);
 454:	83 ec 0c             	sub    $0xc,%esp
 457:	89 45 f4             	mov    %eax,-0xc(%ebp)
 45a:	56                   	push   %esi
 45b:	e8 c0 03 00 00       	call   820 <free>
 460:	8b 45 f4             	mov    -0xc(%ebp),%eax
 463:	83 c4 10             	add    $0x10,%esp
  }

  return pidThread;
}
 466:	8b 75 fc             	mov    -0x4(%ebp),%esi
 469:	c9                   	leave  
 46a:	c3                   	ret    
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <lock_init>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_init(lock_t * lock) {
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 47a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 480:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 487:	5d                   	pop    %ebp
 488:	c3                   	ret    
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000490 <lock_aquire>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_aquire(lock_t * lock) {
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 495:	ba 01 00 00 00       	mov    $0x1,%edx
void lock_aquire(lock_t * lock) {
 49a:	89 e5                	mov    %esp,%ebp
 49c:	8b 45 08             	mov    0x8(%ebp),%eax
    __asm__ volatile("lock; xaddl %0, %1"
 49f:	f0 0f c1 10          	lock xadd %edx,(%eax)
  int myTurn = fetch_and_add(&lock->ticket, 1);
  while(lock->turn != myTurn)
 4a3:	3b 50 04             	cmp    0x4(%eax),%edx
 4a6:	74 12                	je     4ba <lock_aquire+0x2a>
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
    __sync_synchronize();
 4b0:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  while(lock->turn != myTurn)
 4b5:	39 50 04             	cmp    %edx,0x4(%eax)
 4b8:	75 f6                	jne    4b0 <lock_aquire+0x20>
}
 4ba:	5d                   	pop    %ebp
 4bb:	c3                   	ret    
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <lock_release>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_release(lock_t * lock) {
 4c0:	f3 0f 1e fb          	endbr32 
 4c4:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 4c5:	b8 01 00 00 00       	mov    $0x1,%eax
void lock_release(lock_t * lock) {
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 4cf:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
 4d4:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <fork>:
 4db:	b8 01 00 00 00       	mov    $0x1,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exit>:
 4e3:	b8 02 00 00 00       	mov    $0x2,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <wait>:
 4eb:	b8 03 00 00 00       	mov    $0x3,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <pipe>:
 4f3:	b8 04 00 00 00       	mov    $0x4,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <read>:
 4fb:	b8 05 00 00 00       	mov    $0x5,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <write>:
 503:	b8 10 00 00 00       	mov    $0x10,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <close>:
 50b:	b8 15 00 00 00       	mov    $0x15,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <kill>:
 513:	b8 06 00 00 00       	mov    $0x6,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exec>:
 51b:	b8 07 00 00 00       	mov    $0x7,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <open>:
 523:	b8 0f 00 00 00       	mov    $0xf,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mknod>:
 52b:	b8 11 00 00 00       	mov    $0x11,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <unlink>:
 533:	b8 12 00 00 00       	mov    $0x12,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <fstat>:
 53b:	b8 08 00 00 00       	mov    $0x8,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <link>:
 543:	b8 13 00 00 00       	mov    $0x13,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mkdir>:
 54b:	b8 14 00 00 00       	mov    $0x14,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <chdir>:
 553:	b8 09 00 00 00       	mov    $0x9,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <dup>:
 55b:	b8 0a 00 00 00       	mov    $0xa,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getpid>:
 563:	b8 0b 00 00 00       	mov    $0xb,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <sbrk>:
 56b:	b8 0c 00 00 00       	mov    $0xc,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sleep>:
 573:	b8 0d 00 00 00       	mov    $0xd,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <uptime>:
 57b:	b8 0e 00 00 00       	mov    $0xe,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <clone>:
 583:	b8 16 00 00 00       	mov    $0x16,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <join>:
 58b:	b8 17 00 00 00       	mov    $0x17,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    
 593:	66 90                	xchg   %ax,%ax
 595:	66 90                	xchg   %ax,%ax
 597:	66 90                	xchg   %ax,%ax
 599:	66 90                	xchg   %ax,%ax
 59b:	66 90                	xchg   %ax,%ax
 59d:	66 90                	xchg   %ax,%ax
 59f:	90                   	nop

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ac:	89 d1                	mov    %edx,%ecx
{
 5ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5b1:	85 d2                	test   %edx,%edx
 5b3:	0f 89 7f 00 00 00    	jns    638 <printint+0x98>
 5b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5bd:	74 79                	je     638 <printint+0x98>
    neg = 1;
 5bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5c8:	31 db                	xor    %ebx,%ebx
 5ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	89 cf                	mov    %ecx,%edi
 5d6:	f7 75 c4             	divl   -0x3c(%ebp)
 5d9:	0f b6 92 64 0a 00 00 	movzbl 0xa64(%edx),%edx
 5e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5f1:	76 dd                	jbe    5d0 <printint+0x30>
  if(neg)
 5f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5f6:	85 c9                	test   %ecx,%ecx
 5f8:	74 0c                	je     606 <printint+0x66>
    buf[i++] = '-';
 5fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 601:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 606:	8b 7d b8             	mov    -0x48(%ebp),%edi
 609:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 60d:	eb 07                	jmp    616 <printint+0x76>
 60f:	90                   	nop
 610:	0f b6 13             	movzbl (%ebx),%edx
 613:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 616:	83 ec 04             	sub    $0x4,%esp
 619:	88 55 d7             	mov    %dl,-0x29(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	56                   	push   %esi
 61f:	57                   	push   %edi
 620:	e8 de fe ff ff       	call   503 <write>
  while(--i >= 0)
 625:	83 c4 10             	add    $0x10,%esp
 628:	39 de                	cmp    %ebx,%esi
 62a:	75 e4                	jne    610 <printint+0x70>
    putc(fd, buf[i]);
}
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 638:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 63f:	eb 87                	jmp    5c8 <printint+0x28>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	f3 0f 1e fb          	endbr32 
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	57                   	push   %edi
 658:	56                   	push   %esi
 659:	53                   	push   %ebx
 65a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 65d:	8b 75 0c             	mov    0xc(%ebp),%esi
 660:	0f b6 1e             	movzbl (%esi),%ebx
 663:	84 db                	test   %bl,%bl
 665:	0f 84 b4 00 00 00    	je     71f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 66b:	8d 45 10             	lea    0x10(%ebp),%eax
 66e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 671:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 674:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 676:	89 45 d0             	mov    %eax,-0x30(%ebp)
 679:	eb 33                	jmp    6ae <printf+0x5e>
 67b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
 680:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 683:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	74 17                	je     6a4 <printf+0x54>
  write(fd, &c, 1);
 68d:	83 ec 04             	sub    $0x4,%esp
 690:	88 5d e7             	mov    %bl,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	ff 75 08             	pushl  0x8(%ebp)
 699:	e8 65 fe ff ff       	call   503 <write>
 69e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6a4:	0f b6 1e             	movzbl (%esi),%ebx
 6a7:	83 c6 01             	add    $0x1,%esi
 6aa:	84 db                	test   %bl,%bl
 6ac:	74 71                	je     71f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ae:	0f be cb             	movsbl %bl,%ecx
 6b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6b4:	85 d2                	test   %edx,%edx
 6b6:	74 c8                	je     680 <printf+0x30>
      }
    } else if(state == '%'){
 6b8:	83 fa 25             	cmp    $0x25,%edx
 6bb:	75 e7                	jne    6a4 <printf+0x54>
      if(c == 'd'){
 6bd:	83 f8 64             	cmp    $0x64,%eax
 6c0:	0f 84 9a 00 00 00    	je     760 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6cc:	83 f9 70             	cmp    $0x70,%ecx
 6cf:	74 5f                	je     730 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6d1:	83 f8 73             	cmp    $0x73,%eax
 6d4:	0f 84 d6 00 00 00    	je     7b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6da:	83 f8 63             	cmp    $0x63,%eax
 6dd:	0f 84 8d 00 00 00    	je     770 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6e3:	83 f8 25             	cmp    $0x25,%eax
 6e6:	0f 84 b4 00 00 00    	je     7a0 <printf+0x150>
  write(fd, &c, 1);
 6ec:	83 ec 04             	sub    $0x4,%esp
 6ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	ff 75 08             	pushl  0x8(%ebp)
 6f9:	e8 05 fe ff ff       	call   503 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 701:	83 c4 0c             	add    $0xc,%esp
 704:	6a 01                	push   $0x1
 706:	83 c6 01             	add    $0x1,%esi
 709:	57                   	push   %edi
 70a:	ff 75 08             	pushl  0x8(%ebp)
 70d:	e8 f1 fd ff ff       	call   503 <write>
  for(i = 0; fmt[i]; i++){
 712:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 716:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 719:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 71b:	84 db                	test   %bl,%bl
 71d:	75 8f                	jne    6ae <printf+0x5e>
    }
  }
}
 71f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 722:	5b                   	pop    %ebx
 723:	5e                   	pop    %esi
 724:	5f                   	pop    %edi
 725:	5d                   	pop    %ebp
 726:	c3                   	ret    
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	6a 00                	push   $0x0
 73a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	8b 13                	mov    (%ebx),%edx
 742:	e8 59 fe ff ff       	call   5a0 <printint>
        ap++;
 747:	89 d8                	mov    %ebx,%eax
 749:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74c:	31 d2                	xor    %edx,%edx
        ap++;
 74e:	83 c0 04             	add    $0x4,%eax
 751:	89 45 d0             	mov    %eax,-0x30(%ebp)
 754:	e9 4b ff ff ff       	jmp    6a4 <printf+0x54>
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 0a 00 00 00       	mov    $0xa,%ecx
 768:	6a 01                	push   $0x1
 76a:	eb ce                	jmp    73a <printf+0xea>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 770:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 776:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 778:	6a 01                	push   $0x1
        ap++;
 77a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 77d:	57                   	push   %edi
 77e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 781:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 784:	e8 7a fd ff ff       	call   503 <write>
        ap++;
 789:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 78c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 0e ff ff ff       	jmp    6a4 <printf+0x54>
 796:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
 7a6:	e9 59 ff ff ff       	jmp    704 <printf+0xb4>
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
        s = (char*)*ap;
 7b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7b5:	83 c0 04             	add    $0x4,%eax
 7b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7bb:	85 db                	test   %ebx,%ebx
 7bd:	74 17                	je     7d6 <printf+0x186>
        while(*s != 0){
 7bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7c4:	84 c0                	test   %al,%al
 7c6:	0f 84 d8 fe ff ff    	je     6a4 <printf+0x54>
 7cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7cf:	89 de                	mov    %ebx,%esi
 7d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d4:	eb 1a                	jmp    7f0 <printf+0x1a0>
          s = "(null)";
 7d6:	bb 5a 0a 00 00       	mov    $0xa5a,%ebx
        while(*s != 0){
 7db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7de:	b8 28 00 00 00       	mov    $0x28,%eax
 7e3:	89 de                	mov    %ebx,%esi
 7e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7f3:	83 c6 01             	add    $0x1,%esi
 7f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7f9:	6a 01                	push   $0x1
 7fb:	57                   	push   %edi
 7fc:	53                   	push   %ebx
 7fd:	e8 01 fd ff ff       	call   503 <write>
        while(*s != 0){
 802:	0f b6 06             	movzbl (%esi),%eax
 805:	83 c4 10             	add    $0x10,%esp
 808:	84 c0                	test   %al,%al
 80a:	75 e4                	jne    7f0 <printf+0x1a0>
 80c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 80f:	31 d2                	xor    %edx,%edx
 811:	e9 8e fe ff ff       	jmp    6a4 <printf+0x54>
 816:	66 90                	xchg   %ax,%ax
 818:	66 90                	xchg   %ax,%ax
 81a:	66 90                	xchg   %ax,%ax
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 820:	f3 0f 1e fb          	endbr32 
 824:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 825:	a1 08 0e 00 00       	mov    0xe08,%eax
{
 82a:	89 e5                	mov    %esp,%ebp
 82c:	57                   	push   %edi
 82d:	56                   	push   %esi
 82e:	53                   	push   %ebx
 82f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 832:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 834:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 837:	39 c8                	cmp    %ecx,%eax
 839:	73 15                	jae    850 <free+0x30>
 83b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
 840:	39 d1                	cmp    %edx,%ecx
 842:	72 14                	jb     858 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 844:	39 d0                	cmp    %edx,%eax
 846:	73 10                	jae    858 <free+0x38>
{
 848:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	8b 10                	mov    (%eax),%edx
 84c:	39 c8                	cmp    %ecx,%eax
 84e:	72 f0                	jb     840 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 850:	39 d0                	cmp    %edx,%eax
 852:	72 f4                	jb     848 <free+0x28>
 854:	39 d1                	cmp    %edx,%ecx
 856:	73 f0                	jae    848 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 858:	8b 73 fc             	mov    -0x4(%ebx),%esi
 85b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 85e:	39 fa                	cmp    %edi,%edx
 860:	74 1e                	je     880 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 862:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 865:	8b 50 04             	mov    0x4(%eax),%edx
 868:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 86b:	39 f1                	cmp    %esi,%ecx
 86d:	74 28                	je     897 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 86f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 871:	5b                   	pop    %ebx
  freep = p;
 872:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 877:	5e                   	pop    %esi
 878:	5f                   	pop    %edi
 879:	5d                   	pop    %ebp
 87a:	c3                   	ret    
 87b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 880:	03 72 04             	add    0x4(%edx),%esi
 883:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 886:	8b 10                	mov    (%eax),%edx
 888:	8b 12                	mov    (%edx),%edx
 88a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 88d:	8b 50 04             	mov    0x4(%eax),%edx
 890:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 893:	39 f1                	cmp    %esi,%ecx
 895:	75 d8                	jne    86f <free+0x4f>
    p->s.size += bp->s.size;
 897:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 89a:	a3 08 0e 00 00       	mov    %eax,0xe08
    p->s.size += bp->s.size;
 89f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a5:	89 10                	mov    %edx,(%eax)
}
 8a7:	5b                   	pop    %ebx
 8a8:	5e                   	pop    %esi
 8a9:	5f                   	pop    %edi
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8b0:	f3 0f 1e fb          	endbr32 
 8b4:	55                   	push   %ebp
 8b5:	89 e5                	mov    %esp,%ebp
 8b7:	57                   	push   %edi
 8b8:	56                   	push   %esi
 8b9:	53                   	push   %ebx
 8ba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8bd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8c0:	8b 3d 08 0e 00 00    	mov    0xe08,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c6:	8d 70 07             	lea    0x7(%eax),%esi
 8c9:	c1 ee 03             	shr    $0x3,%esi
 8cc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8cf:	85 ff                	test   %edi,%edi
 8d1:	0f 84 a9 00 00 00    	je     980 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8d9:	8b 48 04             	mov    0x4(%eax),%ecx
 8dc:	39 f1                	cmp    %esi,%ecx
 8de:	73 6d                	jae    94d <malloc+0x9d>
 8e0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8eb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8ee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8f5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8f8:	eb 17                	jmp    911 <malloc+0x61>
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 900:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 902:	8b 4a 04             	mov    0x4(%edx),%ecx
 905:	39 f1                	cmp    %esi,%ecx
 907:	73 4f                	jae    958 <malloc+0xa8>
 909:	8b 3d 08 0e 00 00    	mov    0xe08,%edi
 90f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 911:	39 c7                	cmp    %eax,%edi
 913:	75 eb                	jne    900 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 915:	83 ec 0c             	sub    $0xc,%esp
 918:	ff 75 e4             	pushl  -0x1c(%ebp)
 91b:	e8 4b fc ff ff       	call   56b <sbrk>
  if(p == (char*)-1)
 920:	83 c4 10             	add    $0x10,%esp
 923:	83 f8 ff             	cmp    $0xffffffff,%eax
 926:	74 1b                	je     943 <malloc+0x93>
  hp->s.size = nu;
 928:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	83 c0 08             	add    $0x8,%eax
 931:	50                   	push   %eax
 932:	e8 e9 fe ff ff       	call   820 <free>
  return freep;
 937:	a1 08 0e 00 00       	mov    0xe08,%eax
      if((p = morecore(nunits)) == 0)
 93c:	83 c4 10             	add    $0x10,%esp
 93f:	85 c0                	test   %eax,%eax
 941:	75 bd                	jne    900 <malloc+0x50>
        return 0;
  }
}
 943:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 946:	31 c0                	xor    %eax,%eax
}
 948:	5b                   	pop    %ebx
 949:	5e                   	pop    %esi
 94a:	5f                   	pop    %edi
 94b:	5d                   	pop    %ebp
 94c:	c3                   	ret    
    if(p->s.size >= nunits){
 94d:	89 c2                	mov    %eax,%edx
 94f:	89 f8                	mov    %edi,%eax
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 958:	39 ce                	cmp    %ecx,%esi
 95a:	74 54                	je     9b0 <malloc+0x100>
        p->s.size -= nunits;
 95c:	29 f1                	sub    %esi,%ecx
 95e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 961:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 964:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 967:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 96c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 96f:	8d 42 08             	lea    0x8(%edx),%eax
}
 972:	5b                   	pop    %ebx
 973:	5e                   	pop    %esi
 974:	5f                   	pop    %edi
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    
 977:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 980:	c7 05 08 0e 00 00 0c 	movl   $0xe0c,0xe08
 987:	0e 00 00 
    base.s.size = 0;
 98a:	bf 0c 0e 00 00       	mov    $0xe0c,%edi
    base.s.ptr = freep = prevp = &base;
 98f:	c7 05 0c 0e 00 00 0c 	movl   $0xe0c,0xe0c
 996:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 999:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 99b:	c7 05 10 0e 00 00 00 	movl   $0x0,0xe10
 9a2:	00 00 00 
    if(p->s.size >= nunits){
 9a5:	e9 36 ff ff ff       	jmp    8e0 <malloc+0x30>
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9b0:	8b 0a                	mov    (%edx),%ecx
 9b2:	89 08                	mov    %ecx,(%eax)
 9b4:	eb b1                	jmp    967 <malloc+0xb7>
