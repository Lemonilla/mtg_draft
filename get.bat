@echo off
setlocal EnableDelayedExpansion

Python get.py ala 3 %cd%
set a=1
for /f %%Z in ('dir /b *.txt') do (
        echo !a!/3
        if exist pack_!a! rd /s /q pack_!a!
        md pack_!a!
        cd pack_!a!
        set c=0
        for /f %%A in (..\%%Z) do (
                wget -Ocard_!c!.jpg "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%%A&type=card" >nul 2>&1
                set /a c+=1
        )
        call :combine_Image
        set /a a+=1
        cd ..
)

exit /b


:combine_Image
        img_montage -geometry 400x550 card_0.jpg card_1.jpg card_2.jpg card_o_1.jpg
        img_montage -geometry 400x550 card_3.jpg card_4.jpg card_5.jpg card_o_2.jpg
        img_montage -geometry 400x550 card_6.jpg card_7.jpg card_8.jpg card_o_3.jpg
        img_montage -geometry 400x550 card_9.jpg card_10.jpg card_11.jpg card_o_4.jpg
        img_montage -geometry 400x550 card_12.jpg card_13.jpg card_14.jpg card_o_5.jpg

        img_montage -geometry 550x1200 -rotate 90 card_o_1.jpg card_o_1.jpg
        img_montage -geometry 550x1200 -rotate 90 card_o_2.jpg card_o_2.jpg
        img_montage -geometry 550x1200 -rotate 90 card_o_3.jpg card_o_3.jpg
        img_montage -geometry 550x1200 -rotate 90 card_o_4.jpg card_o_4.jpg
        img_montage -geometry 550x1200 -rotate 90 card_o_5.jpg card_o_5.jpg

        img_montage -geometry 550x1200 card_o_1.jpg card_o_2.jpg card_o_3.jpg pg_1.jpg
        img_montage -geometry 550x1200 card_o_4.jpg card_o_5.jpg pg_2.jpg

        img_montage -geometry 1200x1650 -rotate 270 pg_1.jpg pg_1.jpg
        img_montage -geometry 1200x1100 -rotate 270 pg_2.jpg pg_2.jpg

        img_convert.exe pg_1.jpg 1.pdf
        img_convert.exe pg_2.jpg 2.pdf

        del *.jpg
goto :eof