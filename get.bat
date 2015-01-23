@echo off
Python get.py frf >cardList.txt
for /f "tokens=1,2 delims=/" %%A in (cardList.txt) do (
        REM %%A = multiverse_id
        REM %%B = rarity
)

exit /b


:combine_Image dir
        pushd %1
        montage -geometry 400x550 card_0.jpg card_1.jpg card_2.jpg card_o_1.jpg
        montage -geometry 400x550 card_3.jpg card_4.jpg card_5.jpg card_o_2.jpg
        montage -geometry 400x550 card_6.jpg card_7.jpg card_8.jpg card_o_3.jpg
        montage -geometry 400x550 card_9.jpg card_10.jpg card_11.jpg card_o_4.jpg
        montage -geometry 400x550 card_12.jpg card_13.jpg card_14.jpg card_o_5.jpg

        montage -geometry 550x1200 -rotate 90 card_o_1.jpg card_o_1.jpg
        montage -geometry 550x1200 -rotate 90 card_o_2.jpg card_o_2.jpg
        montage -geometry 550x1200 -rotate 90 card_o_3.jpg card_o_3.jpg
        montage -geometry 550x1200 -rotate 90 card_o_4.jpg card_o_4.jpg
        montage -geometry 550x1200 -rotate 90 card_o_5.jpg card_o_5.jpg

        montage -geometry 550x1200 card_o_1.jpg card_o_2.jpg card_o_3.jpg pg_1.jpg
        montage -geometry 550x1200 card_o_4.jpg card_o_5.jpg pg_2.jpg

        montage -geometry 1200x1650 -rotate 270 pg_1.jpg pg_1.jpg
        montage -geometry 1200x1100 -rotate 270 pg_2.jpg pg_2.jpg

        "..\..\convert.exe" pg_1.jpg 1.pdf
        "..\..\convert.exe" pg_2.jpg 2.pdf

        del *.jpg
        popd
goto :eof