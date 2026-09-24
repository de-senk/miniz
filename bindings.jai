//
// This file was auto-generated using the following command:
//
// jai ./generate.jai
//



MINIZ_X86_OR_X64_CPU :: 1;

MINIZ_LITTLE_ENDIAN :: 1;

MINIZ_USE_UNALIGNED_LOADS_AND_STORES :: 0;

MINIZ_HAS_64BIT_REGISTERS :: 1;

MZ_ADLER32_INIT :: 1;

MZ_CRC32_INIT :: 0;

MZ_DEFLATED :: 8;

MZ_VERSION :: "11.3.2";
MZ_VERNUM :: 0xB302;
MZ_VER_MAJOR :: 11;
MZ_VER_MINOR :: 3;
MZ_VER_REVISION :: 2;
MZ_VER_SUBREVISION :: 0;

MZ_DEFAULT_WINDOW_BITS :: 15;

Z_NULL :: 0;

Z_DEFLATED :: MZ_DEFLATED;
Z_DEFAULT_WINDOW_BITS :: MZ_DEFAULT_WINDOW_BITS;

internal_state :: mz_internal_state;
z_stream :: mz_stream;

MAX_WBITS :: 15;
MAX_MEM_LEVEL :: 9;

ZLIB_VERSION :: MZ_VERSION;
ZLIB_VERNUM :: MZ_VERNUM;
ZLIB_VER_MAJOR :: MZ_VER_MAJOR;
ZLIB_VER_MINOR :: MZ_VER_MINOR;
ZLIB_VER_REVISION :: MZ_VER_REVISION;
ZLIB_VER_SUBREVISION :: MZ_VER_SUBREVISION;

zlibVersion :: mz_version;

MZ_FALSE :: 0;
MZ_TRUE :: 1;

MZ_UINT16_MAX :: 0xFFFF;
MZ_UINT32_MAX :: 0xFFFFFFFF;

TDEFL_LESS_MEMORY :: 0;

TINFL_DECOMPRESS_MEM_TO_MEM_FAILED :: cast,trunc(u64) (-1);

TINFL_LZ_DICT_SIZE :: 32768;

TINFL_USE_64BIT_BITBUF :: 1;

TINFL_BITBUF_SIZE :: 64;

/* For more compatibility with zlib, miniz.c uses unsigned long for some parameters/struct members. Beware: mz_ulong can be either 32 or 64-bits! */
mz_ulong :: u32;

/* mz_free() internally uses the MZ_FREE() macro (which by default calls free() unless you've modified the MZ_MALLOC macro) to release a block allocated from the heap. */
mz_free :: (p: *void) -> void #foreign miniz;

/* mz_adler32() returns the initial adler-32 value to use when called with ptr==NULL. */
mz_adler32 :: (adler: mz_ulong, ptr: *u8, buf_len: u64) -> mz_ulong #foreign miniz;

/* mz_crc32() returns the initial CRC-32 value to use when called with ptr==NULL. */
mz_crc32 :: (crc: mz_ulong, ptr: *u8, buf_len: u64) -> mz_ulong #foreign miniz;

/* Compression strategies. */
MZ :: enum s32 {
    DEFAULT_STRATEGY :: 0;
    FILTERED         :: 1;
    HUFFMAN_ONLY     :: 2;
    RLE              :: 3;
    FIXED            :: 4;

    MZ_DEFAULT_STRATEGY :: DEFAULT_STRATEGY;
    MZ_FILTERED         :: FILTERED;
    MZ_HUFFMAN_ONLY     :: HUFFMAN_ONLY;
    MZ_RLE              :: RLE;
    MZ_FIXED            :: FIXED;
}

/* Heap allocation callbacks.
Note that mz_alloc_func parameter types purposely differ from zlib's: items/size is size_t, not unsigned long. */
mz_alloc_func :: #type (opaque: *void, items: u64, size: u64) -> *void #c_call;
mz_free_func :: #type (opaque: *void, address: *void) -> void #c_call;
mz_realloc_func :: #type (opaque: *void, address: *void, items: u64, size: u64) -> *void #c_call;

/* Compression levels: 0-9 are the standard zlib-style levels, 10 is best possible compression (not zlib compatible, and may be very slow), MZ_DEFAULT_COMPRESSION=MZ_DEFAULT_LEVEL. */
MZ_1 :: enum s32 {
    NO_COMPRESSION      :: 0;
    BEST_SPEED          :: 1;
    BEST_COMPRESSION    :: 9;
    UBER_COMPRESSION    :: 10;
    DEFAULT_LEVEL       :: 6;
    DEFAULT_COMPRESSION :: -1;

    MZ_NO_COMPRESSION      :: NO_COMPRESSION;
    MZ_BEST_SPEED          :: BEST_SPEED;
    MZ_BEST_COMPRESSION    :: BEST_COMPRESSION;
    MZ_UBER_COMPRESSION    :: UBER_COMPRESSION;
    MZ_DEFAULT_LEVEL       :: DEFAULT_LEVEL;
    MZ_DEFAULT_COMPRESSION :: DEFAULT_COMPRESSION;
}

/* Flush values. For typical usage you only need MZ_NO_FLUSH and MZ_FINISH. The other values are for advanced use (refer to the zlib docs). */
MZ_2 :: enum s32 {
    NO_FLUSH      :: 0;
    PARTIAL_FLUSH :: 1;
    SYNC_FLUSH    :: 2;
    FULL_FLUSH    :: 3;
    FINISH        :: 4;
    BLOCK         :: 5;

    MZ_NO_FLUSH      :: NO_FLUSH;
    MZ_PARTIAL_FLUSH :: PARTIAL_FLUSH;
    MZ_SYNC_FLUSH    :: SYNC_FLUSH;
    MZ_FULL_FLUSH    :: FULL_FLUSH;
    MZ_FINISH        :: FINISH;
    MZ_BLOCK         :: BLOCK;
}

/* Return status codes. MZ_PARAM_ERROR is non-standard. */
MZ_3 :: enum s32 {
    OK            :: 0;
    STREAM_END    :: 1;
    NEED_DICT     :: 2;
    ERRNO         :: -1;
    STREAM_ERROR  :: -2;
    DATA_ERROR    :: -3;
    MEM_ERROR     :: -4;
    BUF_ERROR     :: -5;
    VERSION_ERROR :: -6;
    PARAM_ERROR   :: -10000;

    MZ_OK            :: OK;
    MZ_STREAM_END    :: STREAM_END;
    MZ_NEED_DICT     :: NEED_DICT;
    MZ_ERRNO         :: ERRNO;
    MZ_STREAM_ERROR  :: STREAM_ERROR;
    MZ_DATA_ERROR    :: DATA_ERROR;
    MZ_MEM_ERROR     :: MEM_ERROR;
    MZ_BUF_ERROR     :: BUF_ERROR;
    MZ_VERSION_ERROR :: VERSION_ERROR;
    MZ_PARAM_ERROR   :: PARAM_ERROR;
}

mz_internal_state :: struct {}

/* Compression/decompression stream struct. */
mz_stream_s :: struct {
    next_in:   *u8; /* pointer to next byte to read */
    avail_in:  u32; /* number of bytes available at next_in */
    total_in:  mz_ulong; /* total number of bytes consumed so far */

    next_out:  *u8; /* pointer to next byte to write */
    avail_out: u32; /* number of bytes that can be written to next_out */
    total_out: mz_ulong; /* total number of bytes produced so far */

    msg:       *u8; /* error msg (unused) */
    state:     *mz_internal_state; /* internal state, allocated by zalloc/zfree */

    zalloc:    mz_alloc_func; /* optional heap allocation function (defaults to malloc) */
    zfree:     mz_free_func; /* optional heap free function (defaults to free) */
    opaque:    *void; /* heap alloc function user pointer */

    data_type: s32; /* data_type (unused) */
    adler:     mz_ulong; /* adler32 of the source or uncompressed data */
    reserved:  mz_ulong; /* not used */
}

/* Compression/decompression stream struct. */
mz_stream :: mz_stream_s;

mz_streamp :: *mz_stream;

/* Returns the version string of miniz.c. */
mz_version :: () -> *u8 #foreign miniz;

/* mz_deflateInit() initializes a compressor with default options: */
/* Parameters: */
/*  pStream must point to an initialized mz_stream struct. */
/*  level must be between [MZ_NO_COMPRESSION, MZ_BEST_COMPRESSION]. */
/*  level 1 enables a specially optimized compression function that's been optimized purely for performance, not ratio. */
/*  (This special func. is currently only enabled when MINIZ_USE_UNALIGNED_LOADS_AND_STORES and MINIZ_LITTLE_ENDIAN are defined.) */
/* Return values: */
/*  MZ_OK on success. */
/*  MZ_STREAM_ERROR if the stream is bogus. */
/*  MZ_PARAM_ERROR if the input parameters are bogus. */
/*  MZ_MEM_ERROR on out of memory. */
mz_deflateInit :: (pStream: mz_streamp, level: s32) -> s32 #foreign miniz;

