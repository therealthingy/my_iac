#!/usr/bin/env bash


NOTIFICATION_MAIL_FROM_ADDR=${NOTIFICATION_MAIL_SERVER_USERNAME}

# Create mail msg
TMP_MAILFILE=`mktemp -t transmission.XXXXXXXXXX`


cat <<- EOF > $TMP_MAILFILE
From: "Transmission" <$NOTIFICATION_MAIL_FROM_ADDR>
To: "Transmission Admin" <$NOTIFICATION_MAIL_TO_ADDR>
Subject: Finished downloading torrent

EOF


if [ "$NOTIFICATION_MAIL_HIDE_FILENAME" = false ]; then
    echo "Transmission has finished downloading \"$TR_TORRENT_NAME\" on ${TR_TIME_LOCALTIME}." >> $TMP_MAILFILE
else
    echo "---" >> $TMP_MAILFILE
fi



# Semd mail & cleanup
curl \
  --url "smtps://$NOTIFICATION_MAIL_SMTP_SERVER_HOST:$NOTIFICATION_MAIL_SMTP_SERVER_PORT" --ssl-reqd \
  --user "$NOTIFICATION_MAIL_SERVER_USERNAME:$NOTIFICATION_MAIL_SERVER_PASSWORD" \
  --mail-from "$NOTIFICATION_MAIL_FROM_ADDR" \
  --mail-rcpt "$NOTIFICATION_MAIL_TO_ADDR" \
  --upload-file $TMP_MAILFILE \
-s > /dev/null

rm $TMP_MAILFILE


exit 0
