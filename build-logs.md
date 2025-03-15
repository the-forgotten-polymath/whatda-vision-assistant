Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -scheme WhatDa -project WhatDa.xcodeproj -destination generic/platform=iOS clean build

CreateBuildRequest

SendProjectDescription

CreateBuildOperation

** CLEAN SUCCEEDED **

ComputePackagePrebuildTargetDependencyGraph

Prepare packages

CreateBuildRequest

SendProjectDescription

CreateBuildOperation

ComputeTargetDependencyGraph
note: Building targets in dependency order
note: Target dependency graph (1 target)
    Target 'WhatDa' in project 'WhatDa' (no dependencies)

GatherProvisioningInputs

CreateBuildDescription

ExecuteExternalTool /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc --version

ExecuteExternalTool /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld -version_details

Build description signature: c931b3c4d9c9079897a5fe77f19b9d69
Build description path: /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/XCBuildData/c931b3c4d9c9079897a5fe77f19b9d69.xcbuilddata
ClangStatCache /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk /Users/dev/Library/Developer/Xcode/DerivedData/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448f32daed1954a7d5dd0789fcaf2a9bb78b.sdkstatcache
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -o /Users/dev/Library/Developer/Xcode/DerivedData/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448f32daed1954a7d5dd0789fcaf2a9bb78b.sdkstatcache

CreateBuildDirectory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    builtin-create-build-directory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products

CreateBuildDirectory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    builtin-create-build-directory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex

CreateBuildDirectory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    builtin-create-build-directory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos

CreateBuildDirectory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    builtin-create-build-directory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules

CreateBuildDirectory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/ExplicitPrecompiledModules
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    builtin-create-build-directory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/ExplicitPrecompiledModules

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa-8bf2d9c727650d243fd235dd8378df1e-VFS-iphoneos/all-product-headers.yaml
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa-8bf2d9c727650d243fd235dd8378df1e-VFS-iphoneos/all-product-headers.yaml

