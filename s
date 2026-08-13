<?php
header("Content-type: text/xml");
echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

include 'backend/connection.php';
$sql = mysqli_query($conn, "SELECT course, code, edited FROM chapters ORDER BY id DESC");

while ($row = mysqli_fetch_assoc($sql)) {
    $loc = htmlspecialchars("https://codedocs.org/" . $row["course"] . "/" . $row["code"], ENT_XML1);
    $lastmod = $row["edited"] ? date("Y-m-d", strtotime($row["edited"])) : date("Y-m-d");
    echo "  <url>\n";
    echo "    <loc>{$loc}</loc>\n";
    echo "    <lastmod>{$lastmod}</lastmod>\n";
    echo "    <changefreq>monthly</changefreq>\n";
    echo "  </url>\n";
}

echo '</urlset>';
