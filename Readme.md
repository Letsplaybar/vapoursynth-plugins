A collection of [VapourSynth](https://github.com/vapoursynth/vapoursynth) plugins
===================================

The main reason for this collection is to make it easier to build packages for Ubuntu.
So don't expect this build system to work on anything else than Linux on x86 architectures.

Inspired by: https://github.com/darealshinji/vapoursynth-plugins.git

**Build dependencies**:<br>
```
git nasm yasm libtool pkg-config meason cpython cmake autoconf automake 
libfftw3-dev libpng-dev libsndfile1-dev libxvidcore-dev libbluray-dev zlib1g-dev
libopencv-dev ocl-icd-libopencl1 opencl-headers libvulkan-dev glslang-dev
glslang-tools libboost-filesystem-dev libboost-system-dev libcompute-dev  
```


**Installation**:
```
git clone --recurse-submodules -j8 https://github.com/Letsplaybar/vapoursynth-plugins.git
cd vapoursynth-plugins
make
```


**Plugins**:<br>
[addgrain](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-AddGrain) <br>
[awarpsharp2](https://github.com/dubhater/vapoursynth-awarpsharp2) <br>
[bifrost](https://github.com/dubhater/vapoursynth-bifrost) <br>
[bilateral](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Bilateral) <br>
[bm3d](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-BM3D) <br>
[combmask](https://github.com/chikuzen/CombMask) <br>
[convo2d](https://github.com/chikuzen/convo2d) <br>
[cnr2](https://github.com/dubhater/vapoursynth-cnr2) <br>
[ctmf](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-CTMF) <br>
[d2vsource](https://github.com/dwbuiten/d2vsource) <br>
[damb](https://github.com/dubhater/vapoursynth-damb) <br>
[dctfilter](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DCTFilter) <br>
[deblock](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Deblock) <br>
[deblockpp7](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DeblockPP7) <br>
[degrainmedian](https://github.com/dubhater/vapoursynth-degrainmedian) <br>
[delogo](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DeLogo) <br>
[dfttest](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DFTTest) <br>
[eedi2](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI2) <br>
[eedi3](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3) <br>
[ffms2](https://github.com/FFMS/ffms2) <br>
[ff3dfilter](https://github.com/myrsloik/VapourSynth-FFT3DFilter) <br>
[fieldhint](https://github.com/dubhater/vapoursynth-fieldhint) <br>
[fillborders](https://github.com/dubhater/vapoursynth-fillborders) <br>
[flash3kyuu_deband](https://github.com/SAPikachu/flash3kyuu_deband) <br>
[fluxsmooth](https://github.com/dubhater/vapoursynth-fluxsmooth) <br>
[fmtconv](https://github.com/EleonoreMizo/fmtconv) <br>
[genericfilters](https://github.com/myrsloik/GenericFilters) <br>
[histogram](https://github.com/dubhater/vapoursynth-histogram) <br>
[hqdn3d](https://github.com/Hinterwaeldlers/vapoursynth-hqdn3d) <br>
[imagereader](https://github.com/chikuzen/vsimagereader) <br>
[it](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-IT) <br>
[knlmeanscl](https://github.com/Khanattila/KNLMeansCL) <br>
[lsmashsource](https://github.com/VFR-maniac/L-SMASH-Works) <br>
[msmoosh](https://github.com/dubhater/vapoursynth-msmoosh) <br>
[mvtools](https://github.com/dubhater/vapoursynth-mvtools) <br>
[nnedi3](https://github.com/dubhater/vapoursynth-nnedi3) <br>
[nnedi3cl](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL) <br>
[rawsource](https://github.com/chikuzen/vsrawsource) <br>
[readmpls](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-ReadMpls) <br>
[reduceflicker](https://github.com/VFR-maniac/VapourSynth-ReduceFlicker) <br>
[retinex](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Retinex) <br>
[sangnommod](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-SangNomMod) <br>
[scrawl](https://github.com/dubhater/vapoursynth-scrawl) <br>
[scxvid](https://github.com/dubhater/vapoursynth-scxvid) <br>
[ssiq](https://github.com/dubhater/vapoursynth-ssiq) <br>
[tc2cfr](https://github.com/gnaggnoyil/tc2cfr) <br>
[tcanny](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-TCanny) <br>
[tcomb](https://github.com/dubhater/vapoursynth-tcomb) <br>
[tdeintmod](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-TDeintMod) <br>
[templinearapproximate](https://bitbucket.org/mystery_keeper/templinearapproximate-vapoursynth) <br>
[tnlmeans](https://github.com/VFR-maniac/VapourSynth-TNLMeans) <br>
[ttempsmooth](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-TTempSmooth) <br>
[vaguedenoiser](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-VagueDenoiser) <br>
[vautodeint](https://github.com/gnaggnoyil/VAutoDeint) <br>
[videoscope](https://github.com/dubhater/vapoursynth-videoscope) <br>
[w3dif](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-W3FDIF) <br>
[wwxd](https://github.com/dubhater/vapoursynth-wwxd) <br>
[yadifmod](https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Yadifmod) <br>
[temporalsoften](https://github.com/dubhater/vapoursynth-temporalsoften) <br>
[waifu2x-ncnn-vulkan](https://github.com/nihui/waifu2x-ncnn-vulkan.git) (Dependencies) <br>
[vapoursynth-waifu2x-ncnn-vulkan](https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan.git)

**Scripts:**<br>
[adjust](https://github.com/dubhater/vapoursynth-adjust) <br>
[havsfunc](https://github.com/HomeOfVapourSynthEvolution/havsfunc) <br>
[maskdetail](https://github.com/MonoS/VS-MaskDetail) <br>
[mvsfunc](https://github.com/HomeOfVapourSynthEvolution/mvsfunc) <br>
[nnedi3_resample](https://github.com/mawen1250/VapourSynth-script) <br>
[vsTAAmbk](https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk) <br>
[muvsfunc_numpy](https://github.com/WolframRhodium/muvsfunc) <br>

dehalo_alpha, edgecleaner, fastlinedarken, finesharp, knlm, mcdegrainsharp, nnedi3_rpow2,
psharpen, resamplehq, sharpaamcmod, showdiff, supersampledantialiasing, vshelpers:
https://gist.github.com/4re/