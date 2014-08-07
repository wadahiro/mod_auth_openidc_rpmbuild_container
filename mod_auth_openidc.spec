Name:		mod_auth_openidc
Version:	1.5.2
Release:	1%{?dist}
Summary:	Authentication/Authorization module for the Apache 2.x HTTP server that allows users to authenticate using an OpenID Connect enabled Identity Provider

Group:		Networking/Daemons/HTTP
License:	Apache License Version 2.0
URL:		https://github.com/pingidentity/mod_auth_openidc
Source0:        mod_auth_openidc-%{version}.tar.gz

Requires:       httpd, openssl, curl, jansson
BuildRequires:	httpd-devel, openssl-devel, curl-devel, jansson-devel

%description
This module enables an Apache 2.x web server to operate as an OpenID Connect Relying Party. The module supports all defined OpenID Connect flows, including Basic Client Profile, Implicit Client Profile and Hybrid flows.

%prep
%setup -q

%build
autoreconf
%configure --disable-static
make

%install
make install
mkdir -p $RPM_BUILD_ROOT%{_libdir}/httpd/modules/
mv %{_libdir}/httpd/modules/mod_auth_openidc.so $RPM_BUILD_ROOT%{_libdir}/httpd/modules/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%doc LICENSE.txt ChangeLog 
%{_libdir}/httpd/modules/mod_auth_openidc.so

%changelog
* Sat Jul 26 2014 Hiroyuki Wada <wadahiro@gmail.com> 1.5.2-1
- Initial packaging for CentOS6/RHEL6.
