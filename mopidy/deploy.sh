#!/bin/bash

set -euo pipefail

rsync -avz --delete /mnt/z/Music/RPG/spotify/ music
fly deploy --local-only
