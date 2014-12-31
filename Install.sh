#! /bin/sh

export project_name="SMJobBless"
export app_name="${project_name}App"
export app_info="${app_name}/${app_name}-Info.plist"
export app_signed="./build/Release/${app_name}.app"

export helper_name="${project_name}Helper"
export helper_info="${helper_name}/${helper_name}-Info.plist"

export smjobblessutil="./SMJobBlessUtil.py"


build() 
{

    xcodebuild clean -project $project_name.xcodeproj > /dev/null && xcodebuild -project $project_name.xcodeproj > /dev/null

}

sign()
{

    /usr/bin/env python $smjobblessutil setreq $app_signed $app_info $helper_info  

}

check()
{
    /usr/bin/env python $smjobblessutil check $app_signed 
}


build && sign && build && check 
