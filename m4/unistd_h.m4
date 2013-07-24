# unistd_h.m4 serial 66
dnl Copyright (C) 2006-2012 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl Written by Simon Josefsson, Bruno Haible.

AC_DEFUN([gl_UNISTD_H],
[
  dnl Use AC_REQUIRE here, so that the default behavior below is expanded
  dnl once only, before all statements that occur in other macros.
  AC_REQUIRE([gl_UNISTD_H_DEFAULTS])

  gl_CHECK_NEXT_HEADERS([unistd.h])
  if test $ac_cv_header_unistd_h = yes; then
    HAVE_UNISTD_H=1
  else
    HAVE_UNISTD_H=0
  fi
  AC_SUBST([HAVE_UNISTD_H])

  dnl Ensure the type pid_t gets defined.
  AC_REQUIRE([AC_TYPE_PID_T])

  dnl Determine WINDOWS_64_BIT_OFF_T.
  AC_REQUIRE([gl_TYPE_OFF_T])

  dnl Check for declarations of anything we want to poison if the
  dnl corresponding gnulib module is not in use.
  gl_WARN_ON_USE_PREPARE([[
#if HAVE_UNISTD_H
# include <unistd.h>
#endif
/* Some systems declare various items in the wrong headers.  */
#if !(defined __GLIBC__ && !defined __UCLIBC__)
# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>
# if (defined _WIN32 || defined __WIN32__) && ! defined __CYGWIN__
#  include <io.h>
# endif
#endif
    ]], [chdir chown dup dup2 dup3 environ euidaccess faccessat fchdir fchownat
    fdatasync fsync ftruncate getcwd getdomainname getdtablesize getgroups
    gethostname getlogin getlogin_r getpagesize
    getusershell setusershell endusershell
    group_member isatty lchown link linkat lseek pipe pipe2 pread pwrite
    readlink readlinkat rmdir sethostname sleep symlink symlinkat ttyname_r
    unlink unlinkat usleep])
])

AC_DEFUN([gl_UNISTD_MODULE_INDICATOR],
[
  dnl Use AC_REQUIRE here, so that the default settings are expanded once only.
  AC_REQUIRE([gl_UNISTD_H_DEFAULTS])
  gl_MODULE_INDICATOR_SET_VARIABLE([$1])
  dnl Define it also as a C macro, for the benefit of the unit tests.
  gl_MODULE_INDICATOR_FOR_TESTS([$1])
])