/* mz_deflateInit2() is like mz_deflate(), except with more control: */
/* Additional parameters: */
/*   method must be MZ_DEFLATED */
/*   window_bits must be MZ_DEFAULT_WINDOW_BITS (to wrap the deflate stream with zlib header/adler-32 footer) or -MZ_DEFAULT_WINDOW_BITS (raw deflate/no header or footer) */
/*   mem_level must be between [1, 9] (it's checked but ignored by miniz.c) */
mz_deflateInit2 :: (pStream: mz_streamp, level: s32, method: s32, window_bits: s32, mem_level: s32, strategy: s32) -> s32 #foreign miniz;

/* Quickly resets a compressor without having to reallocate anything. Same as calling mz_deflateEnd() followed by mz_deflateInit()/mz_deflateInit2(). */
mz_deflateReset :: (pStream: mz_streamp) -> s32 #foreign miniz;

/* mz_deflate() compresses the input to output, consuming as much of the input and producing as much output as possible. */
/* Parameters: */
/*   pStream is the stream to read from and write to. You must initialize/update the next_in, avail_in, next_out, and avail_out members. */
/*   flush may be MZ_NO_FLUSH, MZ_PARTIAL_FLUSH/MZ_SYNC_FLUSH, MZ_FULL_FLUSH, or MZ_FINISH. */
/* Return values: */
/*   MZ_OK on success (when flushing, or if more input is needed but not available, and/or there's more output to be written but the output buffer is full). */
/*   MZ_STREAM_END if all input has been consumed and all output bytes have been written. Don't call mz_deflate() on the stream anymore. */
/*   MZ_STREAM_ERROR if the stream is bogus. */
/*   MZ_PARAM_ERROR if one of the parameters is invalid. */
/*   MZ_BUF_ERROR if no forward progress is possible because the input and/or output buffers are empty. (Fill up the input buffer or free up some output space and try again.) */
mz_deflate :: (pStream: mz_streamp, flush: s32) -> s32 #foreign miniz;

/* mz_deflateEnd() deinitializes a compressor: */
/* Return values: */
/*  MZ_OK on success. */
/*  MZ_STREAM_ERROR if the stream is bogus. */
mz_deflateEnd :: (pStream: mz_streamp) -> s32 #foreign miniz;

/* mz_deflateBound() returns a (very) conservative upper bound on the amount of data that could be generated by deflate(), assuming flush is set to only MZ_NO_FLUSH or MZ_FINISH. */
mz_deflateBound :: (pStream: mz_streamp, source_len: mz_ulong) -> mz_ulong #foreign miniz;

/* Single-call compression functions mz_compress() and mz_compress2(): */
/* Returns MZ_OK on success, or one of the error codes from mz_deflate() on failure. */
mz_compress :: (pDest: *u8, pDest_len: *mz_ulong, pSource: *u8, source_len: mz_ulong) -> s32 #foreign miniz;
mz_compress2 :: (pDest: *u8, pDest_len: *mz_ulong, pSource: *u8, source_len: mz_ulong, level: s32) -> s32 #foreign miniz;

/* mz_compressBound() returns a (very) conservative upper bound on the amount of data that could be generated by calling mz_compress(). */
mz_compressBound :: (source_len: mz_ulong) -> mz_ulong #foreign miniz;

/* Initializes a decompressor. */
mz_inflateInit :: (pStream: mz_streamp) -> s32 #foreign miniz;

/* mz_inflateInit2() is like mz_inflateInit() with an additional option that controls the window size and whether or not the stream has been wrapped with a zlib header/footer: */
/* window_bits must be MZ_DEFAULT_WINDOW_BITS (to parse zlib header/footer) or -MZ_DEFAULT_WINDOW_BITS (raw deflate). */
mz_inflateInit2 :: (pStream: mz_streamp, window_bits: s32) -> s32 #foreign miniz;

/* Quickly resets a compressor without having to reallocate anything. Same as calling mz_inflateEnd() followed by mz_inflateInit()/mz_inflateInit2(). */
mz_inflateReset :: (pStream: mz_streamp) -> s32 #foreign miniz;

/* Decompresses the input stream to the output, consuming only as much of the input as needed, and writing as much to the output as possible. */
/* Parameters: */
/*   pStream is the stream to read from and write to. You must initialize/update the next_in, avail_in, next_out, and avail_out members. */
/*   flush may be MZ_NO_FLUSH, MZ_SYNC_FLUSH, or MZ_FINISH. */
/*   On the first call, if flush is MZ_FINISH it's assumed the input and output buffers are both sized large enough to decompress the entire stream in a single call (this is slightly faster). */
/*   MZ_FINISH implies that there are no more source bytes available beside what's already in the input buffer, and that the output buffer is large enough to hold the rest of the decompressed data. */
/* Return values: */
/*   MZ_OK on success. Either more input is needed but not available, and/or there's more output to be written but the output buffer is full. */
/*   MZ_STREAM_END if all needed input has been consumed and all output bytes have been written. For zlib streams, the adler-32 of the decompressed data has also been verified. */
/*   MZ_STREAM_ERROR if the stream is bogus. */
/*   MZ_DATA_ERROR if the deflate stream is invalid. */
/*   MZ_PARAM_ERROR if one of the parameters is invalid. */
/*   MZ_BUF_ERROR if no forward progress is possible because the input buffer is empty but the inflater needs more input to continue, or if the output buffer is not large enough. Call mz_inflate() again */
/*   with more input data, or with more room in the output buffer (except when using single call decompression, described above). */
mz_inflate :: (pStream: mz_streamp, flush: s32) -> s32 #foreign miniz;

/* Deinitializes a decompressor. */
mz_inflateEnd :: (pStream: mz_streamp) -> s32 #foreign miniz;

/* Single-call decompression. */
/* Returns MZ_OK on success, or one of the error codes from mz_inflate() on failure. */
mz_uncompress :: (pDest: *u8, pDest_len: *mz_ulong, pSource: *u8, source_len: mz_ulong) -> s32 #foreign miniz;
mz_uncompress2 :: (pDest: *u8, pDest_len: *mz_ulong, pSource: *u8, pSource_len: *mz_ulong) -> s32 #foreign miniz;

/* Returns a string description of the specified error code, or NULL if the error code is invalid. */
mz_error :: (err: s32) -> *u8 #foreign miniz;

Byte :: u8;
uInt :: u32;
uLong :: mz_ulong;
Bytef :: Byte;
uIntf :: uInt;
charf :: u8;
intf :: s32;
voidpf :: *void;
uLongf :: uLong;
voidp :: *void;
voidpc :: *void;

/* See mz_alloc_func */
alloc_func :: #type (opaque: *void, items: u64, size: u64) -> *void #c_call;

/* See mz_free_func */
free_func :: #type (opaque: *void, address: *void) -> void #c_call;

/* ------------------- Types and macros */
mz_uint8 :: u8;
mz_int16 :: s16;
mz_uint16 :: u16;
mz_uint32 :: u32;
mz_uint :: u32;
mz_int64 :: s64;
mz_uint64 :: u64;
mz_bool :: s32;

miniz_def_alloc_func :: (opaque: *void, items: u64, size: u64) -> *void #foreign miniz;
miniz_def_free_func :: (opaque: *void, address: *void) -> void #foreign miniz;
miniz_def_realloc_func :: (opaque: *void, address: *void, items: u64, size: u64) -> *void #foreign miniz;

/* tdefl_init() compression flags logically OR'd together (low 12 bits contain the max. number of probes per dictionary search): */
/* TDEFL_DEFAULT_MAX_PROBES: The compressor defaults to 128 dictionary probes per dictionary search. 0=Huffman only, 1=Huffman+LZ (fastest/crap compression), 4095=Huffman+LZ (slowest/best compression). */
TDEFL :: enum s32 {
    HUFFMAN_ONLY       :: 0;
    DEFAULT_MAX_PROBES :: 128;
    MAX_PROBES_MASK    :: 4095;

    TDEFL_HUFFMAN_ONLY       :: HUFFMAN_ONLY;
    TDEFL_DEFAULT_MAX_PROBES :: DEFAULT_MAX_PROBES;
    TDEFL_MAX_PROBES_MASK    :: MAX_PROBES_MASK;
}

