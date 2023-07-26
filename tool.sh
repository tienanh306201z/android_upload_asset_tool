#!/bin/sh
#
#  Created by TienAnh on 04/07/2023.
#
chmod +x ./tool.sh

folderName=$1
SynoPath="/Users/user/SynologyDrive"
DesignPath="/Users/user/SyncFlutterApp/SynologyDrive/designer"
DevPath="/Users/user/SyncFlutterApp/SynologyDrive/developer"

changeCardImages() {
    folderPath="$SynoPath/$folderName/android/assets/card_images"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath"/*.png
    fi

    source_folder="./card_images"
    index=0

    for file in "$source_folder"/*.png; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        new_filename="card_image_$index.$extension"

        cp "$file" "$folderPath/$new_filename"

        ( (index++))
    done
}

changeTestImages() {
    folderPath="$SynoPath/$folderName/android/assets/test_images"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath"/*.png
    fi

    source_folder="./test_images"
    index=0

    for file in "$source_folder"/*.png; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        new_filename="test_image_$index.$extension"

        cp "$file" "$folderPath/$new_filename"

        ( (index++))
    done
}

changeSplashImages() {
    folderPath="$SynoPath/$folderName/android/assets/splash_images"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath"/*.png
    fi
    source_folder="./splash_images"
    cp "$source_folder"/*.png "$folderPath"
}

changePassingProbImages() {
    folderPath="$SynoPath/$folderName/android/assets/passing_prob_images"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath"/*.png
    fi
    source_folder="./passing_prob_images"
    cp "$source_folder"/*.png "$folderPath"
}

changeGGService() {
    folderPath="$SynoPath/$folderName/android"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath/google-services.json"
    fi
    source_folder="."
    cp "$source_folder/google-services.json" "$folderPath"
}

changeCardIcons() {
    folderPath="$SynoPath/$folderName/android/assets/topic_icons"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath"/*.svg
    fi
    source_folder="$DesignPath/$folderName/app_images/icons"
    index=0

    for file in "$source_folder"/*.svg; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        new_filename="topic_icon_$index.$extension"

        cp "$file" "$folderPath/$new_filename"

        ( (index++))
    done
}

changeQuestionImages() {
    folderPath="$SynoPath/$folderName/android/assets/question_images"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath"/*
    fi
    source_folder="$DevPath/$folderName/images"
    cp "$source_folder"/* "$folderPath"
}

process() {
    changeCardImages
    changeTestImages
    changeSplashImages
    changePassingProbImages
    changeGGService
    changeCardIcons
    changeQuestionImages
}

process