@echo off
title Rendering F:\book\MayaMan_Project\mayaman\images\preview_untitled.tif

@rem ##############################
@rem # setup environment

setlocal

if not "%MAYAMANROOT%" == "" goto label_MAYAMANROOT
  set MAYAMANROOT=d:\mayaman
:label_MAYAMANROOT

if not "%RENDER_THREADS%" == "" goto label_RENDER_THREADS
  set RENDER_THREADS=-p:1
:label_RENDER_THREADS

if not "%SINGLE_THREADED%" == "" goto label_SINGLE_THREADED
  set SINGLE_THREADED=-p:1
:label_SINGLE_THREADED

if not "%RMANTREE%" == "" goto label_RMANTREE
  set RMANTREE=D:\Pixar\RenderManProServer-11.5.3
:label_RMANTREE

set PATH=%RMANTREE%\bin;%PATH%
set PATH=%MAYAMANROOT%\bin;%PATH%
set RENDERER=bin\prman.exe
set SMRENDERER=bin\prman.exe
set SHADERCOMPILER=bin\shader.exe
set SHADERCOMPILERARGS=-O2 -DPRMAN11
set TOTEX=bin/totex.exe
set RIB_DIR=F:\book\MayaMan_Project\mayaman\untitled
set TEX_CACHE=F:\book\MayaMan_Project\mayaman\tex_cache

@rem ##############################
@rem # pre-render commands

call %MAYAMANROOT%\bin\manstat "%RIB_DIR%/shaders/mms_lambert1.slo" "%RIB_DIR%/shaders/mms_lambert1.sl"
if errorlevel 1 call "%RMANTREE%\%SHADERCOMPILER%" %SHADERCOMPILERARGS% -I"%MAYAMANROOT%\shaders" -o "%RIB_DIR%/shaders/mms_lambert1.slo" "%RIB_DIR%/shaders/mms_lambert1.sl"
if errorlevel 1 goto :label_COND_FAILURE

call %MAYAMANROOT%\bin\manstat "%RIB_DIR%/shaders/mms_sheep_phong1.slo" "%RIB_DIR%/shaders/mms_sheep_phong1.sl"
if errorlevel 1 call "%RMANTREE%\%SHADERCOMPILER%" %SHADERCOMPILERARGS% -I"%MAYAMANROOT%\shaders" -o "%RIB_DIR%/shaders/mms_sheep_phong1.slo" "%RIB_DIR%/shaders/mms_sheep_phong1.sl"
if errorlevel 1 goto :label_COND_FAILURE

call %MAYAMANROOT%\bin\manstat "%RIB_DIR%/shaders/mms_sheep_phong2.slo" "%RIB_DIR%/shaders/mms_sheep_phong2.sl"
if errorlevel 1 call "%RMANTREE%\%SHADERCOMPILER%" %SHADERCOMPILERARGS% -I"%MAYAMANROOT%\shaders" -o "%RIB_DIR%/shaders/mms_sheep_phong2.slo" "%RIB_DIR%/shaders/mms_sheep_phong2.sl"
if errorlevel 1 goto :label_COND_FAILURE


@rem ##############################
@rem # do the render

echo F:/book/MayaMan_Project/mayaman/images/preview_untitled.tif
echo %RIB_DIR%/preview_untitled.0.rib
"%RMANTREE%\%RENDERER%" %RENDER_THREADS% -progress "%RIB_DIR%/preview_untitled.0.rib"
if errorlevel 1 goto :label_RENDERER_FAILURE
echo Render complete

@rem ##############################
@rem # post-render commands

endlocal
goto :EOF

:label_RENDERER_FAILURE
echo The renderer has failed
goto :label_FAILURE

:label_NO_OUTPUT_FAILURE
echo The renderer failed to produce the output file
goto :label_FAILURE

:label_COND_FAILURE
echo A conditional command failed
goto :label_FAILURE

:label_FAILURE
endlocal