/* TDEFL_WRITE_ZLIB_HEADER: If set, the compressor outputs a zlib header before the deflate data, and the Adler-32 of the source data at the end. Otherwise, you'll get raw deflate data. */
/* TDEFL_COMPUTE_ADLER32: Always compute the adler-32 of the input data (even when not writing zlib headers). */
/* TDEFL_GREEDY_PARSING_FLAG: Set to use faster greedy parsing, instead of more efficient lazy parsing. */
/* TDEFL_NONDETERMINISTIC_PARSING_FLAG: Enable to decrease the compressor's initialization time to the minimum, but the output may vary from run to run given the same input (depending on the contents of memory). */
/* TDEFL_RLE_MATCHES: Only look for RLE matches (matches with a distance of 1) */
/* TDEFL_FILTER_MATCHES: Discards matches <= 5 chars if enabled. */
/* TDEFL_FORCE_ALL_STATIC_BLOCKS: Disable usage of optimized Huffman tables. */
/* TDEFL_FORCE_ALL_RAW_BLOCKS: Only use raw (uncompressed) deflate blocks. */
/* The low 12 bits are reserved to control the max # of hash probes per dictionary lookup (see TDEFL_MAX_PROBES_MASK). */
TDEFL_1 :: enum s32 {
    WRITE_ZLIB_HEADER             :: 4096;
    COMPUTE_ADLER32               :: 8192;
    GREEDY_PARSING_FLAG           :: 16384;
    NONDETERMINISTIC_PARSING_FLAG :: 32768;
    RLE_MATCHES                   :: 65536;
    FILTER_MATCHES                :: 131072;
    FORCE_ALL_STATIC_BLOCKS       :: 262144;
    FORCE_ALL_RAW_BLOCKS          :: 524288;

    TDEFL_WRITE_ZLIB_HEADER             :: WRITE_ZLIB_HEADER;
    TDEFL_COMPUTE_ADLER32               :: COMPUTE_ADLER32;
    TDEFL_GREEDY_PARSING_FLAG           :: GREEDY_PARSING_FLAG;
    TDEFL_NONDETERMINISTIC_PARSING_FLAG :: NONDETERMINISTIC_PARSING_FLAG;
    TDEFL_RLE_MATCHES                   :: RLE_MATCHES;
    TDEFL_FILTER_MATCHES                :: FILTER_MATCHES;
    TDEFL_FORCE_ALL_STATIC_BLOCKS       :: FORCE_ALL_STATIC_BLOCKS;
    TDEFL_FORCE_ALL_RAW_BLOCKS          :: FORCE_ALL_RAW_BLOCKS;
}

/* High level compression functions: */
/* tdefl_compress_mem_to_heap() compresses a block in memory to a heap block allocated via malloc(). */
/* On entry: */
/*  pSrc_buf, src_buf_len: Pointer and size of source block to compress. */
/*  flags: The max match finder probes (default is 128) logically OR'd against the above flags. Higher probes are slower but improve compression. */
/* On return: */
/*  Function returns a pointer to the compressed data, or NULL on failure. */
/*  *pOut_len will be set to the compressed data's size, which could be larger than src_buf_len on uncompressible data. */
/*  The caller must free() the returned block when it's no longer needed. */
tdefl_compress_mem_to_heap :: (pSrc_buf: *void, src_buf_len: u64, pOut_len: *u64, flags: s32) -> *void #foreign miniz;

/* tdefl_compress_mem_to_mem() compresses a block in memory to another block in memory. */
/* Returns 0 on failure. */
tdefl_compress_mem_to_mem :: (pOut_buf: *void, out_buf_len: u64, pSrc_buf: *void, src_buf_len: u64, flags: s32) -> u64 #foreign miniz;

/* Compresses an image to a compressed PNG file in memory. */
/* On entry: */
/*  pImage, w, h, and num_chans describe the image to compress. num_chans may be 1, 2, 3, or 4. */
/*  The image pitch in bytes per scanline will be w*num_chans. The leftmost pixel on the top scanline is stored first in memory. */
/*  level may range from [0,10], use MZ_NO_COMPRESSION, MZ_BEST_SPEED, MZ_BEST_COMPRESSION, etc. or a decent default is MZ_DEFAULT_LEVEL */
/*  If flip is true, the image will be flipped on the Y axis (useful for OpenGL apps). */
/* On return: */
/*  Function returns a pointer to the compressed data, or NULL on failure. */
/*  *pLen_out will be set to the size of the PNG image file. */
/*  The caller must mz_free() the returned heap block (which will typically be larger than *pLen_out) when it's no longer needed. */
tdefl_write_image_to_png_file_in_memory_ex :: (pImage: *void, w: s32, h: s32, num_chans: s32, pLen_out: *u64, level: mz_uint, flip: mz_bool) -> *void #foreign miniz;
tdefl_write_image_to_png_file_in_memory :: (pImage: *void, w: s32, h: s32, num_chans: s32, pLen_out: *u64) -> *void #foreign miniz;

/* Output stream interface. The compressor uses this interface to write compressed data. It'll typically be called TDEFL_OUT_BUF_SIZE at a time. */
tdefl_put_buf_func_ptr :: #type (pBuf: *void, len: s32, pUser: *void) -> mz_bool #c_call;

/* tdefl_compress_mem_to_output() compresses a block to an output stream. The above helpers use this function internally. */
tdefl_compress_mem_to_output :: (pBuf: *void, buf_len: u64, pPut_buf_func: tdefl_put_buf_func_ptr, pPut_buf_user: *void, flags: s32) -> mz_bool #foreign miniz;

TDEFL_2 :: enum s32 {
    MAX_HUFF_TABLES    :: 3;
    MAX_HUFF_SYMBOLS_0 :: 288;
    MAX_HUFF_SYMBOLS_1 :: 32;
    MAX_HUFF_SYMBOLS_2 :: 19;
    LZ_DICT_SIZE       :: 32768;
    LZ_DICT_SIZE_MASK  :: 32767;
    MIN_MATCH_LEN      :: 3;
    MAX_MATCH_LEN      :: 258;

    TDEFL_MAX_HUFF_TABLES    :: MAX_HUFF_TABLES;
    TDEFL_MAX_HUFF_SYMBOLS_0 :: MAX_HUFF_SYMBOLS_0;
    TDEFL_MAX_HUFF_SYMBOLS_1 :: MAX_HUFF_SYMBOLS_1;
    TDEFL_MAX_HUFF_SYMBOLS_2 :: MAX_HUFF_SYMBOLS_2;
    TDEFL_LZ_DICT_SIZE       :: LZ_DICT_SIZE;
    TDEFL_LZ_DICT_SIZE_MASK  :: LZ_DICT_SIZE_MASK;
    TDEFL_MIN_MATCH_LEN      :: MIN_MATCH_LEN;
    TDEFL_MAX_MATCH_LEN      :: MAX_MATCH_LEN;
}

TDEFL_3 :: enum s32 {
    LZ_CODE_BUF_SIZE      :: 65536;
    OUT_BUF_SIZE          :: 85196;
    MAX_HUFF_SYMBOLS      :: 288;
    LZ_HASH_BITS          :: 15;
    LEVEL1_HASH_SIZE_MASK :: 4095;
    LZ_HASH_SHIFT         :: 5;
    LZ_HASH_SIZE          :: 32768;

    TDEFL_LZ_CODE_BUF_SIZE      :: LZ_CODE_BUF_SIZE;
    TDEFL_OUT_BUF_SIZE          :: OUT_BUF_SIZE;
    TDEFL_MAX_HUFF_SYMBOLS      :: MAX_HUFF_SYMBOLS;
    TDEFL_LZ_HASH_BITS          :: LZ_HASH_BITS;
    TDEFL_LEVEL1_HASH_SIZE_MASK :: LEVEL1_HASH_SIZE_MASK;
    TDEFL_LZ_HASH_SHIFT         :: LZ_HASH_SHIFT;
    TDEFL_LZ_HASH_SIZE          :: LZ_HASH_SIZE;
}

/* The low-level tdefl functions below may be used directly if the above helper functions aren't flexible enough. The low-level functions don't make any heap allocations, unlike the above helper functions. */
tdefl_status :: enum s32 {
    BAD_PARAM      :: -2;
    PUT_BUF_FAILED :: -1;
    OKAY           :: 0;
    DONE           :: 1;

    TDEFL_STATUS_BAD_PARAM      :: BAD_PARAM;
    TDEFL_STATUS_PUT_BUF_FAILED :: PUT_BUF_FAILED;
    TDEFL_STATUS_OKAY           :: OKAY;
    TDEFL_STATUS_DONE           :: DONE;
}

/* Must map to MZ_NO_FLUSH, MZ_SYNC_FLUSH, etc. enums */
tdefl_flush :: enum s32 {
    NO_FLUSH   :: 0;
    SYNC_FLUSH :: 2;
    FULL_FLUSH :: 3;
    FINISH     :: 4;

    TDEFL_NO_FLUSH   :: NO_FLUSH;
    TDEFL_SYNC_FLUSH :: SYNC_FLUSH;
    TDEFL_FULL_FLUSH :: FULL_FLUSH;
    TDEFL_FINISH     :: FINISH;
}

