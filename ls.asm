
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 28                	jle    49 <main+0x49>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 c3 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 ec                	jne    30 <main+0x30>
  exit();
  44:	e8 8a 06 00 00       	call   6d3 <exit>
    ls(".");
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	68 f0 0b 00 00       	push   $0xbf0
  51:	e8 aa 00 00 00       	call   100 <ls>
    exit();
  56:	e8 78 06 00 00       	call   6d3 <exit>
  5b:	66 90                	xchg   %ax,%ax
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <fmtname>:
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	56                   	push   %esi
  68:	53                   	push   %ebx
  69:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  6c:	83 ec 0c             	sub    $0xc,%esp
  6f:	56                   	push   %esi
  70:	e8 4b 03 00 00       	call   3c0 <strlen>
  75:	83 c4 10             	add    $0x10,%esp
  78:	01 f0                	add    %esi,%eax
  7a:	89 c3                	mov    %eax,%ebx
  7c:	73 0b                	jae    89 <fmtname+0x29>
  7e:	eb 0e                	jmp    8e <fmtname+0x2e>
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 d8 0f 00 00       	push   $0xfd8
  b5:	e8 b6 04 00 00       	call   570 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb d8 0f 00 00       	mov    $0xfd8,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 d8 0f 00 00       	add    $0xfd8,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	57                   	push   %edi
 108:	56                   	push   %esi
 109:	53                   	push   %ebx
 10a:	81 ec 64 02 00 00    	sub    $0x264,%esp
 110:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 113:	6a 00                	push   $0x0
 115:	57                   	push   %edi
 116:	e8 f8 05 00 00       	call   713 <open>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	85 c0                	test   %eax,%eax
 120:	0f 88 9a 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 126:	83 ec 08             	sub    $0x8,%esp
 129:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12f:	89 c3                	mov    %eax,%ebx
 131:	56                   	push   %esi
 132:	50                   	push   %eax
 133:	e8 f3 05 00 00       	call   72b <fstat>
 138:	83 c4 10             	add    $0x10,%esp
 13b:	85 c0                	test   %eax,%eax
 13d:	0f 88 bd 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 143:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 14a:	66 83 f8 01          	cmp    $0x1,%ax
 14e:	74 60                	je     1b0 <ls+0xb0>
 150:	66 83 f8 02          	cmp    $0x2,%ax
 154:	74 1a                	je     170 <ls+0x70>
  close(fd);
 156:	83 ec 0c             	sub    $0xc,%esp
 159:	53                   	push   %ebx
 15a:	e8 9c 05 00 00       	call   6fb <close>
 15f:	83 c4 10             	add    $0x10,%esp
}
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 d0 0b 00 00       	push   $0xbd0
 19d:	6a 01                	push   $0x1
 19f:	e8 9c 06 00 00       	call   840 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb ad                	jmp    156 <ls+0x56>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 d9 04 00 00       	call   6eb <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 38 ff ff ff    	jne    156 <ls+0x56>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 23a:	e8 31 03 00 00       	call   570 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 8e 02 00 00       	call   4e0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 d0 0b 00 00       	push   $0xbd0
 2a7:	6a 01                	push   $0x1
 2a9:	e8 92 05 00 00       	call   840 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 a8 0b 00 00       	push   $0xba8
 2c9:	6a 02                	push   $0x2
 2cb:	e8 70 05 00 00       	call   840 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 dd 0b 00 00       	push   $0xbdd
 2e8:	6a 01                	push   $0x1
 2ea:	e8 51 05 00 00       	call   840 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5f fe ff ff       	jmp    156 <ls+0x56>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 bc 0b 00 00       	push   $0xbbc
 309:	6a 02                	push   $0x2
 30b:	e8 30 05 00 00       	call   840 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 e3 03 00 00       	call   6fb <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 bc 0b 00 00       	push   $0xbbc
 331:	6a 01                	push   $0x1
 333:	e8 08 05 00 00       	call   840 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
#include "x86.h"
#include "mmu.h"  // PGSIZE // Code added by Greg, Shawn, and Minh, Homework 6

