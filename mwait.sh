#!/bin/bash

# File: mwait.sh
# Purpose: mwait - email waiting checks
# Author: Paul Greenberg (http://www.greenberg.pro)
# Version: 1.0
# Copyright: (c) 2013 Paul Greenberg <paul@greenberg.pro>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

MBOX_PATH=${HOME}/Mail/
MBOX_EXT=.spool

for MBOX_FILE in "personal" "business" "maillists";
do
 MBOX_SIZE=`mailx -H -f ${MBOX_PATH}${MBOX_FILE}${MBOX_EXT} | egrep "^.N" | wc -l`
 if [ $MBOX_SIZE -gt 0 ]; then
  echo "################################################";
  case ${MBOX_FILE} in
      personal)
          echo "# Personal Account";
          ;;
      business)
          echo "# Business Account";
          ;;
      maillists)
          echo "# Mailing Lists";
          ;;
      *)
          ;;
  esac
  echo "################################################";
  mailx -H -f ${MBOX_PATH}${MBOX_FILE}${MBOX_EXT}
 fi
done