/* tdefl's compression state structure. */
tdefl_compressor :: struct {
    m_pPut_buf_func:          tdefl_put_buf_func_ptr;
    m_pPut_buf_user:          *void;
    m_flags:                  mz_uint;
    m_max_probes:             [2] mz_uint;
    m_greedy_parsing:         s32;
    m_adler32:                mz_uint;
    m_lookahead_pos:          mz_uint;
    m_lookahead_size:         mz_uint;
    m_dict_size:              mz_uint;
    m_pLZ_code_buf:           *mz_uint8;
    m_pLZ_flags:              *mz_uint8;
    m_pOutput_buf:            *mz_uint8;
    m_pOutput_buf_end:        *mz_uint8;
    m_num_flags_left:         mz_uint;
    m_total_lz_bytes:         mz_uint;
    m_lz_code_buf_dict_pos:   mz_uint;
    m_bits_in:                mz_uint;
    m_bit_buffer:             mz_uint;
    m_saved_match_dist:       mz_uint;
    m_saved_match_len:        mz_uint;
    m_saved_lit:              mz_uint;
    m_output_flush_ofs:       mz_uint;
    m_output_flush_remaining: mz_uint;
    m_finished:               mz_uint;
    m_block_index:            mz_uint;
    m_wants_to_finish:        mz_uint;
    m_prev_return_status:     tdefl_status;
    m_pIn_buf:                *void;
    m_pOut_buf:               *void;
    m_pIn_buf_size:           *u64;
    m_pOut_buf_size:          *u64;
    m_flush:                  tdefl_flush;
    m_pSrc:                   *mz_uint8;
    m_src_buf_left:           u64;
    m_out_buf_ofs:            u64;
    m_dict:                   [33025] mz_uint8;
    m_huff_count:             [3] [288] mz_uint16;
    m_huff_codes:             [3] [288] mz_uint16;
    m_huff_code_sizes:        [3] [288] mz_uint8;
    m_lz_code_buf:            [65536] mz_uint8;
    m_next:                   [32768] mz_uint16;
    m_hash:                   [32768] mz_uint16;
    m_output_buf:             [85196] mz_uint8;
}

/* Initializes the compressor. */
/* There is no corresponding deinit() function because the tdefl API's do not dynamically allocate memory. */
/* pBut_buf_func: If NULL, output data will be supplied to the specified callback. In this case, the user should call the tdefl_compress_buffer() API for compression. */
/* If pBut_buf_func is NULL the user should always call the tdefl_compress() API. */
/* flags: See the above enums (TDEFL_HUFFMAN_ONLY, TDEFL_WRITE_ZLIB_HEADER, etc.) */
tdefl_init :: (d: *tdefl_compressor, pPut_buf_func: tdefl_put_buf_func_ptr, pPut_buf_user: *void, flags: s32) -> tdefl_status #foreign miniz;

/* Compresses a block of data, consuming as much of the specified input buffer as possible, and writing as much compressed data to the specified output buffer as possible. */
tdefl_compress :: (d: *tdefl_compressor, pIn_buf: *void, pIn_buf_size: *u64, pOut_buf: *void, pOut_buf_size: *u64, flush: tdefl_flush) -> tdefl_status #foreign miniz;

/* tdefl_compress_buffer() is only usable when the tdefl_init() is called with a non-NULL tdefl_put_buf_func_ptr. */
/* tdefl_compress_buffer() always consumes the entire input buffer. */
tdefl_compress_buffer :: (d: *tdefl_compressor, pIn_buf: *void, in_buf_size: u64, flush: tdefl_flush) -> tdefl_status #foreign miniz;

tdefl_get_prev_return_status :: (d: *tdefl_compressor) -> tdefl_status #foreign miniz;
tdefl_get_adler32 :: (d: *tdefl_compressor) -> mz_uint32 #foreign miniz;

/* Create tdefl_compress() flags given zlib-style compression parameters. */
/* level may range from [0,10] (where 10 is absolute max compression, but may be much slower on some files) */
/* window_bits may be -15 (raw deflate) or 15 (zlib) */
/* strategy may be either MZ_DEFAULT_STRATEGY, MZ_FILTERED, MZ_HUFFMAN_ONLY, MZ_RLE, or MZ_FIXED */
tdefl_create_comp_flags_from_zip_params :: (level: s32, window_bits: s32, strategy: s32) -> mz_uint #foreign miniz;

/* Allocate the tdefl_compressor structure in C so that */
/* non-C language bindings to tdefl_ API don't need to worry about */
/* structure size and allocation mechanism. */
tdefl_compressor_alloc :: () -> *tdefl_compressor #foreign miniz;
tdefl_compressor_free :: (pComp: *tdefl_compressor) -> void #foreign miniz;

/* Decompression flags used by tinfl_decompress(). */
/* TINFL_FLAG_PARSE_ZLIB_HEADER: If set, the input has a valid zlib header and ends with an adler32 checksum (it's a valid zlib stream). Otherwise, the input is a raw deflate stream. */
/* TINFL_FLAG_HAS_MORE_INPUT: If set, there are more input bytes available beyond the end of the supplied input buffer. If clear, the input buffer contains all remaining input. */
/* TINFL_FLAG_USING_NON_WRAPPING_OUTPUT_BUF: If set, the output buffer is large enough to hold the entire decompressed stream. If clear, the output buffer is at least the size of the dictionary (typically 32KB). */
/* TINFL_FLAG_COMPUTE_ADLER32: Force adler-32 checksum computation of the decompressed bytes. */
TINFL_FLAG :: enum s32 {
    PARSE_ZLIB_HEADER             :: 1;
    HAS_MORE_INPUT                :: 2;
    USING_NON_WRAPPING_OUTPUT_BUF :: 4;
    COMPUTE_ADLER32               :: 8;

    TINFL_FLAG_PARSE_ZLIB_HEADER             :: PARSE_ZLIB_HEADER;
    TINFL_FLAG_HAS_MORE_INPUT                :: HAS_MORE_INPUT;
    TINFL_FLAG_USING_NON_WRAPPING_OUTPUT_BUF :: USING_NON_WRAPPING_OUTPUT_BUF;
    TINFL_FLAG_COMPUTE_ADLER32               :: COMPUTE_ADLER32;
}

/* High level decompression functions: */
/* tinfl_decompress_mem_to_heap() decompresses a block in memory to a heap block allocated via malloc(). */
/* On entry: */
/*  pSrc_buf, src_buf_len: Pointer and size of the Deflate or zlib source data to decompress. */
/* On return: */
/*  Function returns a pointer to the decompressed data, or NULL on failure. */
/*  *pOut_len will be set to the decompressed data's size, which could be larger than src_buf_len on uncompressible data. */
/*  The caller must call mz_free() on the returned block when it's no longer needed. */
tinfl_decompress_mem_to_heap :: (pSrc_buf: *void, src_buf_len: u64, pOut_len: *u64, flags: s32) -> *void #foreign miniz;

tinfl_decompress_mem_to_mem :: (pOut_buf: *void, out_buf_len: u64, pSrc_buf: *void, src_buf_len: u64, flags: s32) -> u64 #foreign miniz;

/* tinfl_decompress_mem_to_callback() decompresses a block in memory to an internal 32KB buffer, and a user provided callback function will be called to flush the buffer. */
/* Returns 1 on success or 0 on failure. */
tinfl_put_buf_func_ptr :: #type (pBuf: *void, len: s32, pUser: *void) -> s32 #c_call;
tinfl_decompress_mem_to_callback :: (pIn_buf: *void, pIn_buf_size: *u64, pPut_buf_func: tinfl_put_buf_func_ptr, pPut_buf_user: *void, flags: s32) -> s32 #foreign miniz;

tinfl_decompressor :: tinfl_decompressor_tag;

/* Allocate the tinfl_decompressor structure in C so that */
/* non-C language bindings to tinfl_ API don't need to worry about */
/* structure size and allocation mechanism. */
tinfl_decompressor_alloc :: () -> *tinfl_decompressor #foreign miniz;
tinfl_decompressor_free :: (pDecomp: *tinfl_decompressor) -> void #foreign miniz;

/* Return status. */
tinfl_status :: enum s32 {
    FAILED_CANNOT_MAKE_PROGRESS :: -4;

    BAD_PARAM                   :: -3;

    ADLER32_MISMATCH            :: -2;

    FAILED                      :: -1;

    DONE                        :: 0;

    NEEDS_MORE_INPUT            :: 1;

    HAS_MORE_OUTPUT             :: 2;

    TINFL_STATUS_FAILED_CANNOT_MAKE_PROGRESS :: FAILED_CANNOT_MAKE_PROGRESS;

    TINFL_STATUS_BAD_PARAM                   :: BAD_PARAM;

    TINFL_STATUS_ADLER32_MISMATCH            :: ADLER32_MISMATCH;

    TINFL_STATUS_FAILED                      :: FAILED;

    TINFL_STATUS_DONE                        :: DONE;

    TINFL_STATUS_NEEDS_MORE_INPUT            :: NEEDS_MORE_INPUT;

    TINFL_STATUS_HAS_MORE_OUTPUT             :: HAS_MORE_OUTPUT;
}

/* Main low-level decompressor coroutine function. This is the only function actually needed for decompression. All the other functions are just high-level helpers for improved usability. */
/* This is a universal API, i.e. it can be used as a building block to build any desired higher level decompression API. In the limit case, it can be called once per every byte input or output. */
tinfl_decompress :: (r: *tinfl_decompressor, pIn_buf_next: *mz_uint8, pIn_buf_size: *u64, pOut_buf_start: *mz_uint8, pOut_buf_next: *mz_uint8, pOut_buf_size: *u64, decomp_flags: mz_uint32) -> tinfl_status #foreign miniz;

