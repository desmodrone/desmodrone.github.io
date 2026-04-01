PEOPLE=("erick" "gia")
mkdir -p shared/fonts && touch shared/logo.svg shared/fonts/custom-font.woff2 shared/bg.jpg

for PERSON in "${PEOPLE[@]}"; do
  mkdir -p "$PERSON"
  cat > "$PERSON/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${PERSON^} • apex-id</title><link rel="stylesheet" href="style.css" /></head>
<body>
  <div class="card">
    <img src="../shared/logo.svg" class="logo" alt="Logo" />
    <h1>${PERSON^}</h1>
    <p>Phone: <a href="tel:+1234567890">+1 234 567 890</a></p>
    <p>Email: <a href="mailto:${PERSON}@example.com">${PERSON}@example.com</a></p>
    <p>Telegram: <a href="https://t.me/${PERSON}">@${PERSON}</a></p>
    <p>LinkedIn: <a href="https://linkedin.com/in/${PERSON}">${PERSON}</a></p>
    <p>Website: <a href="https://desmodrone.github.io">desmodrone.github.io</a></p>
    <p><a href="${PERSON}.vcf" download>📇 Download Contact Card (.vcf)</a></p>
  </div>
</body>
</html>
EOF

  cat > "$PERSON/style.css" <<EOF
body {
  font-family: sans-serif;
  background: url('../shared/bg.jpg') no-repeat center center fixed;
  background-size: cover;
  color: white;
  text-align: center;
  padding: 2em;
}
.card {
  background: rgba(0, 0, 0, 0.6);
  border-radius: 12px;
  padding: 2em;
  max-width: 400px;
  margin: auto;
}
a { color: #00ffff; }
.logo { width: 80px; margin-bottom: 1em; }
EOF

  cat > "$PERSON/${PERSON}.vcf" <<EOF
BEGIN:VCARD
VERSION:3.0
FN:${PERSON^}
TEL:+1234567890
EMAIL:${PERSON}@example.com
URL:https://desmodrone.github.io
END:VCARD
EOF
done

echo "✅ Done. Visit apex-id/erick or apex-id/gia in your browser to check them out!"