CreateBuildDirectory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/EagerLinkingTBDs/Debug-iphoneos
    cd /Users/dev/Downloads/WhatDa/WhatDa.xcodeproj
    builtin-create-build-directory /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/EagerLinkingTBDs/Debug-iphoneos

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-project-headers.hmap (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-project-headers.hmap

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.hmap (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.hmap

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-own-target-headers.hmap (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-own-target-headers.hmap

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/empty-WhatDa.plist (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/empty-WhatDa.plist

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-generated-files.hmap (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-generated-files.hmap

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyStaticMetadataFileList (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyMetadataFileList (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyMetadataFileList

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-target-headers.hmap (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-target-headers.hmap

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-non-framework-target-headers.hmap (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-non-framework-target-headers.hmap

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-DebugDylibPath-normal-arm64.txt (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-DebugDylibPath-normal-arm64.txt

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-DebugDylibInstallName-normal-arm64.txt (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-DebugDylibInstallName-normal-arm64.txt

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftConstValuesFileList (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_const_extract_protocols.json (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_const_extract_protocols.json

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftFileList (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftFileList

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.LinkFileList (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.LinkFileList

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-OutputFileMap.json (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-OutputFileMap.json

MkDir /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /bin/mkdir -p /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app

WriteAuxiliaryFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/Entitlements.plist (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    write-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/Entitlements.plist

ProcessProductPackaging /Users/dev/Library/Developer/Xcode/UserData/Provisioning\ Profiles/beb3c667-5deb-40c5-877c-abbde6fb370d.mobileprovision /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/embedded.mobileprovision (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-productPackagingUtility /Users/dev/Library/Developer/Xcode/UserData/Provisioning\ Profiles/beb3c667-5deb-40c5-877c-abbde6fb370d.mobileprovision -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/embedded.mobileprovision

ProcessProductPackaging "" /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
    Entitlements:
    
    {
    "application-identifier" = "9K273ZB8NM.com.chitransh.WhatDa";
    "com.apple.developer.team-identifier" = 9K273ZB8NM;
    "get-task-allow" = 1;
}
    
    builtin-productPackagingUtility -entitlements -format xml -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent

ProcessProductPackagingDER /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent.der (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /usr/bin/derq query -f xml -i /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent.der --raw

Ld /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/__preview.dylib normal (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios17.6 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -O0 -L/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -F/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -install_name @rpath/WhatDa.debug.dylib -Xlinker -dead_strip -rdynamic -Xlinker -no_deduplicate -Xlinker -dependency_info -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_dependency_info.dat -Xlinker -no_adhoc_codesign -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/__preview.dylib

ProcessInfoPlistFile /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Info.plist /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/empty-WhatDa.plist (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-infoPlistUtility /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/empty-WhatDa.plist -producttype com.apple.product-type.application -genpkginfo /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/PkgInfo -expandbuildsettings -format binary -platform iphoneos -requiredArchitecture arm64 -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Info.plist

SwiftDriver WhatDa normal arm64 com.apple.xcode.tools.swift.compiler (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-SwiftDriver -- /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name WhatDa -Onone @/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftFileList -DDEBUG -default-isolation\=MainActor -enable-bare-slash-regex -enable-upcoming-feature DisableOutwardActorInference -enable-upcoming-feature InferSendableFromCaptures -enable-upcoming-feature GlobalActorIsolatedTypesUsability -enable-upcoming-feature MemberImportVisibility -enable-upcoming-feature InferIsolatedConformances -enable-upcoming-feature NonisolatedNonsendingByDefault -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios17.6 -g -module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -Xfrontend -serialize-debugging-options -enable-testing -index-store-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Index.noindex/DataStore -Xcc -D_LIBCPP_HARDENING_MODE\=_LIBCPP_HARDENING_MODE_DEBUG -swift-version 5 -I /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -F /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -emit-localized-strings -emit-localized-strings-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64 -c -j8 -enable-batch-mode -incremental -Xcc -ivfsstatcache -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448f32daed1954a7d5dd0789fcaf2a9bb78b.sdkstatcache -output-file-map /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -sdk-module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_const_extract_protocols.json -Xcc -iquote -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-generated-files.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-own-target-headers.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-target-headers.hmap -Xcc -iquote -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-project-headers.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/include -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources-normal/arm64 -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/arm64 -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources -Xcc -DDEBUG\=1 -emit-objc-header -emit-objc-header-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-Swift.h -working-directory /Users/dev/Downloads/WhatDa -experimental-emit-module-separately -disable-cmo

SwiftCompile normal arm64 Compiling\ CapturedImage.swift,\ CameraView.swift,\ ExplanationView.swift,\ DefaultExplainEngine.swift,\ ExplainEngine.swift /Users/dev/Downloads/WhatDa/WhatDa/Camera/CapturedImage.swift /Users/dev/Downloads/WhatDa/WhatDa/Features/Camera/CameraView.swift /Users/dev/Downloads/WhatDa/WhatDa/Features/Explanation/ExplanationView.swift /Users/dev/Downloads/WhatDa/WhatDa/Intelligence/DefaultExplainEngine.swift /Users/dev/Downloads/WhatDa/WhatDa/Intelligence/ExplainEngine.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Camera/CapturedImage.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Features/Camera/CameraView.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:38:59: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        cameraService: any CameraService = AppEnvironment.shared.cameraService,
                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:39:61: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        visionAnalyzer: any VisionAnalyzer = AppEnvironment.shared.visionAnalyzer,
                                                            ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:40:59: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        explainEngine: any ExplainEngine = AppEnvironment.shared.explainEngine
                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Features/Explanation/ExplanationView.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Intelligence/DefaultExplainEngine.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Intelligence/ExplainEngine.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 Compiling\ StoredMessage.swift,\ ProgressPillView.swift,\ AppColors.swift,\ AppTypography.swift /Users/dev/Downloads/WhatDa/WhatDa/Persistence/StoredMessage.swift /Users/dev/Downloads/WhatDa/WhatDa/UI/Components/ProgressPillView.swift /Users/dev/Downloads/WhatDa/WhatDa/UI/DesignSystem/AppColors.swift /Users/dev/Downloads/WhatDa/WhatDa/UI/DesignSystem/AppTypography.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Persistence/StoredMessage.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/UI/Components/ProgressPillView.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/UI/DesignSystem/AppColors.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/UI/DesignSystem/AppTypography.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 Compiling\ Haptics.swift,\ BarcodeAnalyzer.swift,\ DefaultVisionAnalyzer.swift,\ ImageQualityAnalyzer.swift /Users/dev/Downloads/WhatDa/WhatDa/UI/DesignSystem/Haptics.swift /Users/dev/Downloads/WhatDa/WhatDa/Vision/BarcodeAnalyzer.swift /Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift /Users/dev/Downloads/WhatDa/WhatDa/Vision/ImageQualityAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/UI/DesignSystem/Haptics.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Vision/BarcodeAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift:37:16: warning: no calls to throwing functions occur within 'try' expression
        return try await Task.detached(priority: .userInitiated) {
               ^
/Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift:48:20: warning: main actor-isolated initializer 'init(recognizedText:barcodes:observations:imageQuality:)' cannot be called from outside of the actor; this is an error in the Swift 6 language mode
            return VisualContext(
                   ^~~~~~~~~~~~~~
                   await 

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Vision/ImageQualityAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 Compiling\ PromptLibrary.swift,\ ChatMessage.swift,\ ConfidenceLevel.swift,\ ExplainState.swift /Users/dev/Downloads/WhatDa/WhatDa/Intelligence/PromptLibrary.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/ChatMessage.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/ConfidenceLevel.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/ExplainState.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Intelligence/PromptLibrary.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/ChatMessage.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/ConfidenceLevel.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/ExplainState.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 Compiling\ AppEnvironment.swift,\ CameraPermission.swift,\ CameraPreviewView.swift,\ CameraService.swift,\ CameraViewModel.swift /Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraPermission.swift /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraPreviewView.swift /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:20:44: warning: call to main actor-isolated initializer 'init()' in a synchronous nonisolated context
        cameraService: any CameraService = DefaultCameraService(),
                                           ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:52:21: note: calls to initializer 'init()' from outside of its actor context are implicitly asynchronous
    public override init() {
                    ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:52:21: note: main actor isolation inferred from conformance to protocol 'CameraService'
    public override init() {
                    ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:21:46: warning: call to main actor-isolated initializer 'init(textAnalyzer:barcodeAnalyzer:qualityAnalyzer:subjectAnalyzer:)' in a synchronous nonisolated context
        visionAnalyzer: any VisionAnalyzer = DefaultVisionAnalyzer(),
                                             ^
/Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift:15:12: note: calls to initializer 'init(textAnalyzer:barcodeAnalyzer:qualityAnalyzer:subjectAnalyzer:)' from outside of its actor context are implicitly asynchronous
    public init(
           ^
/Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift:15:12: note: main actor isolation inferred from conformance to protocol 'VisionAnalyzer'
    public init(
           ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:22:44: warning: call to main actor-isolated initializer 'init()' in a synchronous nonisolated context
        explainEngine: any ExplainEngine = DefaultExplainEngine(),
                                           ^
/Users/dev/Downloads/WhatDa/WhatDa/Intelligence/DefaultExplainEngine.swift:9:12: note: calls to initializer 'init()' from outside of its actor context are implicitly asynchronous
    public init() {}
           ^
/Users/dev/Downloads/WhatDa/WhatDa/Intelligence/DefaultExplainEngine.swift:9:12: note: main actor isolation inferred from conformance to protocol 'ExplainEngine'
    public init() {}
           ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:23:51: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context
        imageStore: any ImageStoring = ImageStore.shared,
                                                  ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ImageStore.swift:15:23: note: static property declared here
    public static let shared = ImageStore()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:24:64: warning: call to main actor-isolated static method 'create(isInMemory:)' in a synchronous nonisolated context
        modelContainer: ModelContainer = ModelContainerFactory.create()
                                                               ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ModelContainerFactory.swift:10:24: note: calls to static method 'create(isInMemory:)' from outside of its actor context are implicitly asynchronous
    public static func create(isInMemory: Bool = false) -> ModelContainer {
                       ^

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraPermission.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraPreviewView.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraPreviewView.swift:46:70: warning: 'isVideoOrientationSupported' was deprecated in iOS 17.0: Use -isVideoRotationAngleSupported: instead
        if let connection = videoPreviewLayer.connection, connection.isVideoOrientationSupported {
                                                                     ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraPreviewView.swift:47:24: warning: 'videoOrientation' was deprecated in iOS 17.0: Use -videoRotationAngle instead
            connection.videoOrientation = .portrait
                       ^

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:120:91: warning: 'isVideoOrientationSupported' was deprecated in iOS 17.0: Use -isVideoRotationAngleSupported: instead
                if let connection = self.photoOutput.connection(with: .video), connection.isVideoOrientationSupported {
                                                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:121:32: warning: 'videoOrientation' was deprecated in iOS 17.0: Use -videoRotationAngle instead
                    connection.videoOrientation = .portrait
                               ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:124:73: warning: main actor-isolated conformance of 'DefaultCameraService' to 'AVCapturePhotoCaptureDelegate' cannot be used in nonisolated context; this is an error in the Swift 6 language mode
                self.photoOutput.capturePhoto(with: settings, delegate: self)
                                                                        ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:134:25: warning: capture of 'device' with non-Sendable type 'AVCaptureDevice' in a '@Sendable' closure
                    try device.lockForConfiguration()
                        ^
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk/System/Library/Frameworks/AVFoundation.framework/Headers/AVCaptureDevice.h:73:12: note: class 'AVCaptureDevice' does not conform to the 'Sendable' protocol
@interface AVCaptureDevice : NSObject
           ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:6:1: warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'AVFoundation'
import AVFoundation
^
@preconcurrency 

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:38:59: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        cameraService: any CameraService = AppEnvironment.shared.cameraService,
                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:39:61: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        visionAnalyzer: any VisionAnalyzer = AppEnvironment.shared.visionAnalyzer,
                                                            ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:40:59: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        explainEngine: any ExplainEngine = AppEnvironment.shared.explainEngine
                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^

SwiftCompile normal arm64 Compiling\ ImageStore.swift,\ ModelContainerFactory.swift,\ Scan.swift,\ ScanRepository.swift /Users/dev/Downloads/WhatDa/WhatDa/Persistence/ImageStore.swift /Users/dev/Downloads/WhatDa/WhatDa/Persistence/ModelContainerFactory.swift /Users/dev/Downloads/WhatDa/WhatDa/Persistence/Scan.swift /Users/dev/Downloads/WhatDa/WhatDa/Persistence/ScanRepository.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Persistence/ImageStore.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Persistence/ModelContainerFactory.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Persistence/Scan.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Persistence/ScanRepository.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ScanRepository.swift:23:83: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context
    public init(modelContext: ModelContext, imageStore: ImageStoring = ImageStore.shared) {
                                                                                  ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ImageStore.swift:15:23: note: static property declared here
    public static let shared = ImageStore()
                      ^

SwiftEmitModule normal arm64 Emitting\ module\ for\ WhatDa (in target 'WhatDa' from project 'WhatDa')

EmitSwiftModule normal arm64 (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:20:44: warning: call to main actor-isolated initializer 'init()' in a synchronous nonisolated context
        cameraService: any CameraService = DefaultCameraService(),
                                           ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:52:21: note: calls to initializer 'init()' from outside of its actor context are implicitly asynchronous
    public override init() {
                    ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraService.swift:52:21: note: main actor isolation inferred from conformance to protocol 'CameraService'
    public override init() {
                    ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:21:46: warning: call to main actor-isolated initializer 'init(textAnalyzer:barcodeAnalyzer:qualityAnalyzer:subjectAnalyzer:)' in a synchronous nonisolated context
        visionAnalyzer: any VisionAnalyzer = DefaultVisionAnalyzer(),
                                             ^
/Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift:15:12: note: calls to initializer 'init(textAnalyzer:barcodeAnalyzer:qualityAnalyzer:subjectAnalyzer:)' from outside of its actor context are implicitly asynchronous
    public init(
           ^
/Users/dev/Downloads/WhatDa/WhatDa/Vision/DefaultVisionAnalyzer.swift:15:12: note: main actor isolation inferred from conformance to protocol 'VisionAnalyzer'
    public init(
           ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:22:44: warning: call to main actor-isolated initializer 'init()' in a synchronous nonisolated context
        explainEngine: any ExplainEngine = DefaultExplainEngine(),
                                           ^
/Users/dev/Downloads/WhatDa/WhatDa/Intelligence/DefaultExplainEngine.swift:9:12: note: calls to initializer 'init()' from outside of its actor context are implicitly asynchronous
    public init() {}
           ^
/Users/dev/Downloads/WhatDa/WhatDa/Intelligence/DefaultExplainEngine.swift:9:12: note: main actor isolation inferred from conformance to protocol 'ExplainEngine'
    public init() {}
           ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:23:51: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context
        imageStore: any ImageStoring = ImageStore.shared,
                                                  ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ImageStore.swift:15:23: note: static property declared here
    public static let shared = ImageStore()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:24:64: warning: call to main actor-isolated static method 'create(isInMemory:)' in a synchronous nonisolated context
        modelContainer: ModelContainer = ModelContainerFactory.create()
                                                               ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ModelContainerFactory.swift:10:24: note: calls to static method 'create(isInMemory:)' from outside of its actor context are implicitly asynchronous
    public static func create(isInMemory: Bool = false) -> ModelContainer {
                       ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:38:59: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        cameraService: any CameraService = AppEnvironment.shared.cameraService,
                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:39:61: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        visionAnalyzer: any VisionAnalyzer = AppEnvironment.shared.visionAnalyzer,
                                                            ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Camera/CameraViewModel.swift:40:59: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context; this is an error in the Swift 6 language mode
        explainEngine: any ExplainEngine = AppEnvironment.shared.explainEngine
                                                          ^
/Users/dev/Downloads/WhatDa/WhatDa/App/AppEnvironment.swift:17:23: note: static property declared here
    public static let shared = AppEnvironment()
                      ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ScanRepository.swift:23:83: warning: main actor-isolated static property 'shared' can not be referenced from a nonisolated context
    public init(modelContext: ModelContext, imageStore: ImageStoring = ImageStore.shared) {
                                                                                  ^
/Users/dev/Downloads/WhatDa/WhatDa/Persistence/ImageStore.swift:15:23: note: static property declared here
    public static let shared = ImageStore()
                      ^

SwiftCompile normal arm64 Compiling\ SubjectAnalyzer.swift,\ TextAnalyzer.swift,\ VisionAnalyzer.swift,\ WhatDaApp.swift /Users/dev/Downloads/WhatDa/WhatDa/Vision/SubjectAnalyzer.swift /Users/dev/Downloads/WhatDa/WhatDa/Vision/TextAnalyzer.swift /Users/dev/Downloads/WhatDa/WhatDa/Vision/VisionAnalyzer.swift /Users/dev/Downloads/WhatDa/WhatDa/WhatDaApp.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Vision/SubjectAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Vision/TextAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Vision/VisionAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/WhatDaApp.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 Compiling\ ExplanationResult.swift,\ SubjectCategory.swift,\ VisualContext.swift,\ VisualObservation.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/ExplanationResult.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/SubjectCategory.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/VisualContext.swift /Users/dev/Downloads/WhatDa/WhatDa/Models/VisualObservation.swift (in target 'WhatDa' from project 'WhatDa')

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/ExplanationResult.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/SubjectCategory.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/VisualContext.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftCompile normal arm64 /Users/dev/Downloads/WhatDa/WhatDa/Models/VisualObservation.swift (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    

SwiftDriverJobDiscovery normal arm64 Compiling PromptLibrary.swift, ChatMessage.swift, ConfidenceLevel.swift, ExplainState.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Compiling SubjectAnalyzer.swift, TextAnalyzer.swift, VisionAnalyzer.swift, WhatDaApp.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Compiling Haptics.swift, BarcodeAnalyzer.swift, DefaultVisionAnalyzer.swift, ImageQualityAnalyzer.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Compiling ImageStore.swift, ModelContainerFactory.swift, Scan.swift, ScanRepository.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Compiling StoredMessage.swift, ProgressPillView.swift, AppColors.swift, AppTypography.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Emitting module for WhatDa (in target 'WhatDa' from project 'WhatDa')

SwiftDriver\ Compilation\ Requirements WhatDa normal arm64 com.apple.xcode.tools.swift.compiler (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name WhatDa -Onone @/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftFileList -DDEBUG -default-isolation\=MainActor -enable-bare-slash-regex -enable-upcoming-feature DisableOutwardActorInference -enable-upcoming-feature InferSendableFromCaptures -enable-upcoming-feature GlobalActorIsolatedTypesUsability -enable-upcoming-feature MemberImportVisibility -enable-upcoming-feature InferIsolatedConformances -enable-upcoming-feature NonisolatedNonsendingByDefault -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios17.6 -g -module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -Xfrontend -serialize-debugging-options -enable-testing -index-store-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Index.noindex/DataStore -Xcc -D_LIBCPP_HARDENING_MODE\=_LIBCPP_HARDENING_MODE_DEBUG -swift-version 5 -I /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -F /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -emit-localized-strings -emit-localized-strings-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64 -c -j8 -enable-batch-mode -incremental -Xcc -ivfsstatcache -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448f32daed1954a7d5dd0789fcaf2a9bb78b.sdkstatcache -output-file-map /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -sdk-module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_const_extract_protocols.json -Xcc -iquote -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-generated-files.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-own-target-headers.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-target-headers.hmap -Xcc -iquote -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-project-headers.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/include -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources-normal/arm64 -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/arm64 -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources -Xcc -DDEBUG\=1 -emit-objc-header -emit-objc-header-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-Swift.h -working-directory /Users/dev/Downloads/WhatDa -experimental-emit-module-separately -disable-cmo

SwiftMergeGeneratedHeaders /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/WhatDa-Swift.h /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-Swift.h (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-swiftHeaderTool -arch arm64 /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-Swift.h -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/WhatDa-Swift.h

Copy /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/arm64-apple-ios.swiftmodule /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftmodule (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftmodule /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/arm64-apple-ios.abi.json /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.abi.json (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.abi.json /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/arm64-apple-ios.swiftdoc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftdoc (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftdoc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/arm64-apple-ios.swiftdoc

Copy /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftsourceinfo (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftsourceinfo /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

SwiftDriverJobDiscovery normal arm64 Compiling AppEnvironment.swift, CameraPermission.swift, CameraPreviewView.swift, CameraService.swift, CameraViewModel.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Compiling ExplanationResult.swift, SubjectCategory.swift, VisualContext.swift, VisualObservation.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriverJobDiscovery normal arm64 Compiling CapturedImage.swift, CameraView.swift, ExplanationView.swift, DefaultExplainEngine.swift, ExplainEngine.swift (in target 'WhatDa' from project 'WhatDa')

SwiftDriver\ Compilation WhatDa normal arm64 com.apple.xcode.tools.swift.compiler (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-Swift-Compilation -- /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name WhatDa -Onone @/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftFileList -DDEBUG -default-isolation\=MainActor -enable-bare-slash-regex -enable-upcoming-feature DisableOutwardActorInference -enable-upcoming-feature InferSendableFromCaptures -enable-upcoming-feature GlobalActorIsolatedTypesUsability -enable-upcoming-feature MemberImportVisibility -enable-upcoming-feature InferIsolatedConformances -enable-upcoming-feature NonisolatedNonsendingByDefault -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios17.6 -g -module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -Xfrontend -serialize-debugging-options -enable-testing -index-store-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Index.noindex/DataStore -Xcc -D_LIBCPP_HARDENING_MODE\=_LIBCPP_HARDENING_MODE_DEBUG -swift-version 5 -I /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -F /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -emit-localized-strings -emit-localized-strings-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64 -c -j8 -enable-batch-mode -incremental -Xcc -ivfsstatcache -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448f32daed1954a7d5dd0789fcaf2a9bb78b.sdkstatcache -output-file-map /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -sdk-module-cache-path /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/dev/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_const_extract_protocols.json -Xcc -iquote -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-generated-files.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-own-target-headers.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-all-target-headers.hmap -Xcc -iquote -Xcc /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-project-headers.hmap -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/include -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources-normal/arm64 -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources/arm64 -Xcc -I/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/DerivedSources -Xcc -DDEBUG\=1 -emit-objc-header -emit-objc-header-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-Swift.h -working-directory /Users/dev/Downloads/WhatDa -experimental-emit-module-separately -disable-cmo

Ld /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib normal (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios17.6 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -O0 -L/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/EagerLinkingTBDs/Debug-iphoneos -L/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -F/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/EagerLinkingTBDs/Debug-iphoneos -F/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -filelist /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.LinkFileList -install_name @rpath/WhatDa.debug.dylib -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_lto.o -rdynamic -Xlinker -no_deduplicate -Xlinker -dependency_info -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_dependency_info.dat -fobjc-link-runtime -L/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.swiftmodule @/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa-linker-args.resp -Xlinker -alias -Xlinker _main -Xlinker ___debug_main_executable_dylib_entry_point -Xlinker -no_adhoc_codesign -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib

ConstructStubExecutorLinkFileList /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-ExecutorLinkFileList-normal-arm64.txt (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    construct-stub-executor-link-file-list /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/lib/libPreviewsJITStubExecutor_no_swift_entry_point.a /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/lib/libPreviewsJITStubExecutor.a --output /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-ExecutorLinkFileList-normal-arm64.txt
note: Using stub executor library with Swift entry point. (in target 'WhatDa' from project 'WhatDa')

Ld /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa normal (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios17.6 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -O0 -L/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -F/Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos -Xlinker -rpath -Xlinker @executable_path -Xlinker -rpath -Xlinker @executable_path/Frameworks -rdynamic -Xlinker -no_deduplicate -e ___debug_blank_executor_main -Xlinker -sectcreate -Xlinker __TEXT -Xlinker __debug_dylib -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-DebugDylibPath-normal-arm64.txt -Xlinker -sectcreate -Xlinker __TEXT -Xlinker __debug_instlnm -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-DebugDylibInstallName-normal-arm64.txt -Xlinker -filelist -Xlinker /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa-ExecutorLinkFileList-normal-arm64.txt /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib -Xlinker -no_adhoc_codesign -o /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa

CopySwiftLibs /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-swiftStdLibTool --copy --verbose --sign 69158BF124A153821340F749D345CDC5B42EA9CA --scan-executable /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib --scan-folder /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Frameworks --scan-folder /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/PlugIns --scan-folder /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/SystemExtensions --scan-folder /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Extensions --platform iphoneos --toolchain /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.2GXTmu/Metal.xctoolchain --toolchain /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --destination /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Frameworks --strip-bitcode --strip-bitcode-tool /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/bitcode_strip --emit-dependency-info /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/SwiftStdLibToolInputDependencies.dep --filter-for-swift-os --back-deploy-swift-span

ExtractAppIntentsMetadata (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.2GXTmu/Metal.xctoolchain --module-name WhatDa --sdk-root /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 17.6 --bundle-identifier com.chitransh.WhatDa --output /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app --target-triple arm64-apple-ios17.6 --binary-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa --dependency-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa_dependency_info.dat --stringsdata-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftFileList --metadata-file-list /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyMetadataFileList --static-metadata-file-list /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyStaticMetadataFileList --swift-const-vals-list /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/Objects-normal/arm64/WhatDa.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-09-13 21:56:38.836 appintentsmetadataprocessor[18502:499901] Starting appintentsmetadataprocessor export
2026-09-13 21:56:38.842 appintentsmetadataprocessor[18502:499901] warning: Metadata extraction skipped. No AppIntents.framework dependency found.

AppIntentsSSUTraining (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Info.plist --temp-dir-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/ssu --bundle-id com.chitransh.WhatDa --product-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app --extracted-metadata-path /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Metadata.appintents --metadata-file-list /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.DependencyMetadataFileList --source-file /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/Info.plist --archive-ssu-assets
2026-09-13 21:56:38.878 appintentsnltrainingprocessor[18503:499903] Parsing options for appintentsnltrainingprocessor
2026-09-13 21:56:38.879 appintentsnltrainingprocessor[18503:499903] Starting AppIntents SSU YAML Generation
2026-09-13 21:56:38.881 appintentsnltrainingprocessor[18503:499903] No AppShortcuts found - Skipping.

CodeSign /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
    Signing Identity:     "Apple Development: chitransh.workspace@gmail.com (CAW65N2Y4C)"
    Provisioning Profile: "iOS Team Provisioning Profile: com.chitransh.WhatDa"
                          (beb3c667-5deb-40c5-877c-abbde6fb370d)
    
    /usr/bin/codesign --force --sign 69158BF124A153821340F749D345CDC5B42EA9CA --timestamp\=none --generate-entitlement-der /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/WhatDa.debug.dylib

CodeSign /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/__preview.dylib (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
    Signing Identity:     "Apple Development: chitransh.workspace@gmail.com (CAW65N2Y4C)"
    Provisioning Profile: "iOS Team Provisioning Profile: com.chitransh.WhatDa"
                          (beb3c667-5deb-40c5-877c-abbde6fb370d)
    
    /usr/bin/codesign --force --sign 69158BF124A153821340F749D345CDC5B42EA9CA --timestamp\=none --generate-entitlement-der /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app/__preview.dylib

CodeSign /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    
    Signing Identity:     "Apple Development: chitransh.workspace@gmail.com (CAW65N2Y4C)"
    Provisioning Profile: "iOS Team Provisioning Profile: com.chitransh.WhatDa"
                          (beb3c667-5deb-40c5-877c-abbde6fb370d)
    
    /usr/bin/codesign --force --sign 69158BF124A153821340F749D345CDC5B42EA9CA --entitlements /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Intermediates.noindex/WhatDa.build/Debug-iphoneos/WhatDa.build/WhatDa.app.xcent --timestamp\=none --generate-entitlement-der /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app

RegisterExecutionPolicyException /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-RegisterExecutionPolicyException /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app

Validate /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    builtin-validationUtility /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app -shallow-bundle -infoplist-subpath Info.plist

Touch /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app (in target 'WhatDa' from project 'WhatDa')
    cd /Users/dev/Downloads/WhatDa
    /usr/bin/touch -c /Users/dev/Library/Developer/Xcode/DerivedData/WhatDa-hcnpyjxuyhiemtcgqtbacylsodtj/Build/Products/Debug-iphoneos/WhatDa.app

** BUILD SUCCEEDED **