AC_DEFUN([gl_UNISTD_H_DEFAULTS],
[
  GNULIB_CHDIR=0;                AC_SUBST([GNULIB_CHDIR])
  GNULIB_CHOWN=0;                AC_SUBST([GNULIB_CHOWN])
  GNULIB_CLOSE=0;                AC_SUBST([GNULIB_CLOSE])
  GNULIB_DUP=0;                  AC_SUBST([GNULIB_DUP])
  GNULIB_DUP2=0;                 AC_SUBST([GNULIB_DUP2])
  GNULIB_DUP3=0;                 AC_SUBST([GNULIB_DUP3])
  GNULIB_ENVIRON=0;              AC_SUBST([GNULIB_ENVIRON])
  GNULIB_EUIDACCESS=0;           AC_SUBST([GNULIB_EUIDACCESS])
  GNULIB_FACCESSAT=0;            AC_SUBST([GNULIB_FACCESSAT])
  GNULIB_FCHDIR=0;               AC_SUBST([GNULIB_FCHDIR])
  GNULIB_FCHOWNAT=0;             AC_SUBST([GNULIB_FCHOWNAT])
  GNULIB_FDATASYNC=0;            AC_SUBST([GNULIB_FDATASYNC])
  GNULIB_FSYNC=0;                AC_SUBST([GNULIB_FSYNC])
  GNULIB_FTRUNCATE=0;            AC_SUBST([GNULIB_FTRUNCATE])
  GNULIB_GETCWD=0;               AC_SUBST([GNULIB_GETCWD])
  GNULIB_GETDOMAINNAME=0;        AC_SUBST([GNULIB_GETDOMAINNAME])
  GNULIB_GETDTABLESIZE=0;        AC_SUBST([GNULIB_GETDTABLESIZE])
  GNULIB_GETGROUPS=0;            AC_SUBST([GNULIB_GETGROUPS])
  GNULIB_GETHOSTNAME=0;          AC_SUBST([GNULIB_GETHOSTNAME])
  GNULIB_GETLOGIN=0;             AC_SUBST([GNULIB_GETLOGIN])
  GNULIB_GETLOGIN_R=0;           AC_SUBST([GNULIB_GETLOGIN_R])
  GNULIB_GETPAGESIZE=0;          AC_SUBST([GNULIB_GETPAGESIZE])
  GNULIB_GETUSERSHELL=0;         AC_SUBST([GNULIB_GETUSERSHELL])
  GNULIB_GROUP_MEMBER=0;         AC_SUBST([GNULIB_GROUP_MEMBER])
  GNULIB_ISATTY=0;               AC_SUBST([GNULIB_ISATTY])
  GNULIB_LCHOWN=0;               AC_SUBST([GNULIB_LCHOWN])
  GNULIB_LINK=0;                 AC_SUBST([GNULIB_LINK])
  GNULIB_LINKAT=0;               AC_SUBST([GNULIB_LINKAT])
  GNULIB_LSEEK=0;                AC_SUBST([GNULIB_LSEEK])
  GNULIB_PIPE=0;                 AC_SUBST([GNULIB_PIPE])
  GNULIB_PIPE2=0;                AC_SUBST([GNULIB_PIPE2])
  GNULIB_PREAD=0;                AC_SUBST([GNULIB_PREAD])
  GNULIB_PWRITE=0;               AC_SUBST([GNULIB_PWRITE])
  GNULIB_READ=0;                 AC_SUBST([GNULIB_READ])
  GNULIB_READLINK=0;             AC_SUBST([GNULIB_READLINK])
  GNULIB_READLINKAT=0;           AC_SUBST([GNULIB_READLINKAT])
  GNULIB_RMDIR=0;                AC_SUBST([GNULIB_RMDIR])
  GNULIB_SETHOSTNAME=0;          AC_SUBST([GNULIB_SETHOSTNAME])
  GNULIB_SLEEP=0;                AC_SUBST([GNULIB_SLEEP])
  GNULIB_SYMLINK=0;              AC_SUBST([GNULIB_SYMLINK])
  GNULIB_SYMLINKAT=0;            AC_SUBST([GNULIB_SYMLINKAT])
  GNULIB_TTYNAME_R=0;            AC_SUBST([GNULIB_TTYNAME_R])
  GNULIB_UNISTD_H_NONBLOCKING=0; AC_SUBST([GNULIB_UNISTD_H_NONBLOCKING])
  GNULIB_UNISTD_H_SIGPIPE=0;     AC_SUBST([GNULIB_UNISTD_H_SIGPIPE])
  GNULIB_UNLINK=0;               AC_SUBST([GNULIB_UNLINK])
  GNULIB_UNLINKAT=0;             AC_SUBST([GNULIB_UNLINKAT])
  GNULIB_USLEEP=0;               AC_SUBST([GNULIB_USLEEP])
  GNULIB_WRITE=0;                AC_SUBST([GNULIB_WRITE])
  dnl Assume proper GNU behavior unless another module says otherwise.
  HAVE_CHOWN=1;           AC_SUBST([HAVE_CHOWN])
  HAVE_DUP2=1;            AC_SUBST([HAVE_DUP2])
  HAVE_DUP3=1;            AC_SUBST([HAVE_DUP3])
  HAVE_EUIDACCESS=1;      AC_SUBST([HAVE_EUIDACCESS])
  HAVE_FACCESSAT=1;       AC_SUBST([HAVE_FACCESSAT])
  HAVE_FCHDIR=1;          AC_SUBST([HAVE_FCHDIR])
  HAVE_FCHOWNAT=1;        AC_SUBST([HAVE_FCHOWNAT])
  HAVE_FDATASYNC=1;       AC_SUBST([HAVE_FDATASYNC])
  HAVE_FSYNC=1;           AC_SUBST([HAVE_FSYNC])
  HAVE_FTRUNCATE=1;       AC_SUBST([HAVE_FTRUNCATE])
  HAVE_GETDTABLESIZE=1;   AC_SUBST([HAVE_GETDTABLESIZE])
  HAVE_GETGROUPS=1;       AC_SUBST([HAVE_GETGROUPS])
  HAVE_GETHOSTNAME=1;     AC_SUBST([HAVE_GETHOSTNAME])
  HAVE_GETLOGIN=1;        AC_SUBST([HAVE_GETLOGIN])
  HAVE_GETPAGESIZE=1;     AC_SUBST([HAVE_GETPAGESIZE])
  HAVE_GROUP_MEMBER=1;    AC_SUBST([HAVE_GROUP_MEMBER])
  HAVE_LCHOWN=1;          AC_SUBST([HAVE_LCHOWN])
  HAVE_LINK=1;            AC_SUBST([HAVE_LINK])
  HAVE_LINKAT=1;          AC_SUBST([HAVE_LINKAT])
  HAVE_PIPE=1;            AC_SUBST([HAVE_PIPE])
  HAVE_PIPE2=1;           AC_SUBST([HAVE_PIPE2])
  HAVE_PREAD=1;           AC_SUBST([HAVE_PREAD])
  HAVE_PWRITE=1;          AC_SUBST([HAVE_PWRITE])
  HAVE_READLINK=1;        AC_SUBST([HAVE_READLINK])
  HAVE_READLINKAT=1;      AC_SUBST([HAVE_READLINKAT])
  HAVE_SETHOSTNAME=1;     AC_SUBST([HAVE_SETHOSTNAME])
  HAVE_SLEEP=1;           AC_SUBST([HAVE_SLEEP])
  HAVE_SYMLINK=1;         AC_SUBST([HAVE_SYMLINK])
  HAVE_SYMLINKAT=1;       AC_SUBST([HAVE_SYMLINKAT])
  HAVE_UNLINKAT=1;        AC_SUBST([HAVE_UNLINKAT])
  HAVE_USLEEP=1;          AC_SUBST([HAVE_USLEEP])
  HAVE_DECL_ENVIRON=1;    AC_SUBST([HAVE_DECL_ENVIRON])
  HAVE_DECL_FCHDIR=1;     AC_SUBST([HAVE_DECL_FCHDIR])
  HAVE_DECL_FDATASYNC=1;  AC_SUBST([HAVE_DECL_FDATASYNC])
  HAVE_DECL_GETDOMAINNAME=1; AC_SUBST([HAVE_DECL_GETDOMAINNAME])
  HAVE_DECL_GETLOGIN_R=1; AC_SUBST([HAVE_DECL_GETLOGIN_R])
  HAVE_DECL_GETPAGESIZE=1; AC_SUBST([HAVE_DECL_GETPAGESIZE])
  HAVE_DECL_GETUSERSHELL=1; AC_SUBST([HAVE_DECL_GETUSERSHELL])
  HAVE_DECL_SETHOSTNAME=1; AC_SUBST([HAVE_DECL_SETHOSTNAME])
  HAVE_DECL_TTYNAME_R=1;  AC_SUBST([HAVE_DECL_TTYNAME_R])
  HAVE_OS_H=0;            AC_SUBST([HAVE_OS_H])
  HAVE_SYS_PARAM_H=0;     AC_SUBST([HAVE_SYS_PARAM_H])
  REPLACE_CHOWN=0;        AC_SUBST([REPLACE_CHOWN])
  REPLACE_CLOSE=0;        AC_SUBST([REPLACE_CLOSE])
  REPLACE_DUP=0;          AC_SUBST([REPLACE_DUP])
  REPLACE_DUP2=0;         AC_SUBST([REPLACE_DUP2])
  REPLACE_FCHOWNAT=0;     AC_SUBST([REPLACE_FCHOWNAT])
  REPLACE_FTRUNCATE=0;    AC_SUBST([REPLACE_FTRUNCATE])
  REPLACE_GETCWD=0;       AC_SUBST([REPLACE_GETCWD])
  REPLACE_GETDOMAINNAME=0; AC_SUBST([REPLACE_GETDOMAINNAME])
  REPLACE_GETLOGIN_R=0;   AC_SUBST([REPLACE_GETLOGIN_R])
  REPLACE_GETGROUPS=0;    AC_SUBST([REPLACE_GETGROUPS])
  REPLACE_GETPAGESIZE=0;  AC_SUBST([REPLACE_GETPAGESIZE])
  REPLACE_ISATTY=0;       AC_SUBST([REPLACE_ISATTY])
  REPLACE_LCHOWN=0;       AC_SUBST([REPLACE_LCHOWN])
  REPLACE_LINK=0;         AC_SUBST([REPLACE_LINK])
  REPLACE_LINKAT=0;       AC_SUBST([REPLACE_LINKAT])
  REPLACE_LSEEK=0;        AC_SUBST([REPLACE_LSEEK])
  REPLACE_PREAD=0;        AC_SUBST([REPLACE_PREAD])
  REPLACE_PWRITE=0;       AC_SUBST([REPLACE_PWRITE])
  REPLACE_READ=0;         AC_SUBST([REPLACE_READ])
  REPLACE_READLINK=0;     AC_SUBST([REPLACE_READLINK])
  REPLACE_RMDIR=0;        AC_SUBST([REPLACE_RMDIR])
  REPLACE_SLEEP=0;        AC_SUBST([REPLACE_SLEEP])
  REPLACE_SYMLINK=0;      AC_SUBST([REPLACE_SYMLINK])
  REPLACE_TTYNAME_R=0;    AC_SUBST([REPLACE_TTYNAME_R])
  REPLACE_UNLINK=0;       AC_SUBST([REPLACE_UNLINK])
  REPLACE_UNLINKAT=0;     AC_SUBST([REPLACE_UNLINKAT])
  REPLACE_USLEEP=0;       AC_SUBST([REPLACE_USLEEP])
  REPLACE_WRITE=0;        AC_SUBST([REPLACE_WRITE])
  UNISTD_H_HAVE_WINSOCK2_H=0; AC_SUBST([UNISTD_H_HAVE_WINSOCK2_H])
  UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS=0;
                           AC_SUBST([UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS])
])
