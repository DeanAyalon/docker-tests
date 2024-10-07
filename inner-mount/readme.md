# Question
If you start a container using another container (docker.sock bind mount), and specify a bind mount - Would it bind to the container or the host?

# Answer
## Docker Desktop
Not sure what I'm seeing here
- Specifying full path does not work, path not shared with host
- Specifying `.` as mount path NEITHER mounts host cd nor container cd
`ls`:
```
A                         W                         mnt
Applications              X                         mutagen-file-shares
B                         Y                         mutagen-file-shares-mark
C                         Z                         n
D                         a                         o
E                         b                         opt
F                         bin                       p
G                         boot                      private
H                         c                         proc
I                         cores                     q
J                         d                         r
K                         dev                       root
L                         e                         run
Library                   etc                       s
M                         f                         sbin
N                         g                         srv
O                         h                         sys
P                         home                      t
Q                         host_mnt                  tmp
R                         i                         u
S                         j                         usr
System                    k                         v
T                         l                         var
U                         lib                       w
Users                     lib64                     x
V                         m                         y
Volumes                   media                     z
```

## Docker Engine
> TODO