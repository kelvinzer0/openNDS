#!/bin/sh
# theme_password_only_no_voucher

title="theme_password_only"

# Password tetap bisa diset di sini
PASSWORD="rahasia123"

header() {
    echo "<!DOCTYPE html>
    <html>
    <head>
        <meta charset=\"utf-8\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <link rel=\"stylesheet\" type=\"text/css\" href=\"/splash.css\">
        <title>$gatewayname</title>
    </head>
    <body>
    <div class=\"offset\">
    <div class=\"insert\" style=\"max-width:400px; margin:auto; text-align:center;\">
    "
}

footer() {
    year=$(date +'%Y')
    echo "<hr>
    &copy; $year - $title
    </div></div></body></html>"
    exit 0
}

login_page() {
    header
    echo "
    <h2>Enter Password</h2>
    <form action=\"/opennds_preauth/\" method=\"get\">
        <input type=\"hidden\" name=\"fas\" value=\"$fas\">
        <input type=\"password\" name=\"password\" placeholder=\"Password\" required style=\"width:80%; padding:8px;\"><br><br>
        <input type=\"submit\" value=\"Login\" style=\"padding:8px 16px;\">
    </form>
    "
    footer
}

validate_password() {
    if [ "$password" = "$PASSWORD" ]; then
        echo "<p>Password benar! Akses diberikan.</p>"
        footer
    else
        echo "<p>Password salah! Coba lagi.</p>"
        login_page
    fi
}

# Main
if [ -n "$password" ]; then
    validate_password
else
    login_page
fi