/* Internal/private bits follow. */
TINFL :: enum s32 {
    MAX_HUFF_TABLES    :: 3;
    MAX_HUFF_SYMBOLS_0 :: 288;
    MAX_HUFF_SYMBOLS_1 :: 32;
    MAX_HUFF_SYMBOLS_2 :: 19;
    FAST_LOOKUP_BITS   :: 10;
    FAST_LOOKUP_SIZE   :: 1024;

    TINFL_MAX_HUFF_TABLES    :: MAX_HUFF_TABLES;
    TINFL_MAX_HUFF_SYMBOLS_0 :: MAX_HUFF_SYMBOLS_0;
    TINFL_MAX_HUFF_SYMBOLS_1 :: MAX_HUFF_SYMBOLS_1;
    TINFL_MAX_HUFF_SYMBOLS_2 :: MAX_HUFF_SYMBOLS_2;
    TINFL_FAST_LOOKUP_BITS   :: FAST_LOOKUP_BITS;
    TINFL_FAST_LOOKUP_SIZE   :: FAST_LOOKUP_SIZE;
}

tinfl_bit_buf_t :: mz_uint64;

tinfl_decompressor_tag :: struct {
    m_state:                   mz_uint32;
    m_num_bits:                mz_uint32;
    m_zhdr0:                   mz_uint32;
    m_zhdr1:                   mz_uint32;
    m_z_adler32:               mz_uint32;
    m_final:                   mz_uint32;
    m_type:                    mz_uint32;
    m_check_adler32:           mz_uint32;
    m_dist:                    mz_uint32;
    m_counter:                 mz_uint32;
    m_num_extra:               mz_uint32;
    m_table_sizes:             [3] mz_uint32;
    m_bit_buf:                 tinfl_bit_buf_t;
    m_dist_from_out_buf_start: u64;
    m_look_up:                 [3] [1024] mz_int16;
    m_tree_0:                  [576] mz_int16;
    m_tree_1:                  [64] mz_int16;
    m_tree_2:                  [38] mz_int16;
    m_code_size_0:             [288] mz_uint8;
    m_code_size_1:             [32] mz_uint8;
    m_code_size_2:             [19] mz_uint8;
    m_raw_header:              [4] mz_uint8;
    m_len_codes:               [457] mz_uint8;
}

MZ_ZIP_MAX :: enum s32 {
    IO_BUF_SIZE               :: 65536;
    ARCHIVE_FILENAME_SIZE     :: 512;
    ARCHIVE_FILE_COMMENT_SIZE :: 512;

    MZ_ZIP_MAX_IO_BUF_SIZE               :: IO_BUF_SIZE;
    MZ_ZIP_MAX_ARCHIVE_FILENAME_SIZE     :: ARCHIVE_FILENAME_SIZE;
    MZ_ZIP_MAX_ARCHIVE_FILE_COMMENT_SIZE :: ARCHIVE_FILE_COMMENT_SIZE;
}

mz_zip_archive_file_stat :: struct {
    /* Central directory file index. */
    m_file_index:       mz_uint32;

    /* Byte offset of this entry in the archive's central directory. Note we currently only support up to UINT_MAX or less bytes in the central dir. */
    m_central_dir_ofs:  mz_uint64;

    /* These fields are copied directly from the zip's central dir. */
    m_version_made_by:  mz_uint16;
    m_version_needed:   mz_uint16;
    m_bit_flag:         mz_uint16;
    m_method:           mz_uint16;

    /* CRC-32 of uncompressed data. */
    m_crc32:            mz_uint32;

    /* File's compressed size. */
    m_comp_size:        mz_uint64;

    /* File's uncompressed size. Note, I've seen some old archives where directory entries had 512 bytes for their uncompressed sizes, but when you try to unpack them you actually get 0 bytes. */
    m_uncomp_size:      mz_uint64;

    /* Zip internal and external file attributes. */
    m_internal_attr:    mz_uint16;
    m_external_attr:    mz_uint32;

    /* Entry's local header file offset in bytes. */
    m_local_header_ofs: mz_uint64;

    /* Size of comment in bytes. */
    m_comment_size:     mz_uint32;

    /* MZ_TRUE if the entry appears to be a directory. */
    m_is_directory:     mz_bool;

    /* MZ_TRUE if the entry uses encryption/strong encryption (which miniz_zip doesn't support) */
    m_is_encrypted:     mz_bool;

    /* MZ_TRUE if the file is not encrypted, a patch file, and if it uses a compression method we support. */
    m_is_supported:     mz_bool;

    /* Filename. If string ends in '/' it's a subdirectory entry. */
    /* Guaranteed to be zero terminated, may be truncated to fit. */
    m_filename:         [512] u8;

    /* Comment field. */
    /* Guaranteed to be zero terminated, may be truncated to fit. */
    m_comment:          [512] u8;

    m_time:             time_t;
}

mz_file_read_func :: #type (pOpaque: *void, file_ofs: mz_uint64, pBuf: *void, n: u64) -> u64 #c_call;
mz_file_write_func :: #type (pOpaque: *void, file_ofs: mz_uint64, pBuf: *void, n: u64) -> u64 #c_call;
mz_file_needs_keepalive :: #type (pOpaque: *void) -> mz_bool #c_call;

mz_zip_internal_state_tag :: struct {}
mz_zip_internal_state :: mz_zip_internal_state_tag;

mz_zip_mode :: enum s32 {
    INVALID                    :: 0;
    READING                    :: 1;
    WRITING                    :: 2;
    WRITING_HAS_BEEN_FINALIZED :: 3;

    MZ_ZIP_MODE_INVALID                    :: INVALID;
    MZ_ZIP_MODE_READING                    :: READING;
    MZ_ZIP_MODE_WRITING                    :: WRITING;
    MZ_ZIP_MODE_WRITING_HAS_BEEN_FINALIZED :: WRITING_HAS_BEEN_FINALIZED;
}

mz_zip_flags :: enum s32 {
    CASE_SENSITIVE                :: 256;
    IGNORE_PATH                   :: 512;
    COMPRESSED_DATA               :: 1024;
    DO_NOT_SORT_CENTRAL_DIRECTORY :: 2048;
    VALIDATE_LOCATE_FILE_FLAG     :: 4096;
    VALIDATE_HEADERS_ONLY         :: 8192;
    WRITE_ZIP64                   :: 16384;
    WRITE_ALLOW_READING           :: 32768;
    ASCII_FILENAME                :: 65536;

    WRITE_HEADER_SET_SIZE         :: 131072;
    READ_ALLOW_WRITING            :: 262144;

    MZ_ZIP_FLAG_CASE_SENSITIVE                :: CASE_SENSITIVE;
    MZ_ZIP_FLAG_IGNORE_PATH                   :: IGNORE_PATH;
    MZ_ZIP_FLAG_COMPRESSED_DATA               :: COMPRESSED_DATA;
    MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_DIRECTORY :: DO_NOT_SORT_CENTRAL_DIRECTORY;
    MZ_ZIP_FLAG_VALIDATE_LOCATE_FILE_FLAG     :: VALIDATE_LOCATE_FILE_FLAG;
    MZ_ZIP_FLAG_VALIDATE_HEADERS_ONLY         :: VALIDATE_HEADERS_ONLY;
    MZ_ZIP_FLAG_WRITE_ZIP64                   :: WRITE_ZIP64;
    MZ_ZIP_FLAG_WRITE_ALLOW_READING           :: WRITE_ALLOW_READING;
    MZ_ZIP_FLAG_ASCII_FILENAME                :: ASCII_FILENAME;

    MZ_ZIP_FLAG_WRITE_HEADER_SET_SIZE         :: WRITE_HEADER_SET_SIZE;
    MZ_ZIP_FLAG_READ_ALLOW_WRITING            :: READ_ALLOW_WRITING;
}

mz_zip_type :: enum s32 {
    TYPE_INVALID :: 0;
    TYPE_USER    :: 1;
    TYPE_MEMORY  :: 2;
    TYPE_HEAP    :: 3;
    TYPE_FILE    :: 4;
    TYPE_CFILE   :: 5;
    TOTAL_TYPES  :: 6;

    MZ_ZIP_TYPE_INVALID :: TYPE_INVALID;
    MZ_ZIP_TYPE_USER    :: TYPE_USER;
    MZ_ZIP_TYPE_MEMORY  :: TYPE_MEMORY;
    MZ_ZIP_TYPE_HEAP    :: TYPE_HEAP;
    MZ_ZIP_TYPE_FILE    :: TYPE_FILE;
    MZ_ZIP_TYPE_CFILE   :: TYPE_CFILE;
    MZ_ZIP_TOTAL_TYPES  :: TOTAL_TYPES;
}