char*
strcpy(char *s, const char *t)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 345:	31 c0                	xor    %eax,%eax
{
 347:	89 e5                	mov    %esp,%ebp
 349:	53                   	push   %ebx
 34a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	89 c8                	mov    %ecx,%eax
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	8b 4d 08             	mov    0x8(%ebp),%ecx
 37b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37e:	0f b6 01             	movzbl (%ecx),%eax
 381:	0f b6 1a             	movzbl (%edx),%ebx
 384:	84 c0                	test   %al,%al
 386:	75 19                	jne    3a1 <strcmp+0x31>
 388:	eb 26                	jmp    3b0 <strcmp+0x40>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 1a             	movzbl (%edx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	5b                   	pop    %ebx
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3ca:	80 3a 00             	cmpb   $0x0,(%edx)
 3cd:	74 21                	je     3f0 <strlen+0x30>
 3cf:	31 c0                	xor    %eax,%eax
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	83 c0 01             	add    $0x1,%eax
 3db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3df:	89 c1                	mov    %eax,%ecx
 3e1:	75 f5                	jne    3d8 <strlen+0x18>
    ;
  return n;
}
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 40b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 d7                	mov    %edx,%edi
 413:	fc                   	cld    
 414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42e:	0f b6 10             	movzbl (%eax),%edx
 431:	84 d2                	test   %dl,%dl
 433:	75 16                	jne    44b <strchr+0x2b>
 435:	eb 21                	jmp    458 <strchr+0x38>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 444:	83 c0 01             	add    $0x1,%eax
 447:	84 d2                	test   %dl,%dl
 449:	74 0d                	je     458 <strchr+0x38>
    if(*s == c)
 44b:	38 d1                	cmp    %dl,%cl
 44d:	75 f1                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 458:	31 c0                	xor    %eax,%eax
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 469:	31 f6                	xor    %esi,%esi
{
 46b:	53                   	push   %ebx
 46c:	89 f3                	mov    %esi,%ebx
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 474:	eb 33                	jmp    4a9 <gets+0x49>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	8d 45 e7             	lea    -0x19(%ebp),%eax
 486:	6a 01                	push   $0x1
 488:	50                   	push   %eax
 489:	6a 00                	push   $0x0
 48b:	e8 5b 02 00 00       	call   6eb <read>
    if(cc < 1)
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	7e 1c                	jle    4b3 <gets+0x53>
      break;
    buf[i++] = c;
 497:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 49b:	83 c7 01             	add    $0x1,%edi
 49e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4a1:	3c 0a                	cmp    $0xa,%al
 4a3:	74 23                	je     4c8 <gets+0x68>
 4a5:	3c 0d                	cmp    $0xd,%al
 4a7:	74 1f                	je     4c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	89 fe                	mov    %edi,%esi
 4ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b1:	7c cd                	jl     480 <gets+0x20>
 4b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c7:	90                   	nop
 4c8:	8b 75 08             	mov    0x8(%ebp),%esi
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	01 de                	add    %ebx,%esi
 4d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5f                   	pop    %edi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	6a 00                	push   $0x0
 4ee:	ff 75 08             	pushl  0x8(%ebp)
 4f1:	e8 1d 02 00 00       	call   713 <open>
  if(fd < 0)
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	78 2b                	js     528 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4fd:	83 ec 08             	sub    $0x8,%esp
 500:	ff 75 0c             	pushl  0xc(%ebp)
 503:	89 c3                	mov    %eax,%ebx
 505:	50                   	push   %eax
 506:	e8 20 02 00 00       	call   72b <fstat>
  close(fd);
 50b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50e:	89 c6                	mov    %eax,%esi
  close(fd);
 510:	e8 e6 01 00 00       	call   6fb <close>
  return r;
 515:	83 c4 10             	add    $0x10,%esp
}
 518:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51b:	89 f0                	mov    %esi,%eax
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 528:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52d:	eb e9                	jmp    518 <stat+0x38>
 52f:	90                   	nop

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	53                   	push   %ebx
 538:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53b:	0f be 02             	movsbl (%edx),%eax
 53e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 541:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 544:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 549:	77 1a                	ja     565 <atoi+0x35>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	89 c8                	mov    %ecx,%eax
 567:	5b                   	pop    %ebx
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	8b 45 10             	mov    0x10(%ebp),%eax
 57b:	8b 55 08             	mov    0x8(%ebp),%edx
 57e:	56                   	push   %esi
 57f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 582:	85 c0                	test   %eax,%eax
 584:	7e 0f                	jle    595 <memmove+0x25>
 586:	01 d0                	add    %edx,%eax
  dst = vdst;
 588:	89 d7                	mov    %edx,%edi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <thread_create>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	53                   	push   %ebx
 5a8:	83 ec 20             	sub    $0x20,%esp
  void *stack = malloc(PGSIZE*2);
 5ab:	68 00 20 00 00       	push   $0x2000
 5b0:	e8 eb 04 00 00       	call   aa0 <malloc>
  if (stack == 0)
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	85 c0                	test   %eax,%eax
 5ba:	74 53                	je     60f <thread_create+0x6f>
 5bc:	89 c3                	mov    %eax,%ebx
    return -1;
  if ((uint)stack % PGSIZE) {
 5be:	25 ff 0f 00 00       	and    $0xfff,%eax
 5c3:	75 23                	jne    5e8 <thread_create+0x48>
    stack = stack + (4096 - (uint)stack % PGSIZE);
  }
  int r = clone(start_routine, arg1, arg2, stack);
 5c5:	53                   	push   %ebx
 5c6:	ff 75 10             	pushl  0x10(%ebp)
 5c9:	ff 75 0c             	pushl  0xc(%ebp)
 5cc:	ff 75 08             	pushl  0x8(%ebp)
 5cf:	e8 9f 01 00 00       	call   773 <clone>
  if (r == -1)
 5d4:	83 c4 10             	add    $0x10,%esp
 5d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 5da:	74 1c                	je     5f8 <thread_create+0x58>
    free(stack);
  return r;
}
 5dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5df:	c9                   	leave  
 5e0:	c3                   	ret    
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    stack = stack + (4096 - (uint)stack % PGSIZE);
 5e8:	29 c3                	sub    %eax,%ebx
 5ea:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 5f0:	eb d3                	jmp    5c5 <thread_create+0x25>
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    free(stack);
 5f8:	83 ec 0c             	sub    $0xc,%esp
 5fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5fe:	53                   	push   %ebx
 5ff:	e8 0c 04 00 00       	call   a10 <free>
 604:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 607:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    free(stack);
 60a:	83 c4 10             	add    $0x10,%esp
}
 60d:	c9                   	leave  
 60e:	c3                   	ret    
    return -1;
 60f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 614:	eb c6                	jmp    5dc <thread_create+0x3c>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi

