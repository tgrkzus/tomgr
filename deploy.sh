#!/bin/sh

function deploy
{
	aws s3 cp . s3://tomgr.io/ --recursive --exclude "*" --include "*.html" --include "*.js" --include "*.css" --include "*.png" --acl public-read
}

function clean
{
	aws s3 rm --recursive s3://tomgr.io/
}

if [ "$1" == "clean" ]; then
	clean
else
	deploy
fi