/* miniz error codes. Be sure to update mz_zip_get_error_string() if you add or modify this enum. */
mz_zip_error :: enum s32 {
    NO_ERROR                     :: 0;
    UNDEFINED_ERROR              :: 1;
    TOO_MANY_FILES               :: 2;
    FILE_TOO_LARGE               :: 3;
    UNSUPPORTED_METHOD           :: 4;
    UNSUPPORTED_ENCRYPTION       :: 5;
    UNSUPPORTED_FEATURE          :: 6;
    FAILED_FINDING_CENTRAL_DIR   :: 7;
    NOT_AN_ARCHIVE               :: 8;
    INVALID_HEADER_OR_CORRUPTED  :: 9;
    UNSUPPORTED_MULTIDISK        :: 10;
    DECOMPRESSION_FAILED         :: 11;
    COMPRESSION_FAILED           :: 12;
    UNEXPECTED_DECOMPRESSED_SIZE :: 13;
    CRC_CHECK_FAILED             :: 14;
    UNSUPPORTED_CDIR_SIZE        :: 15;
    ALLOC_FAILED                 :: 16;
    FILE_OPEN_FAILED             :: 17;
    FILE_CREATE_FAILED           :: 18;
    FILE_WRITE_FAILED            :: 19;
    FILE_READ_FAILED             :: 20;
    FILE_CLOSE_FAILED            :: 21;
    FILE_SEEK_FAILED             :: 22;
    FILE_STAT_FAILED             :: 23;
    INVALID_PARAMETER            :: 24;
    INVALID_FILENAME             :: 25;
    BUF_TOO_SMALL                :: 26;
    INTERNAL_ERROR               :: 27;
    FILE_NOT_FOUND               :: 28;
    ARCHIVE_TOO_LARGE            :: 29;
    VALIDATION_FAILED            :: 30;
    WRITE_CALLBACK_FAILED        :: 31;
    TOTAL_ERRORS                 :: 32;

    MZ_ZIP_NO_ERROR                     :: NO_ERROR;
    MZ_ZIP_UNDEFINED_ERROR              :: UNDEFINED_ERROR;
    MZ_ZIP_TOO_MANY_FILES               :: TOO_MANY_FILES;
    MZ_ZIP_FILE_TOO_LARGE               :: FILE_TOO_LARGE;
    MZ_ZIP_UNSUPPORTED_METHOD           :: UNSUPPORTED_METHOD;
    MZ_ZIP_UNSUPPORTED_ENCRYPTION       :: UNSUPPORTED_ENCRYPTION;
    MZ_ZIP_UNSUPPORTED_FEATURE          :: UNSUPPORTED_FEATURE;
    MZ_ZIP_FAILED_FINDING_CENTRAL_DIR   :: FAILED_FINDING_CENTRAL_DIR;
    MZ_ZIP_NOT_AN_ARCHIVE               :: NOT_AN_ARCHIVE;
    MZ_ZIP_INVALID_HEADER_OR_CORRUPTED  :: INVALID_HEADER_OR_CORRUPTED;
    MZ_ZIP_UNSUPPORTED_MULTIDISK        :: UNSUPPORTED_MULTIDISK;
    MZ_ZIP_DECOMPRESSION_FAILED         :: DECOMPRESSION_FAILED;
    MZ_ZIP_COMPRESSION_FAILED           :: COMPRESSION_FAILED;
    MZ_ZIP_UNEXPECTED_DECOMPRESSED_SIZE :: UNEXPECTED_DECOMPRESSED_SIZE;
    MZ_ZIP_CRC_CHECK_FAILED             :: CRC_CHECK_FAILED;
    MZ_ZIP_UNSUPPORTED_CDIR_SIZE        :: UNSUPPORTED_CDIR_SIZE;
    MZ_ZIP_ALLOC_FAILED                 :: ALLOC_FAILED;
    MZ_ZIP_FILE_OPEN_FAILED             :: FILE_OPEN_FAILED;
    MZ_ZIP_FILE_CREATE_FAILED           :: FILE_CREATE_FAILED;
    MZ_ZIP_FILE_WRITE_FAILED            :: FILE_WRITE_FAILED;
    MZ_ZIP_FILE_READ_FAILED             :: FILE_READ_FAILED;
    MZ_ZIP_FILE_CLOSE_FAILED            :: FILE_CLOSE_FAILED;
    MZ_ZIP_FILE_SEEK_FAILED             :: FILE_SEEK_FAILED;
    MZ_ZIP_FILE_STAT_FAILED             :: FILE_STAT_FAILED;
    MZ_ZIP_INVALID_PARAMETER            :: INVALID_PARAMETER;
    MZ_ZIP_INVALID_FILENAME             :: INVALID_FILENAME;
    MZ_ZIP_BUF_TOO_SMALL                :: BUF_TOO_SMALL;
    MZ_ZIP_INTERNAL_ERROR               :: INTERNAL_ERROR;
    MZ_ZIP_FILE_NOT_FOUND               :: FILE_NOT_FOUND;
    MZ_ZIP_ARCHIVE_TOO_LARGE            :: ARCHIVE_TOO_LARGE;
    MZ_ZIP_VALIDATION_FAILED            :: VALIDATION_FAILED;
    MZ_ZIP_WRITE_CALLBACK_FAILED        :: WRITE_CALLBACK_FAILED;
    MZ_ZIP_TOTAL_ERRORS                 :: TOTAL_ERRORS;
}

mz_zip_archive :: struct {
    m_archive_size:               mz_uint64;
    m_central_directory_file_ofs: mz_uint64;

    /* We only support up to UINT32_MAX files in zip64 mode. */
    m_total_files:                mz_uint32;
    m_zip_mode:                   mz_zip_mode;
    m_zip_type:                   mz_zip_type;
    m_last_error:                 mz_zip_error;

    m_file_offset_alignment:      mz_uint64;

    m_pAlloc:                     mz_alloc_func;
    m_pFree:                      mz_free_func;
    m_pRealloc:                   mz_realloc_func;
    m_pAlloc_opaque:              *void;

    m_pRead:                      mz_file_read_func;
    m_pWrite:                     mz_file_write_func;
    m_pNeeds_keepalive:           mz_file_needs_keepalive;
    m_pIO_opaque:                 *void;

    m_pState:                     *mz_zip_internal_state;
}

mz_zip_reader_extract_iter_state :: struct {
    pZip:           *mz_zip_archive;
    flags:          mz_uint;

    status:         s32;

    read_buf_size:  mz_uint64;
    read_buf_ofs:   mz_uint64;
    read_buf_avail: mz_uint64;
    comp_remaining: mz_uint64;
    out_buf_ofs:    mz_uint64;
    cur_file_ofs:   mz_uint64;
    file_stat:      mz_zip_archive_file_stat;
    pRead_buf:      *void;
    pWrite_buf:     *void;

    out_blk_remain: u64;

    inflator:       tinfl_decompressor;

    file_crc32:     mz_uint;
}

/* Inits a ZIP archive reader. */
/* These functions read and validate the archive's central directory. */
mz_zip_reader_init :: (pZip: *mz_zip_archive, size: mz_uint64, flags: mz_uint) -> mz_bool #foreign miniz;

mz_zip_reader_init_mem :: (pZip: *mz_zip_archive, pMem: *void, size: u64, flags: mz_uint) -> mz_bool #foreign miniz;

/* Read a archive from a disk file. */
/* file_start_ofs is the file offset where the archive actually begins, or 0. */
/* actual_archive_size is the true total size of the archive, which may be smaller than the file's actual size on disk. If zero the entire file is treated as the archive. */
mz_zip_reader_init_file :: (pZip: *mz_zip_archive, pFilename: *u8, flags: mz_uint32) -> mz_bool #foreign miniz;
mz_zip_reader_init_file_v2 :: (pZip: *mz_zip_archive, pFilename: *u8, flags: mz_uint, file_start_ofs: mz_uint64, archive_size: mz_uint64) -> mz_bool #foreign miniz;

/* Read an archive from an already opened FILE, beginning at the current file position. */
/* The archive is assumed to be archive_size bytes long. If archive_size is 0, then the entire rest of the file is assumed to contain the archive. */
/* The FILE will NOT be closed when mz_zip_reader_end() is called. */
mz_zip_reader_init_cfile :: (pZip: *mz_zip_archive, pFile: *FILE, archive_size: mz_uint64, flags: mz_uint) -> mz_bool #foreign miniz;

/* Ends archive reading, freeing all allocations, and closing the input archive file if mz_zip_reader_init_file() was used. */
mz_zip_reader_end :: (pZip: *mz_zip_archive) -> mz_bool #foreign miniz;

/* Clears a mz_zip_archive struct to all zeros. */
/* Important: This must be done before passing the struct to any mz_zip functions. */
mz_zip_zero_struct :: (pZip: *mz_zip_archive) -> void #foreign miniz;

mz_zip_get_mode :: (pZip: *mz_zip_archive) -> mz_zip_mode #foreign miniz;
mz_zip_get_type :: (pZip: *mz_zip_archive) -> mz_zip_type #foreign miniz;

/* Returns the total number of files in the archive. */
mz_zip_reader_get_num_files :: (pZip: *mz_zip_archive) -> mz_uint #foreign miniz;

mz_zip_get_archive_size :: (pZip: *mz_zip_archive) -> mz_uint64 #foreign miniz;
mz_zip_get_archive_file_start_offset :: (pZip: *mz_zip_archive) -> mz_uint64 #foreign miniz;
mz_zip_get_cfile :: (pZip: *mz_zip_archive) -> *FILE #foreign miniz;