00000620 <thread_join>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

int thread_join() {
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	56                   	push   %esi
 628:	83 ec 20             	sub    $0x20,%esp
  // 
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 62b:	6a 04                	push   $0x4
 62d:	e8 6e 04 00 00       	call   aa0 <malloc>
  int pidThread = join(stack);
 632:	89 04 24             	mov    %eax,(%esp)
  void **stack = (void**)malloc(sizeof(void**)); // allocated space
 635:	89 c6                	mov    %eax,%esi
  int pidThread = join(stack);
 637:	e8 3f 01 00 00       	call   77b <join>
  if (pidThread != -1) {
 63c:	83 c4 10             	add    $0x10,%esp
 63f:	83 f8 ff             	cmp    $0xffffffff,%eax
 642:	74 12                	je     656 <thread_join+0x36>
    // if stack is not allocated correctly => free stack
    free(stack);
 644:	83 ec 0c             	sub    $0xc,%esp
 647:	89 45 f4             	mov    %eax,-0xc(%ebp)
 64a:	56                   	push   %esi
 64b:	e8 c0 03 00 00       	call   a10 <free>
 650:	8b 45 f4             	mov    -0xc(%ebp),%eax
 653:	83 c4 10             	add    $0x10,%esp
  }

  return pidThread;
}
 656:	8b 75 fc             	mov    -0x4(%ebp),%esi
 659:	c9                   	leave  
 65a:	c3                   	ret    
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop

