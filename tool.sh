#!/bin/sh
#
#  Created by TienAnh on 04/07/2023.
#
chmod +x ./tool.sh

folderName=$1
changeName=$2
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

        ((index++))
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

        ((index++))
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
    folderPath="$SynoPath/$folderName/android/google-services-prod"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        rm "$folderPath/google-services.json"
    fi
    source_folder="."
    cp "$source_folder/google-services.json" "$folderPath"
}

changeCardIcons() {
    folderPath="$SynoPath/$folderName/android/assets/topic_icons"
    if [[ -n $(find "$folderPath" -type f -print -quit) ]]; then
        for file in "$folderPath"/*; do
            if [[ -f "$file" && "$file" == *.* ]]; then
                rm "$file"
            fi
        done
    fi

    source_folder="$DesignPath/$folderName/app_images/icons"
    index=0
    
    if [[ $changeName != "null" ]]; then
        source_folder="$DesignPath/$changeName/app_images/icons"
    else
        source_folder="$DesignPath/$folderName/app_images/icons"
    fi

    for file in "$source_folder"/*.png; do
        if [[ -f "$file" && "$file" == *.png ]]; then
            filename=$(basename "$file")
            extension="${filename##*.}"

            new_filename="topic_icon_$index.$extension"

            cp "$file" "$folderPath/$new_filename"

            ((index++))
        fi
    done


    if find "$folderPath" -name '*.png' -print -quit | grep -q .; then
        echo "The directory contains .png files."
    else
        echo "$folderName"
    fi
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
    # changeCardImages
    # changeTestImages
    # changeSplashImages
    # changePassingProbImages
    # changeGGService
    changeCardIcons
    # changeQuestionImages
}

process
