APE=/sys/src/ape
<$APE/config

LIB=/$objtype/lib/ape/libopusenc.a

OFILES=\
	ogg_packer.$O \
	opus_header.$O \
	opusenc.$O \
	picture.$O \
	resample.$O \
	unicode_support.$O \

HFILES=\
	/sys/include/ape/opus/opusenc.h \

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\

</sys/src/cmd/mksyslib

CFLAGS=$CFLAGS -c \
	-Iinclude \
	-I/sys/src/cmd/audio/libogg \
	-I/sys/include/ape/opus \
	-DPACKAGE_VERSION="fuckoff" \
	-DPACKAGE_NAME="libopusenc" \
	-DOUTSIDE_SPEEX \
	-DRANDOM_PREFIX=opusenc \
	-D_POSIX_SOURCE

%.$O:	src/%.c
	$CC $CFLAGS src/$stem.c

$HFILES:
	mkdir -p /sys/include/ape/opus
	dircp include /sys/include/ape/opus