00000660 <lock_init>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_init(lock_t * lock) {
 660:	f3 0f 1e fb          	endbr32 
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 66a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 670:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 677:	5d                   	pop    %ebp
 678:	c3                   	ret    
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000680 <lock_aquire>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_aquire(lock_t * lock) {
 680:	f3 0f 1e fb          	endbr32 
 684:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 685:	ba 01 00 00 00       	mov    $0x1,%edx
void lock_aquire(lock_t * lock) {
 68a:	89 e5                	mov    %esp,%ebp
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
    __asm__ volatile("lock; xaddl %0, %1"
 68f:	f0 0f c1 10          	lock xadd %edx,(%eax)
  int myTurn = fetch_and_add(&lock->ticket, 1);
  while(lock->turn != myTurn)
 693:	3b 50 04             	cmp    0x4(%eax),%edx
 696:	74 12                	je     6aa <lock_aquire+0x2a>
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
    __sync_synchronize();
 6a0:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  while(lock->turn != myTurn)
 6a5:	39 50 04             	cmp    %edx,0x4(%eax)
 6a8:	75 f6                	jne    6a0 <lock_aquire+0x20>
}
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <lock_release>:

/* End of code added by Greg, Shawn, Mink, Homework 6 */

/* Start of code added by Greg, Shawn, Mink, Homework 6 */

void lock_release(lock_t * lock) {
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
    __asm__ volatile("lock; xaddl %0, %1"
 6b5:	b8 01 00 00 00       	mov    $0x1,%eax
void lock_release(lock_t * lock) {
 6ba:	89 e5                	mov    %esp,%ebp
 6bc:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 6bf:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
 6c4:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    

000006cb <fork>:
 6cb:	b8 01 00 00 00       	mov    $0x1,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <exit>:
 6d3:	b8 02 00 00 00       	mov    $0x2,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <wait>:
 6db:	b8 03 00 00 00       	mov    $0x3,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <pipe>:
 6e3:	b8 04 00 00 00       	mov    $0x4,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <read>:
 6eb:	b8 05 00 00 00       	mov    $0x5,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <write>:
 6f3:	b8 10 00 00 00       	mov    $0x10,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <close>:
 6fb:	b8 15 00 00 00       	mov    $0x15,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <kill>:
 703:	b8 06 00 00 00       	mov    $0x6,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <exec>:
 70b:	b8 07 00 00 00       	mov    $0x7,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <open>:
 713:	b8 0f 00 00 00       	mov    $0xf,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <mknod>:
 71b:	b8 11 00 00 00       	mov    $0x11,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <unlink>:
 723:	b8 12 00 00 00       	mov    $0x12,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <fstat>:
 72b:	b8 08 00 00 00       	mov    $0x8,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <link>:
 733:	b8 13 00 00 00       	mov    $0x13,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <mkdir>:
 73b:	b8 14 00 00 00       	mov    $0x14,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <chdir>:
 743:	b8 09 00 00 00       	mov    $0x9,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <dup>:
 74b:	b8 0a 00 00 00       	mov    $0xa,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <getpid>:
 753:	b8 0b 00 00 00       	mov    $0xb,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <sbrk>:
 75b:	b8 0c 00 00 00       	mov    $0xc,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <sleep>:
 763:	b8 0d 00 00 00       	mov    $0xd,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <uptime>:
 76b:	b8 0e 00 00 00       	mov    $0xe,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <clone>:
 773:	b8 16 00 00 00       	mov    $0x16,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <join>:
 77b:	b8 17 00 00 00       	mov    $0x17,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    
 783:	66 90                	xchg   %ax,%ax
 785:	66 90                	xchg   %ax,%ax
 787:	66 90                	xchg   %ax,%ax
 789:	66 90                	xchg   %ax,%ax
 78b:	66 90                	xchg   %ax,%ax
 78d:	66 90                	xchg   %ax,%ax
 78f:	90                   	nop

00000790 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 3c             	sub    $0x3c,%esp
 799:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 79c:	89 d1                	mov    %edx,%ecx
{
 79e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 7a1:	85 d2                	test   %edx,%edx
 7a3:	0f 89 7f 00 00 00    	jns    828 <printint+0x98>
 7a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7ad:	74 79                	je     828 <printint+0x98>
    neg = 1;
 7af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 7b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 7b8:	31 db                	xor    %ebx,%ebx
 7ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7c0:	89 c8                	mov    %ecx,%eax
 7c2:	31 d2                	xor    %edx,%edx
 7c4:	89 cf                	mov    %ecx,%edi
 7c6:	f7 75 c4             	divl   -0x3c(%ebp)
 7c9:	0f b6 92 fc 0b 00 00 	movzbl 0xbfc(%edx),%edx
 7d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7d3:	89 d8                	mov    %ebx,%eax
 7d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7e1:	76 dd                	jbe    7c0 <printint+0x30>
  if(neg)
 7e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7e6:	85 c9                	test   %ecx,%ecx
 7e8:	74 0c                	je     7f6 <printint+0x66>
    buf[i++] = '-';
 7ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7fd:	eb 07                	jmp    806 <printint+0x76>
 7ff:	90                   	nop
 800:	0f b6 13             	movzbl (%ebx),%edx
 803:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 806:	83 ec 04             	sub    $0x4,%esp
 809:	88 55 d7             	mov    %dl,-0x29(%ebp)
 80c:	6a 01                	push   $0x1
 80e:	56                   	push   %esi
 80f:	57                   	push   %edi
 810:	e8 de fe ff ff       	call   6f3 <write>
  while(--i >= 0)
 815:	83 c4 10             	add    $0x10,%esp
 818:	39 de                	cmp    %ebx,%esi
 81a:	75 e4                	jne    800 <printint+0x70>
    putc(fd, buf[i]);
}
 81c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 81f:	5b                   	pop    %ebx
 820:	5e                   	pop    %esi
 821:	5f                   	pop    %edi
 822:	5d                   	pop    %ebp
 823:	c3                   	ret    
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 828:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 82f:	eb 87                	jmp    7b8 <printint+0x28>
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop

00000840 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 840:	f3 0f 1e fb          	endbr32 
 844:	55                   	push   %ebp
 845:	89 e5                	mov    %esp,%ebp
 847:	57                   	push   %edi
 848:	56                   	push   %esi
 849:	53                   	push   %ebx
 84a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 84d:	8b 75 0c             	mov    0xc(%ebp),%esi
 850:	0f b6 1e             	movzbl (%esi),%ebx
 853:	84 db                	test   %bl,%bl
 855:	0f 84 b4 00 00 00    	je     90f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 85b:	8d 45 10             	lea    0x10(%ebp),%eax
 85e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 861:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 864:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 866:	89 45 d0             	mov    %eax,-0x30(%ebp)
 869:	eb 33                	jmp    89e <printf+0x5e>
 86b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
 870:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 873:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 878:	83 f8 25             	cmp    $0x25,%eax
 87b:	74 17                	je     894 <printf+0x54>
  write(fd, &c, 1);
 87d:	83 ec 04             	sub    $0x4,%esp
 880:	88 5d e7             	mov    %bl,-0x19(%ebp)
 883:	6a 01                	push   $0x1
 885:	57                   	push   %edi
 886:	ff 75 08             	pushl  0x8(%ebp)
 889:	e8 65 fe ff ff       	call   6f3 <write>
 88e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 891:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 894:	0f b6 1e             	movzbl (%esi),%ebx
 897:	83 c6 01             	add    $0x1,%esi
 89a:	84 db                	test   %bl,%bl
 89c:	74 71                	je     90f <printf+0xcf>
    c = fmt[i] & 0xff;
 89e:	0f be cb             	movsbl %bl,%ecx
 8a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 8a4:	85 d2                	test   %edx,%edx
 8a6:	74 c8                	je     870 <printf+0x30>
      }
    } else if(state == '%'){
 8a8:	83 fa 25             	cmp    $0x25,%edx
 8ab:	75 e7                	jne    894 <printf+0x54>
      if(c == 'd'){
 8ad:	83 f8 64             	cmp    $0x64,%eax
 8b0:	0f 84 9a 00 00 00    	je     950 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 8bc:	83 f9 70             	cmp    $0x70,%ecx
 8bf:	74 5f                	je     920 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8c1:	83 f8 73             	cmp    $0x73,%eax
 8c4:	0f 84 d6 00 00 00    	je     9a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8ca:	83 f8 63             	cmp    $0x63,%eax
 8cd:	0f 84 8d 00 00 00    	je     960 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d3:	83 f8 25             	cmp    $0x25,%eax
 8d6:	0f 84 b4 00 00 00    	je     990 <printf+0x150>
  write(fd, &c, 1);
 8dc:	83 ec 04             	sub    $0x4,%esp
 8df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8e3:	6a 01                	push   $0x1
 8e5:	57                   	push   %edi
 8e6:	ff 75 08             	pushl  0x8(%ebp)
 8e9:	e8 05 fe ff ff       	call   6f3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 8ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8f1:	83 c4 0c             	add    $0xc,%esp
 8f4:	6a 01                	push   $0x1
 8f6:	83 c6 01             	add    $0x1,%esi
 8f9:	57                   	push   %edi
 8fa:	ff 75 08             	pushl  0x8(%ebp)
 8fd:	e8 f1 fd ff ff       	call   6f3 <write>
  for(i = 0; fmt[i]; i++){
 902:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 906:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 909:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 90b:	84 db                	test   %bl,%bl
 90d:	75 8f                	jne    89e <printf+0x5e>
    }
  }
}
 90f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 912:	5b                   	pop    %ebx
 913:	5e                   	pop    %esi
 914:	5f                   	pop    %edi
 915:	5d                   	pop    %ebp
 916:	c3                   	ret    
 917:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 920:	83 ec 0c             	sub    $0xc,%esp
 923:	b9 10 00 00 00       	mov    $0x10,%ecx
 928:	6a 00                	push   $0x0
 92a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 92d:	8b 45 08             	mov    0x8(%ebp),%eax
 930:	8b 13                	mov    (%ebx),%edx
 932:	e8 59 fe ff ff       	call   790 <printint>
        ap++;
 937:	89 d8                	mov    %ebx,%eax
 939:	83 c4 10             	add    $0x10,%esp
      state = 0;
 93c:	31 d2                	xor    %edx,%edx
        ap++;
 93e:	83 c0 04             	add    $0x4,%eax
 941:	89 45 d0             	mov    %eax,-0x30(%ebp)
 944:	e9 4b ff ff ff       	jmp    894 <printf+0x54>
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 950:	83 ec 0c             	sub    $0xc,%esp
 953:	b9 0a 00 00 00       	mov    $0xa,%ecx
 958:	6a 01                	push   $0x1
 95a:	eb ce                	jmp    92a <printf+0xea>
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 960:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 963:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 966:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 968:	6a 01                	push   $0x1
        ap++;
 96a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 96d:	57                   	push   %edi
 96e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 971:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 974:	e8 7a fd ff ff       	call   6f3 <write>
        ap++;
 979:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 97c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 97f:	31 d2                	xor    %edx,%edx
 981:	e9 0e ff ff ff       	jmp    894 <printf+0x54>
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 990:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 993:	83 ec 04             	sub    $0x4,%esp
 996:	e9 59 ff ff ff       	jmp    8f4 <printf+0xb4>
 99b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
        s = (char*)*ap;
 9a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 9a5:	83 c0 04             	add    $0x4,%eax
 9a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 9ab:	85 db                	test   %ebx,%ebx
 9ad:	74 17                	je     9c6 <printf+0x186>
        while(*s != 0){
 9af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 9b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 9b4:	84 c0                	test   %al,%al
 9b6:	0f 84 d8 fe ff ff    	je     894 <printf+0x54>
 9bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 9bf:	89 de                	mov    %ebx,%esi
 9c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9c4:	eb 1a                	jmp    9e0 <printf+0x1a0>
          s = "(null)";
 9c6:	bb f2 0b 00 00       	mov    $0xbf2,%ebx
        while(*s != 0){
 9cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 9ce:	b8 28 00 00 00       	mov    $0x28,%eax
 9d3:	89 de                	mov    %ebx,%esi
 9d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9df:	90                   	nop
  write(fd, &c, 1);
 9e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 9e3:	83 c6 01             	add    $0x1,%esi
 9e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9e9:	6a 01                	push   $0x1
 9eb:	57                   	push   %edi
 9ec:	53                   	push   %ebx
 9ed:	e8 01 fd ff ff       	call   6f3 <write>
        while(*s != 0){
 9f2:	0f b6 06             	movzbl (%esi),%eax
 9f5:	83 c4 10             	add    $0x10,%esp
 9f8:	84 c0                	test   %al,%al
 9fa:	75 e4                	jne    9e0 <printf+0x1a0>
 9fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 9ff:	31 d2                	xor    %edx,%edx
 a01:	e9 8e fe ff ff       	jmp    894 <printf+0x54>
 a06:	66 90                	xchg   %ax,%ax
 a08:	66 90                	xchg   %ax,%ax
 a0a:	66 90                	xchg   %ax,%ax
 a0c:	66 90                	xchg   %ax,%ax
 a0e:	66 90                	xchg   %ax,%ax

00000a10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a10:	f3 0f 1e fb          	endbr32 
 a14:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a15:	a1 e8 0f 00 00       	mov    0xfe8,%eax
{
 a1a:	89 e5                	mov    %esp,%ebp
 a1c:	57                   	push   %edi
 a1d:	56                   	push   %esi
 a1e:	53                   	push   %ebx
 a1f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a22:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 a24:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a27:	39 c8                	cmp    %ecx,%eax
 a29:	73 15                	jae    a40 <free+0x30>
 a2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a2f:	90                   	nop
 a30:	39 d1                	cmp    %edx,%ecx
 a32:	72 14                	jb     a48 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a34:	39 d0                	cmp    %edx,%eax
 a36:	73 10                	jae    a48 <free+0x38>
{
 a38:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a3a:	8b 10                	mov    (%eax),%edx
 a3c:	39 c8                	cmp    %ecx,%eax
 a3e:	72 f0                	jb     a30 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a40:	39 d0                	cmp    %edx,%eax
 a42:	72 f4                	jb     a38 <free+0x28>
 a44:	39 d1                	cmp    %edx,%ecx
 a46:	73 f0                	jae    a38 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a48:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a4e:	39 fa                	cmp    %edi,%edx
 a50:	74 1e                	je     a70 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a52:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a55:	8b 50 04             	mov    0x4(%eax),%edx
 a58:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a5b:	39 f1                	cmp    %esi,%ecx
 a5d:	74 28                	je     a87 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a5f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 a61:	5b                   	pop    %ebx
  freep = p;
 a62:	a3 e8 0f 00 00       	mov    %eax,0xfe8
}
 a67:	5e                   	pop    %esi
 a68:	5f                   	pop    %edi
 a69:	5d                   	pop    %ebp
 a6a:	c3                   	ret    
 a6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a6f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 a70:	03 72 04             	add    0x4(%edx),%esi
 a73:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a76:	8b 10                	mov    (%eax),%edx
 a78:	8b 12                	mov    (%edx),%edx
 a7a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a7d:	8b 50 04             	mov    0x4(%eax),%edx
 a80:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a83:	39 f1                	cmp    %esi,%ecx
 a85:	75 d8                	jne    a5f <free+0x4f>
    p->s.size += bp->s.size;
 a87:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a8a:	a3 e8 0f 00 00       	mov    %eax,0xfe8
    p->s.size += bp->s.size;
 a8f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a92:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a95:	89 10                	mov    %edx,(%eax)
}
 a97:	5b                   	pop    %ebx
 a98:	5e                   	pop    %esi
 a99:	5f                   	pop    %edi
 a9a:	5d                   	pop    %ebp
 a9b:	c3                   	ret    
 a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 aa0:	f3 0f 1e fb          	endbr32 
 aa4:	55                   	push   %ebp
 aa5:	89 e5                	mov    %esp,%ebp
 aa7:	57                   	push   %edi
 aa8:	56                   	push   %esi
 aa9:	53                   	push   %ebx
 aaa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 ab0:	8b 3d e8 0f 00 00    	mov    0xfe8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab6:	8d 70 07             	lea    0x7(%eax),%esi
 ab9:	c1 ee 03             	shr    $0x3,%esi
 abc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 abf:	85 ff                	test   %edi,%edi
 ac1:	0f 84 a9 00 00 00    	je     b70 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 ac9:	8b 48 04             	mov    0x4(%eax),%ecx
 acc:	39 f1                	cmp    %esi,%ecx
 ace:	73 6d                	jae    b3d <malloc+0x9d>
 ad0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 ad6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 adb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 ade:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 ae5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 ae8:	eb 17                	jmp    b01 <malloc+0x61>
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 af2:	8b 4a 04             	mov    0x4(%edx),%ecx
 af5:	39 f1                	cmp    %esi,%ecx
 af7:	73 4f                	jae    b48 <malloc+0xa8>
 af9:	8b 3d e8 0f 00 00    	mov    0xfe8,%edi
 aff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b01:	39 c7                	cmp    %eax,%edi
 b03:	75 eb                	jne    af0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 b05:	83 ec 0c             	sub    $0xc,%esp
 b08:	ff 75 e4             	pushl  -0x1c(%ebp)
 b0b:	e8 4b fc ff ff       	call   75b <sbrk>
  if(p == (char*)-1)
 b10:	83 c4 10             	add    $0x10,%esp
 b13:	83 f8 ff             	cmp    $0xffffffff,%eax
 b16:	74 1b                	je     b33 <malloc+0x93>
  hp->s.size = nu;
 b18:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b1b:	83 ec 0c             	sub    $0xc,%esp
 b1e:	83 c0 08             	add    $0x8,%eax
 b21:	50                   	push   %eax
 b22:	e8 e9 fe ff ff       	call   a10 <free>
  return freep;
 b27:	a1 e8 0f 00 00       	mov    0xfe8,%eax
      if((p = morecore(nunits)) == 0)
 b2c:	83 c4 10             	add    $0x10,%esp
 b2f:	85 c0                	test   %eax,%eax
 b31:	75 bd                	jne    af0 <malloc+0x50>
        return 0;
  }
}
 b33:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b36:	31 c0                	xor    %eax,%eax
}
 b38:	5b                   	pop    %ebx
 b39:	5e                   	pop    %esi
 b3a:	5f                   	pop    %edi
 b3b:	5d                   	pop    %ebp
 b3c:	c3                   	ret    
    if(p->s.size >= nunits){
 b3d:	89 c2                	mov    %eax,%edx
 b3f:	89 f8                	mov    %edi,%eax
 b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 b48:	39 ce                	cmp    %ecx,%esi
 b4a:	74 54                	je     ba0 <malloc+0x100>
        p->s.size -= nunits;
 b4c:	29 f1                	sub    %esi,%ecx
 b4e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 b51:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 b54:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 b57:	a3 e8 0f 00 00       	mov    %eax,0xfe8
}
 b5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b5f:	8d 42 08             	lea    0x8(%edx),%eax
}
 b62:	5b                   	pop    %ebx
 b63:	5e                   	pop    %esi
 b64:	5f                   	pop    %edi
 b65:	5d                   	pop    %ebp
 b66:	c3                   	ret    
 b67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b6e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 b70:	c7 05 e8 0f 00 00 ec 	movl   $0xfec,0xfe8
 b77:	0f 00 00 
    base.s.size = 0;
 b7a:	bf ec 0f 00 00       	mov    $0xfec,%edi
    base.s.ptr = freep = prevp = &base;
 b7f:	c7 05 ec 0f 00 00 ec 	movl   $0xfec,0xfec
 b86:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b89:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b8b:	c7 05 f0 0f 00 00 00 	movl   $0x0,0xff0
 b92:	00 00 00 
    if(p->s.size >= nunits){
 b95:	e9 36 ff ff ff       	jmp    ad0 <malloc+0x30>
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ba0:	8b 0a                	mov    (%edx),%ecx
 ba2:	89 08                	mov    %ecx,(%eax)
 ba4:	eb b1                	jmp    b57 <malloc+0xb7>
