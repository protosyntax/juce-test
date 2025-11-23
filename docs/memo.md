`$ cmake -B build -G Ninja`でエラー

```
-- The CXX compiler identification is GNU 14.2.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- The C compiler identification is GNU 14.2.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Found PkgConfig: /usr/bin/pkg-config (found version "1.8.1")
-- Checking for module 'alsa'
--   Package 'alsa', required by 'virtual:world', not found
-- Checking for modules 'freetype2;fontconfig'
--   Package 'freetype2', required by 'virtual:world', not found
--   Package 'fontconfig', required by 'virtual:world', not found
-- Checking for module 'gl'
--   Package 'gl', required by 'virtual:world', not found
-- Checking for module 'libcurl'
--   Package 'libcurl', required by 'virtual:world', not found
-- Checking for modules 'webkit2gtk-4.0;gtk+-x11-3.0'
--   Package 'webkit2gtk-4.0', required by 'virtual:world', not found
--   Package 'gtk+-x11-3.0', required by 'virtual:world', not found
-- Configuring juceaide
-- Building juceaide
CMake Error at libs/JUCE/extras/Build/juceaide/CMakeLists.txt:157 (message):
  Failed to build juceaide

  [0/2] Re-checking globbed directories...

  [1/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_core/juce_core_CompilationTime.cpp.o


  [2/12] Building C object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics_Sheenbidi.c.o


  [3/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics.cpp.o


  FAILED:
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics.cpp.o


  /usr/bin/c++ -DJUCE_DISABLE_JUCE_VERSION_PRINTING=1
  -DJUCE_GLOBAL_MODULE_SETTINGS_INCLUDED=1
  -DJUCE_MODULE_AVAILABLE_juce_build_tools=1
  -DJUCE_MODULE_AVAILABLE_juce_core=1
  -DJUCE_MODULE_AVAILABLE_juce_data_structures=1
  -DJUCE_MODULE_AVAILABLE_juce_events=1
  -DJUCE_MODULE_AVAILABLE_juce_graphics=1
  -DJUCE_MODULE_AVAILABLE_juce_gui_basics=1
  -DJUCE_SILENCE_XCODE_15_LINKER_WARNING=1 -DJUCE_STANDALONE_APPLICATION=1
  -DJUCE_USE_CURL=0 -DLINUX=1 -DNDEBUG=1 -D_NDEBUG=1
  -I/home/ygg/projects/cpp/cpp-test/juce-test/build/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/JuceLibraryCode
  -I/home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/extras/Build
  -I/home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules -std=c++17
  -Wall -Wextra -Wpedantic -Wstrict-aliasing -Wuninitialized
  -Wunused-parameter -Wsign-compare -Wsign-conversion -Wunreachable-code
  -Wcast-align -Wno-implicit-fallthrough -Wno-maybe-uninitialized
  -Wno-ignored-qualifiers -Wno-multichar -Wswitch-enum -Wredundant-decls
  -Wno-strict-overflow -Wshadow -Wfloat-equal -Wmissing-field-initializers
  -Woverloaded-virtual -Wreorder -Wzero-as-null-pointer-constant -MD -MT
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics.cpp.o
  -MF
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics.cpp.o.d
  -o
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics.cpp.o
  -c
  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/juce_graphics.cpp



  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/juce_graphics.cpp:119:11:
  fatal error: ft2build.h: No such file or directory

    119 |  #include <ft2build.h>
        |           ^~~~~~~~~~~~

  compilation terminated.

  [4/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics_Harfbuzz.cpp.o


  FAILED:
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics_Harfbuzz.cpp.o


  /usr/bin/c++ -DJUCE_DISABLE_JUCE_VERSION_PRINTING=1
  -DJUCE_GLOBAL_MODULE_SETTINGS_INCLUDED=1
  -DJUCE_MODULE_AVAILABLE_juce_build_tools=1
  -DJUCE_MODULE_AVAILABLE_juce_core=1
  -DJUCE_MODULE_AVAILABLE_juce_data_structures=1
  -DJUCE_MODULE_AVAILABLE_juce_events=1
  -DJUCE_MODULE_AVAILABLE_juce_graphics=1
  -DJUCE_MODULE_AVAILABLE_juce_gui_basics=1
  -DJUCE_SILENCE_XCODE_15_LINKER_WARNING=1 -DJUCE_STANDALONE_APPLICATION=1
  -DJUCE_USE_CURL=0 -DLINUX=1 -DNDEBUG=1 -D_NDEBUG=1
  -I/home/ygg/projects/cpp/cpp-test/juce-test/build/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/JuceLibraryCode
  -I/home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/extras/Build
  -I/home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules -std=c++17
  -Wall -Wextra -Wpedantic -Wstrict-aliasing -Wuninitialized
  -Wunused-parameter -Wsign-compare -Wsign-conversion -Wunreachable-code
  -Wcast-align -Wno-implicit-fallthrough -Wno-maybe-uninitialized
  -Wno-ignored-qualifiers -Wno-multichar -Wswitch-enum -Wredundant-decls
  -Wno-strict-overflow -Wshadow -Wfloat-equal -Wmissing-field-initializers
  -Woverloaded-virtual -Wreorder -Wzero-as-null-pointer-constant -MD -MT
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics_Harfbuzz.cpp.o
  -MF
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics_Harfbuzz.cpp.o.d
  -o
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_graphics/juce_graphics_Harfbuzz.cpp.o
  -c
  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/juce_graphics_Harfbuzz.cpp


  In file included from
  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/fonts/harfbuzz/hb-ft.cc:34,


                   from /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/fonts/harfbuzz/harfbuzz.cc:17,
                   from /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/juce_graphics_Harfbuzz.cpp:94:

  
  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_graphics/fonts/harfbuzz/hb-ft.h:34:10:
  fatal error: ft2build.h: No such file or directory

     34 | #include <ft2build.h>
        |          ^~~~~~~~~~~~

  compilation terminated.

  [5/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_gui_basics/juce_gui_basics.cpp.o


  FAILED:
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_gui_basics/juce_gui_basics.cpp.o


  /usr/bin/c++ -DJUCE_DISABLE_JUCE_VERSION_PRINTING=1
  -DJUCE_GLOBAL_MODULE_SETTINGS_INCLUDED=1
  -DJUCE_MODULE_AVAILABLE_juce_build_tools=1
  -DJUCE_MODULE_AVAILABLE_juce_core=1
  -DJUCE_MODULE_AVAILABLE_juce_data_structures=1
  -DJUCE_MODULE_AVAILABLE_juce_events=1
  -DJUCE_MODULE_AVAILABLE_juce_graphics=1
  -DJUCE_MODULE_AVAILABLE_juce_gui_basics=1
  -DJUCE_SILENCE_XCODE_15_LINKER_WARNING=1 -DJUCE_STANDALONE_APPLICATION=1
  -DJUCE_USE_CURL=0 -DLINUX=1 -DNDEBUG=1 -D_NDEBUG=1
  -I/home/ygg/projects/cpp/cpp-test/juce-test/build/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/JuceLibraryCode
  -I/home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/extras/Build
  -I/home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules -std=c++17
  -Wall -Wextra -Wpedantic -Wstrict-aliasing -Wuninitialized
  -Wunused-parameter -Wsign-compare -Wsign-conversion -Wunreachable-code
  -Wcast-align -Wno-implicit-fallthrough -Wno-maybe-uninitialized
  -Wno-ignored-qualifiers -Wno-multichar -Wswitch-enum -Wredundant-decls
  -Wno-strict-overflow -Wshadow -Wfloat-equal -Wmissing-field-initializers
  -Woverloaded-virtual -Wreorder -Wzero-as-null-pointer-constant -MD -MT
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_gui_basics/juce_gui_basics.cpp.o
  -MF
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_gui_basics/juce_gui_basics.cpp.o.d
  -o
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_gui_basics/juce_gui_basics.cpp.o
  -c
  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_gui_basics/juce_gui_basics.cpp


  In file included from
  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_gui_basics/juce_gui_basics.cpp:55:



  /home/ygg/projects/cpp/cpp-test/juce-test/libs/JUCE/modules/juce_gui_basics/juce_gui_basics.h:348:12:
  fatal error: X11/Xlib.h: No such file or directory

    348 |   #include <X11/Xlib.h>
        |            ^~~~~~~~~~~~

  compilation terminated.

  [6/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_data_structures/juce_data_structures.cpp.o


  [7/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_events/juce_events.cpp.o


  [8/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/Main.cpp.o

  [9/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/juce_build_tools/juce_build_tools.cpp.o


  [10/12] Building CXX object
  extras/Build/juceaide/CMakeFiles/juceaide.dir/__/__/__/modules/juce_core/juce_core.cpp.o


  ninja: build stopped: subcommand failed.



-- Configuring incomplete, errors occurred!
```

→ CMake/Ninja 自体は動作しているが、依存ライブラリが足りないため JUCE の juceaide がコンパイルできない 状態です。

→ ライブラリを追加する。

```
sudo apt update
sudo apt install -y \
  build-essential cmake ninja-build pkg-config \
  libfreetype-dev libfontconfig1-dev libx11-dev \
  libasound2-dev libgl1-mesa-dev \
  libgtk-3-dev libcurl4-openssl-dev
```

結果
```
-- Checking for modules 'webkit2gtk-4.0;gtk+-x11-3.0' -- Package 'webkit2gtk-4.0', required by 'virtual:world', not found
```
→ WebKitGTK 4.0 は見つからない が、GTK は OK
→ wslの標準レポジトリに`libwebkit2gtk-4.0-dev`はないらしい
→ しょうがないので一旦無視する
