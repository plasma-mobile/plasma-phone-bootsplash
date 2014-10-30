Name:       plasma-phone-bootsplash
Summary:    Plasma Phone theme for Maui Boot Splash
Version:    1
Release:    1
Group:      System/Base
License:    GPLv2+
URL:        https://www.plasma-mobile.org
Source0:    %{name}-%{version}.tar.xz

Provides:   maui-bootsplash-theme

%description
Plasma Phone boot splash theme for Maui Boot Splash.


%prep
%setup -q -n %{name}-%{version}


%install
for file in klogo.png mlogo.png main.qml; do
    install -D -m 0644 splash/$file %{buildroot}%{_datadir}/maui-bootsplash/$file
done


%files
%defattr(-,root,root,-)
%{_datadir}/maui-bootsplash/*
