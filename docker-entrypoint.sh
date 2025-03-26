#!/bin/bash

set -e

usage() {
    echo "Usage: docker run -it hexchip/download-roboflow-dataset [OPTIONS]"
    echo "Download Roboflow datasets."
    echo
    echo "Options:"
    echo "  --datasetUrl      Dataset URL in Roboflow (default: hexchip/honor-of-kings-u8coa/1)"
    echo "  --datasetFormat   Dataset format to download (default: yolov12)"
    echo "  --help            Show this help message"
    echo
    echo "Example:"
    echo "  docker run -it hexchip/download-roboflow-dataset --datasetUrl myproject/mydataset/1 --datasetFormat yolov12"
}

datasetUrl="hexchip/honor-of-kings-u8coa/1"
datasetFormat="yolov12"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --datasetUrl) 
            [[ -z "$2" ]] && echo "Error: --datasetUrl requires a value" >&2 && usage && exit 1
            datasetUrl="$2"
            shift 
            ;;
        --datasetFormat) 
            [[ -z "$2" ]] && echo "Error: --datasetFormat requires a value" >&2 && usage && exit 1
            datasetFormat="$2"
            shift 
            ;;
        --help) 
            usage
            exit 0 
            ;;
        *) 
            echo "Error: Unknown parameter passed: $1" >&2
            usage >&2
            exit 1 
            ;;
    esac
    shift
done

roboflow login

roboflow download -f $datasetFormat $datasetUrl