/* Reads n bytes of raw archive data, starting at file offset file_ofs, to pBuf. */
mz_zip_read_archive_data :: (pZip: *mz_zip_archive, file_ofs: mz_uint64, pBuf: *void, n: u64) -> u64 #foreign miniz;

/* All mz_zip funcs set the m_last_error field in the mz_zip_archive struct. These functions retrieve/manipulate this field. */
/* Note that the m_last_error functionality is not thread safe. */
mz_zip_set_last_error :: (pZip: *mz_zip_archive, err_num: mz_zip_error) -> mz_zip_error #foreign miniz;
mz_zip_peek_last_error :: (pZip: *mz_zip_archive) -> mz_zip_error #foreign miniz;
mz_zip_clear_last_error :: (pZip: *mz_zip_archive) -> mz_zip_error #foreign miniz;
mz_zip_get_last_error :: (pZip: *mz_zip_archive) -> mz_zip_error #foreign miniz;
mz_zip_get_error_string :: (mz_err: mz_zip_error) -> *u8 #foreign miniz;

/* MZ_TRUE if the archive file entry is a directory entry. */
mz_zip_reader_is_file_a_directory :: (pZip: *mz_zip_archive, file_index: mz_uint) -> mz_bool #foreign miniz;

/* MZ_TRUE if the file is encrypted/strong encrypted. */
mz_zip_reader_is_file_encrypted :: (pZip: *mz_zip_archive, file_index: mz_uint) -> mz_bool #foreign miniz;

/* MZ_TRUE if the compression method is supported, and the file is not encrypted, and the file is not a compressed patch file. */
mz_zip_reader_is_file_supported :: (pZip: *mz_zip_archive, file_index: mz_uint) -> mz_bool #foreign miniz;

/* Retrieves the filename of an archive file entry. */
/* Returns the number of bytes written to pFilename, or if filename_buf_size is 0 this function returns the number of bytes needed to fully store the filename. */
mz_zip_reader_get_filename :: (pZip: *mz_zip_archive, file_index: mz_uint, pFilename: *u8, filename_buf_size: mz_uint) -> mz_uint #foreign miniz;

/* Attempts to locates a file in the archive's central directory. */
/* Valid flags: MZ_ZIP_FLAG_CASE_SENSITIVE, MZ_ZIP_FLAG_IGNORE_PATH */
/* Returns -1 if the file cannot be found. */
mz_zip_reader_locate_file :: (pZip: *mz_zip_archive, pName: *u8, pComment: *u8, flags: mz_uint) -> s32 #foreign miniz;
mz_zip_reader_locate_file_v2 :: (pZip: *mz_zip_archive, pName: *u8, pComment: *u8, flags: mz_uint, file_index: *mz_uint32) -> mz_bool #foreign miniz;

/* Returns detailed information about an archive file entry. */
mz_zip_reader_file_stat :: (pZip: *mz_zip_archive, file_index: mz_uint, pStat: *mz_zip_archive_file_stat) -> mz_bool #foreign miniz;

/* MZ_TRUE if the file is in zip64 format. */
/* A file is considered zip64 if it contained a zip64 end of central directory marker, or if it contained any zip64 extended file information fields in the central directory. */
mz_zip_is_zip64 :: (pZip: *mz_zip_archive) -> mz_bool #foreign miniz;

/* Returns the total central directory size in bytes. */
/* The current max supported size is <= MZ_UINT32_MAX. */
mz_zip_get_central_dir_size :: (pZip: *mz_zip_archive) -> u64 #foreign miniz;

/* Extracts a archive file to a memory buffer using no memory allocation. */
/* There must be at least enough room on the stack to store the inflator's state (~34KB or so). */
mz_zip_reader_extract_to_mem_no_alloc :: (pZip: *mz_zip_archive, file_index: mz_uint, pBuf: *void, buf_size: u64, flags: mz_uint, pUser_read_buf: *void, user_read_buf_size: u64) -> mz_bool #foreign miniz;
mz_zip_reader_extract_file_to_mem_no_alloc :: (pZip: *mz_zip_archive, pFilename: *u8, pBuf: *void, buf_size: u64, flags: mz_uint, pUser_read_buf: *void, user_read_buf_size: u64) -> mz_bool #foreign miniz;

/* Extracts a archive file to a memory buffer. */
mz_zip_reader_extract_to_mem :: (pZip: *mz_zip_archive, file_index: mz_uint, pBuf: *void, buf_size: u64, flags: mz_uint) -> mz_bool #foreign miniz;
mz_zip_reader_extract_file_to_mem :: (pZip: *mz_zip_archive, pFilename: *u8, pBuf: *void, buf_size: u64, flags: mz_uint) -> mz_bool #foreign miniz;

/* Extracts a archive file to a dynamically allocated heap buffer. */
/* The memory will be allocated via the mz_zip_archive's alloc/realloc functions. */
/* Returns NULL and sets the last error on failure. */
mz_zip_reader_extract_to_heap :: (pZip: *mz_zip_archive, file_index: mz_uint, pSize: *u64, flags: mz_uint) -> *void #foreign miniz;
mz_zip_reader_extract_file_to_heap :: (pZip: *mz_zip_archive, pFilename: *u8, pSize: *u64, flags: mz_uint) -> *void #foreign miniz;

/* Extracts a archive file using a callback function to output the file's data. */
mz_zip_reader_extract_to_callback :: (pZip: *mz_zip_archive, file_index: mz_uint, pCallback: mz_file_write_func, pOpaque: *void, flags: mz_uint) -> mz_bool #foreign miniz;
mz_zip_reader_extract_file_to_callback :: (pZip: *mz_zip_archive, pFilename: *u8, pCallback: mz_file_write_func, pOpaque: *void, flags: mz_uint) -> mz_bool #foreign miniz;

/* Extract a file iteratively */
mz_zip_reader_extract_iter_new :: (pZip: *mz_zip_archive, file_index: mz_uint, flags: mz_uint) -> *mz_zip_reader_extract_iter_state #foreign miniz;
mz_zip_reader_extract_file_iter_new :: (pZip: *mz_zip_archive, pFilename: *u8, flags: mz_uint) -> *mz_zip_reader_extract_iter_state #foreign miniz;
mz_zip_reader_extract_iter_read :: (pState: *mz_zip_reader_extract_iter_state, pvBuf: *void, buf_size: u64) -> u64 #foreign miniz;
mz_zip_reader_extract_iter_free :: (pState: *mz_zip_reader_extract_iter_state) -> mz_bool #foreign miniz;

/* Extracts a archive file to a disk file and sets its last accessed and modified times. */
/* This function only extracts files, not archive directory records. */
mz_zip_reader_extract_to_file :: (pZip: *mz_zip_archive, file_index: mz_uint, pDst_filename: *u8, flags: mz_uint) -> mz_bool #foreign miniz;
mz_zip_reader_extract_file_to_file :: (pZip: *mz_zip_archive, pArchive_filename: *u8, pDst_filename: *u8, flags: mz_uint) -> mz_bool #foreign miniz;

/* Extracts a archive file starting at the current position in the destination FILE stream. */
mz_zip_reader_extract_to_cfile :: (pZip: *mz_zip_archive, file_index: mz_uint, File: *FILE, flags: mz_uint) -> mz_bool #foreign miniz;
mz_zip_reader_extract_file_to_cfile :: (pZip: *mz_zip_archive, pArchive_filename: *u8, pFile: *FILE, flags: mz_uint) -> mz_bool #foreign miniz;

/* This function compares the archive's local headers, the optional local zip64 extended information block, and the optional descriptor following the compressed data vs. the data in the central directory. */
/* It also validates that each file can be successfully uncompressed unless the MZ_ZIP_FLAG_VALIDATE_HEADERS_ONLY is specified. */
mz_zip_validate_file :: (pZip: *mz_zip_archive, file_index: mz_uint, flags: mz_uint) -> mz_bool #foreign miniz;

/* Validates an entire archive by calling mz_zip_validate_file() on each file. */
mz_zip_validate_archive :: (pZip: *mz_zip_archive, flags: mz_uint) -> mz_bool #foreign miniz;

/* Misc utils/helpers, valid for ZIP reading or writing */
mz_zip_validate_mem_archive :: (pMem: *void, size: u64, flags: mz_uint, pErr: *mz_zip_error) -> mz_bool #foreign miniz;

mz_zip_validate_file_archive :: (pFilename: *u8, flags: mz_uint, pErr: *mz_zip_error) -> mz_bool #foreign miniz;

/* Universal end function - calls either mz_zip_reader_end() or mz_zip_writer_end(). */
mz_zip_end :: (pZip: *mz_zip_archive) -> mz_bool #foreign miniz;

