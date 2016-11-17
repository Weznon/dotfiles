#!/usr/bin/env bash

if ! type cmus >/dev/null 2>&1; then

  printf "\033c"
  echo ""
  echo "Cmus Is Not Installed!"
  echo ""
  echo "Cmus Is An Amazing Console Audio Player!"
  echo "Please Install Cmus Using Your Package-manager!"
  echo ""

  exit 1

else

  CMUSQ=$(cmus-remote -Q 2>/dev/null)

  if [[ -z "$CMUSQ" ]]; then

    printf "\033c"
    echo ""
    echo "Cmus Is Not Running!"
    echo "To Start Cmus, type \"cmus\" In Your Terminal!"
    echo ""

    exit 1

  else

    CM_ST=$(cmus-remote -Q 2>/dev/null | grep "stopped")

    if [[ -n "$CM_ST" ]]; then

      printf "\033c"
      echo ""
      echo "Cmus Is Not Playing Anything!"
      echo ""

      exit 1

    else

      if ! type perl >/dev/null 2>&1; then

        printf "\033c"
        echo ""
        echo "Perl Is Not Installed!"
        echo ""
        echo "Perl Is A Required Dependency!"
        echo "Please Install Perl Using Your Package-manager!"
        echo ""

        exit 1

      else

        perl -MURI::Escape -e 'print "$URI::Escape::VERSION\n";' &> /dev/null

        RETVAL=$?

        if [ "$RETVAL" -ne 0 ]; then

          printf "\033c"
          echo ""
          echo "Perl Module \"URI::Escape\" Is Not Installed!"
          echo ""
          echo "Module \"URI::Escape\" Is A Required Dependency!"
          echo "Please Open The Following Link For More Info,"
          echo ""
          echo -e '\e[38;5;82m'"http://stackoverflow.com/q/65865"
          echo ""
          tput sgr0

          exit 1

        else

          if ! type wget >/dev/null 2>&1; then

            printf "\033c"
            echo ""
            echo "Wget Is Not Installed!"
            echo "Please Install Wget Using Your Package-manager!"
            echo ""

            exit 1

          else

            printf "\033c"
            ARTIST1=$(cmus-remote -Q 2>/dev/null | grep -m 1 'artist' | cut -d " " -f 3-)
            TITLE1=$(cmus-remote -Q 2>/dev/null | grep -m 1 'title' | cut -d " " -f 3-)
            ALBUM1=$(cmus-remote -Q 2>/dev/null | grep -m 1 'album' | cut -d " " -f 3-)

            if [[ `wget -S --spider "https://makeitpersonal.co" 2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then

              ARTIST2=$(echo "$ARTIST1" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"')
              TITLE2=$(echo "$TITLE1" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"')
              SONG1=$(wget --user-agent="Mozilla/5.0 Gecko/20100101" --no-check-certificate --quiet --timeout=30 -O - "https://makeitpersonal.co/lyrics?artist=$ARTIST2&title=$TITLE2")

              printf "$TITLE1 - $ARTIST1 - $ALBUM1\n$SONG1" | less
              printf "\033c"

              exit 0

            else

              printf "\033c"
              echo ""
              echo "Can Not Connect To The Site \"makeitpersonal\"!"
              echo "Make Sure Your Internet Connection Is Active!"
              echo "If The Problem Persists You Can Report It At,"
              echo "GitHub repository of the project by creating,"
              echo "An Issue There. Here Is The Link To The Repo,"
              echo ""
              echo -e '\e[38;5;82m'"https://github.com/hakerdefo/cmus-lyrics"
              echo ""
              tput sgr0
              echo "If you don't use GitHub you can report it by,"
              echo "emailing the author at the following address,"
              echo ""
              echo -e '\e[38;5;82m'"hakerdefo (at) gmail (dot) com"
              echo ""
              tput sgr0

              exit 1

            fi
          fi
        fi
      fi
    fi
  fi
fi
