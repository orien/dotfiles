#!/bin/bash
set -eu

# https://developer.apple.com/library/archive/technotes/tn2450/_index.html
caps_lock="0x700000039"
escape="0x700000029"
hidutil property --set "{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\":${caps_lock},\"HIDKeyboardModifierMappingDst\":${escape}}]}"