/* Inits a ZIP archive writer. */
/*Set pZip->m_pWrite (and pZip->m_pIO_opaque) before calling mz_zip_writer_init or mz_zip_writer_init_v2*/
/*The output is streamable, i.e. file_ofs in mz_file_write_func always increases only by n*/
mz_zip_writer_init :: (pZip: *mz_zip_archive, existing_size: mz_uint64) -> mz_bool #foreign miniz;
mz_zip_writer_init_v2 :: (pZip: *mz_zip_archive, existing_size: mz_uint64, flags: mz_uint) -> mz_bool #foreign miniz;

mz_zip_writer_init_heap :: (pZip: *mz_zip_archive, size_to_reserve_at_beginning: u64, initial_allocation_size: u64) -> mz_bool #foreign miniz;
mz_zip_writer_init_heap_v2 :: (pZip: *mz_zip_archive, size_to_reserve_at_beginning: u64, initial_allocation_size: u64, flags: mz_uint) -> mz_bool #foreign miniz;

mz_zip_writer_init_file :: (pZip: *mz_zip_archive, pFilename: *u8, size_to_reserve_at_beginning: mz_uint64) -> mz_bool #foreign miniz;
mz_zip_writer_init_file_v2 :: (pZip: *mz_zip_archive, pFilename: *u8, size_to_reserve_at_beginning: mz_uint64, flags: mz_uint) -> mz_bool #foreign miniz;
mz_zip_writer_init_cfile :: (pZip: *mz_zip_archive, pFile: *FILE, flags: mz_uint) -> mz_bool #foreign miniz;

/* Converts a ZIP archive reader object into a writer object, to allow efficient in-place file appends to occur on an existing archive. */
/* For archives opened using mz_zip_reader_init_file, pFilename must be the archive's filename so it can be reopened for writing. If the file can't be reopened, mz_zip_reader_end() will be called. */
/* For archives opened using mz_zip_reader_init_mem, the memory block must be growable using the realloc callback (which defaults to realloc unless you've overridden it). */
/* Finally, for archives opened using mz_zip_reader_init, the mz_zip_archive's user provided m_pWrite function cannot be NULL. */
/* Note: In-place archive modification is not recommended unless you know what you're doing, because if execution stops or something goes wrong before */
/* the archive is finalized the file's central directory will be hosed. */
mz_zip_writer_init_from_reader :: (pZip: *mz_zip_archive, pFilename: *u8) -> mz_bool #foreign miniz;
mz_zip_writer_init_from_reader_v2 :: (pZip: *mz_zip_archive, pFilename: *u8, flags: mz_uint) -> mz_bool #foreign miniz;

/* Adds the contents of a memory buffer to an archive. These functions record the current local time into the archive. */
/* To add a directory entry, call this method with an archive name ending in a forwardslash with an empty buffer. */
/* level_and_flags - compression level (0-10, see MZ_BEST_SPEED, MZ_BEST_COMPRESSION, etc.) logically OR'd with zero or more mz_zip_flags, or just set to MZ_DEFAULT_COMPRESSION. */
mz_zip_writer_add_mem :: (pZip: *mz_zip_archive, pArchive_name: *u8, pBuf: *void, buf_size: u64, level_and_flags: mz_uint) -> mz_bool #foreign miniz;

/* Like mz_zip_writer_add_mem(), except you can specify a file comment field, and optionally supply the function with already compressed data. */
/* uncomp_size/uncomp_crc32 are only used if the MZ_ZIP_FLAG_COMPRESSED_DATA flag is specified. */
mz_zip_writer_add_mem_ex :: (pZip: *mz_zip_archive, pArchive_name: *u8, pBuf: *void, buf_size: u64, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint, uncomp_size: mz_uint64, uncomp_crc32: mz_uint32) -> mz_bool #foreign miniz;

mz_zip_writer_add_mem_ex_v2 :: (pZip: *mz_zip_archive, pArchive_name: *u8, pBuf: *void, buf_size: u64, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint, uncomp_size: mz_uint64, uncomp_crc32: mz_uint32, last_modified: *time_t, user_extra_data_local: *u8, user_extra_data_local_len: mz_uint, user_extra_data_central: *u8, user_extra_data_central_len: mz_uint) -> mz_bool #foreign miniz;

/* Adds the contents of a file to an archive. This function also records the disk file's modified time into the archive. */
/* File data is supplied via a read callback function. User mz_zip_writer_add_(c)file to add a file directly.*/
mz_zip_writer_add_read_buf_callback :: (pZip: *mz_zip_archive, pArchive_name: *u8, read_callback: mz_file_read_func, callback_opaque: *void, max_size: mz_uint64, pFile_time: *time_t, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint, user_extra_data_local: *u8, user_extra_data_local_len: mz_uint, user_extra_data_central: *u8, user_extra_data_central_len: mz_uint) -> mz_bool #foreign miniz;

/* Adds the contents of a disk file to an archive. This function also records the disk file's modified time into the archive. */
/* level_and_flags - compression level (0-10, see MZ_BEST_SPEED, MZ_BEST_COMPRESSION, etc.) logically OR'd with zero or more mz_zip_flags, or just set to MZ_DEFAULT_COMPRESSION. */
mz_zip_writer_add_file :: (pZip: *mz_zip_archive, pArchive_name: *u8, pSrc_filename: *u8, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint) -> mz_bool #foreign miniz;

/* Like mz_zip_writer_add_file(), except the file data is read from the specified FILE stream. */
mz_zip_writer_add_cfile :: (pZip: *mz_zip_archive, pArchive_name: *u8, pSrc_file: *FILE, max_size: mz_uint64, pFile_time: *time_t, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint, user_extra_data_local: *u8, user_extra_data_local_len: mz_uint, user_extra_data_central: *u8, user_extra_data_central_len: mz_uint) -> mz_bool #foreign miniz;

/* Adds a file to an archive by fully cloning the data from another archive. */
/* This function fully clones the source file's compressed data (no recompression), along with its full filename, extra data (it may add or modify the zip64 local header extra data field), and the optional descriptor following the compressed data. */
mz_zip_writer_add_from_zip_reader :: (pZip: *mz_zip_archive, pSource_zip: *mz_zip_archive, src_file_index: mz_uint) -> mz_bool #foreign miniz;

/* Finalizes the archive by writing the central directory records followed by the end of central directory record. */
/* After an archive is finalized, the only valid call on the mz_zip_archive struct is mz_zip_writer_end(). */
/* An archive must be manually finalized by calling this function for it to be valid. */
mz_zip_writer_finalize_archive :: (pZip: *mz_zip_archive) -> mz_bool #foreign miniz;

/* Finalizes a heap archive, returning a pointer to the heap block and its size. */
/* The heap block will be allocated using the mz_zip_archive's alloc/realloc callbacks. */
mz_zip_writer_finalize_heap_archive :: (pZip: *mz_zip_archive, ppBuf: **void, pSize: *u64) -> mz_bool #foreign miniz;

/* Ends archive writing, freeing all allocations, and closing the output file if mz_zip_writer_init_file() was used. */
/* Note for the archive to be valid, it *must* have been finalized before ending (this function will not do it for you). */
mz_zip_writer_end :: (pZip: *mz_zip_archive) -> mz_bool #foreign miniz;

/* mz_zip_add_mem_to_archive_file_in_place() efficiently (but not atomically) appends a memory blob to a ZIP archive. */
/* Note this is NOT a fully safe operation. If it crashes or dies in some way your archive can be left in a screwed up state (without a central directory). */
/* level_and_flags - compression level (0-10, see MZ_BEST_SPEED, MZ_BEST_COMPRESSION, etc.) logically OR'd with zero or more mz_zip_flags, or just set to MZ_DEFAULT_COMPRESSION. */
/* TODO: Perhaps add an option to leave the existing central dir in place in case the add dies? We could then truncate the file (so the old central dir would be at the end) if something goes wrong. */
mz_zip_add_mem_to_archive_file_in_place :: (pZip_filename: *u8, pArchive_name: *u8, pBuf: *void, buf_size: u64, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint) -> mz_bool #foreign miniz;
mz_zip_add_mem_to_archive_file_in_place_v2 :: (pZip_filename: *u8, pArchive_name: *u8, pBuf: *void, buf_size: u64, pComment: *void, comment_size: mz_uint16, level_and_flags: mz_uint, pErr: *mz_zip_error) -> mz_bool #foreign miniz;

/* Reads a single file from an archive into a heap block. */
/* If pComment is not NULL, only the file with the specified comment will be extracted. */
/* Returns NULL on failure. */
mz_zip_extract_archive_file_to_heap :: (pZip_filename: *u8, pArchive_name: *u8, pSize: *u64, flags: mz_uint) -> *void #foreign miniz;
mz_zip_extract_archive_file_to_heap_v2 :: (pZip_filename: *u8, pArchive_name: *u8, pComment: *u8, pSize: *u64, flags: mz_uint, pErr: *mz_zip_error) -> *void #foreign miniz;

#scope_file


#if OS == .WINDOWS {
    miniz :: #library "windows/miniz";
} else #if OS == .LINUX {
    miniz :: #library "linux/miniz";
} else #if OS == .MACOS {
    miniz :: #library "macos/miniz";
} else {
    #assert false;
}

