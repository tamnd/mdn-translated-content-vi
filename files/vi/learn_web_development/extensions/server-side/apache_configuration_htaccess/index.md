---
title: "Cấu hình Apache: .htaccess"
short-title: Apache .htaccess
slug: Learn_web_development/Extensions/Server-side/Apache_Configuration_htaccess
page-type: guide
sidebar: learnsidebar
---

Các tệp .htaccess của Apache cho phép người dùng cấu hình các thư mục của máy chủ web mà họ kiểm soát mà không cần sửa đổi tệp cấu hình chính.

Mặc dù điều này hữu ích, nhưng quan trọng cần lưu ý rằng việc sử dụng các tệp `.htaccess` làm chậm Apache, vì vậy, nếu bạn có quyền truy cập vào tệp cấu hình máy chủ chính (thường được gọi là `httpd.conf`), bạn nên thêm logic này ở đó trong khối `Directory`.

Xem [.htaccess](https://httpd.apache.org/docs/current/howto/htaccess.html) trên trang tài liệu Apache HTTPD để biết thêm chi tiết về những gì các tệp .htaccess có thể làm.

Phần còn lại của tài liệu này sẽ thảo luận về các tùy chọn cấu hình khác nhau mà bạn có thể thêm vào `.htaccess` và chúng làm gì.

Hầu hết các khối sau sử dụng chỉ thị [IfModule](https://httpd.apache.org/docs/2.4/mod/core.html#ifmodule) để chỉ thực thi các lệnh bên trong khối nếu mô-đun tương ứng được cấu hình đúng cách và máy chủ đã tải nó. Bằng cách này, chúng ta tránh cho máy chủ bị crash nếu mô-đun không được tải.

## Chuyển hướng

Đôi khi chúng ta cần thông báo cho người dùng rằng một tài nguyên đã được di chuyển, tạm thời hoặc vĩnh viễn. Đây là lý do chúng ta sử dụng `Redirect` và `RedirectMatch`.

```apacheconf
<IfModule mod_alias.c>
  # Redirect to a URL on a different host
  Redirect "/service" "http://foo2.example.com/service"

  # Redirect to a URL on the same host
  Redirect "/one" "/two"

  # Equivalent redirect to URL on the same host
  Redirect temp "/one" "/two"

  # Permanent redirect to a URL on the same host
  Redirect permanent "/three" "/four"

  # Redirect to an external URL
  # Using regular expressions and RedirectMatch
  RedirectMatch "^/oldfile\.html/?$" "http://example.com/newfile.php"
</IfModule>
```

Các giá trị có thể cho tham số đầu tiên được liệt kê bên dưới. Nếu tham số đầu tiên không được bao gồm, mặc định là `temp`.

- permanent
  - : Trả về trạng thái chuyển hướng vĩnh viễn (301) cho biết tài nguyên đã được di chuyển vĩnh viễn.
- temp
  - : Trả về trạng thái chuyển hướng tạm thời (302). **Đây là mặc định**.
- seeother
  - : Trả về trạng thái "See Other" (303) cho biết tài nguyên đã được thay thế.
- gone
  - : Trả về trạng thái "Gone" (410) cho biết tài nguyên đã bị xóa vĩnh viễn. Khi sử dụng trạng thái này, đối số _URL_ nên được bỏ qua.

## Tài nguyên cross-origin

Tập hợp chỉ thị đầu tiên kiểm soát quyền truy cập [CORS](https://fetch.spec.whatwg.org/) (Chia sẻ tài nguyên cross-origin) vào các tài nguyên từ máy chủ. CORS là một cơ chế dựa trên tiêu đề HTTP cho phép máy chủ chỉ ra các nguồn gốc bên ngoài (miền, giao thức, hoặc cổng) mà trình duyệt nên cho phép tải tài nguyên.

Vì lý do bảo mật, các trình duyệt hạn chế các yêu cầu HTTP cross-origin được khởi tạo từ các script. Ví dụ, XMLHttpRequest và Fetch API tuân theo chính sách cùng nguồn gốc. Một ứng dụng web sử dụng những API đó chỉ có thể yêu cầu tài nguyên từ cùng nguồn gốc mà ứng dụng được tải từ đó trừ khi phản hồi từ các nguồn gốc khác bao gồm các tiêu đề CORS thích hợp.

### Quyền truy cập CORS chung

Chỉ thị này sẽ thêm tiêu đề CORS cho tất cả tài nguyên trong thư mục từ bất kỳ trang web nào.

```apacheconf
<IfModule mod_headers.c>
  Header set Access-Control-Allow-Origin "*"
</IfModule>
```

Trừ khi bạn ghi đè chỉ thị sau trong cấu hình hoặc trong cấu hình của thư mục bên dưới nơi bạn đặt cái này, mọi yêu cầu từ các máy chủ bên ngoài sẽ được thực hiện, điều này ít có khả năng là điều bạn muốn.

Một lựa chọn thay thế là nêu rõ các miền nào có quyền truy cập vào nội dung của trang web của bạn. Trong ví dụ dưới đây, chúng ta hạn chế quyền truy cập vào một tên miền phụ của trang web chính của chúng ta (example.com). Điều này an toàn hơn và, có thể, là điều bạn dự định làm.

```apacheconf
<IfModule mod_headers.c>
  Header set Access-Control-Allow-Origin "subdomain.example.com"
</IfModule>
```

### Hình ảnh cross-origin

Như được báo cáo trong [Chromium Blog](https://blog.chromium.org/2011/07/using-cross-domain-images-in-webgl-and.html) và được ghi lại trong [Cho phép sử dụng hình ảnh và canvas cross-origin](/en-US/docs/Web/HTML/How_to/CORS_enabled_image) có thể dẫn đến các cuộc tấn công [fingerprinting](/en-US/docs/Glossary/Fingerprinting).

Để giảm thiểu khả năng xảy ra các cuộc tấn công này, bạn nên sử dụng thuộc tính `crossorigin` trong các hình ảnh bạn yêu cầu và đoạn mã bên dưới trong `.htaccess` của bạn để đặt tiêu đề CORS từ máy chủ.

```apacheconf
<IfModule mod_setenvif.c>
  <IfModule mod_headers.c>
    <FilesMatch "\.(bmp|cur|gif|ico|jpe?g|a?png|svgz?|webp|heic|heif|avif)$">
      SetEnvIf Origin ":" IS_CORS
      Header set Access-Control-Allow-Origin "*" env=*IS_CORS*
    </FilesMatch>
  </IfModule>
</IfModule>
```

[Hướng dẫn xử lý sự cố Google Fonts](https://developers.google.com/fonts/docs/troubleshooting) của Google Chrome cho chúng ta biết rằng, mặc dù Google Fonts có thể gửi tiêu đề CORS với mọi phản hồi, một số máy chủ proxy có thể loại bỏ nó trước khi trình duyệt có thể sử dụng nó để hiển thị font chữ.

```apacheconf
<IfModule mod_headers.c>
  <FilesMatch "\.(eot|otf|tt[cf]|woff2?)$">
    Header set Access-Control-Allow-Origin "*"
  </FilesMatch>
</IfModule>
```

### Thời gian tài nguyên cross-origin

Đặc tả [Resource Timing](https://w3c.github.io/resource-timing/) định nghĩa một giao diện cho các ứng dụng web để truy cập thông tin thời gian đầy đủ cho các tài nguyên trong một tài liệu.

Tiêu đề phản hồi [`Timing-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Timing-Allow-Origin) chỉ định các nguồn gốc được phép xem các giá trị của các thuộc tính được truy xuất thông qua các tính năng của API Resource Timing, nếu không sẽ được báo cáo là không vì các hạn chế cross-origin.

Nếu tài nguyên không được phục vụ với `Timing-Allow-Origin` hoặc nếu tiêu đề không bao gồm nguồn gốc sau khi thực hiện yêu cầu, một số thuộc tính của đối tượng `PerformanceResourceTiming` sẽ được đặt thành không.

```apacheconf
<IfModule mod_headers.c>
  Header set Timing-Allow-Origin: "*"
</IfModule>
```

## Trang/thông báo lỗi tùy chỉnh

Apache cho phép bạn cung cấp các trang lỗi tùy chỉnh cho người dùng tùy thuộc vào loại lỗi họ nhận được.

Các trang lỗi được trình bày dưới dạng URL. Các URL này có thể bắt đầu bằng dấu gạch chéo (/) cho các đường dẫn web cục bộ (tương đối với DocumentRoot) hoặc là URL đầy đủ mà máy khách có thể phân giải.

Xem tài liệu [Chỉ thị ErrorDocument](https://httpd.apache.org/docs/current/mod/core.html#errordocument) trên trang tài liệu HTTPD để biết thêm thông tin.

```apacheconf
ErrorDocument 500 /errors/500.html
ErrorDocument 404 /errors/400.html
ErrorDocument 401 https://example.com/subscription_info.html
ErrorDocument 403 "Sorry, can't allow you access today."
```

## Ngăn ngừa lỗi

Cài đặt này ảnh hưởng đến cách MultiViews hoạt động cho thư mục mà cấu hình áp dụng.

Hiệu quả của `MultiViews` như sau: nếu máy chủ nhận được yêu cầu cho /some/dir/foo, nếu /some/dir có `MultiViews` được bật, và /some/dir/foo không tồn tại, thì máy chủ đọc thư mục tìm kiếm các tệp có tên foo.\*, và tạo ra một bản đồ kiểu giả mạo đặt tên tất cả các tệp đó, gán cho chúng cùng kiểu phương tiện và mã hóa nội dung mà nó sẽ có nếu máy khách đã yêu cầu một trong số chúng theo tên. Sau đó nó chọn kết quả phù hợp nhất với yêu cầu của máy khách.

Cài đặt này tắt `MultiViews` cho thư mục mà cấu hình này áp dụng và ngăn Apache trả về lỗi 404 do kết quả của việc viết lại khi thư mục có cùng tên không tồn tại.

```apacheconf
Options -MultiViews
```

## Kiểu phương tiện và mã hóa ký tự

Apache sử dụng [mod_mime](https://httpd.apache.org/docs/current/mod/mod_mime.html#addtype) để gán siêu dữ liệu nội dung cho nội dung được chọn cho phản hồi HTTP bằng cách ánh xạ các mẫu trong URI hoặc tên tệp sang các giá trị siêu dữ liệu.

Ví dụ, phần mở rộng tên tệp của tệp nội dung thường xác định loại phương tiện Internet, ngôn ngữ, bộ ký tự và mã hóa nội dung. Thông tin này được gửi trong các thông điệp HTTP chứa nội dung đó và được sử dụng trong đàm phán nội dung khi chọn các lựa chọn thay thế, để tùy chọn của người dùng được tôn trọng khi chọn một trong một số nội dung có thể phục vụ.

**Việc thay đổi siêu dữ liệu cho một tệp không thay đổi giá trị của tiêu đề Last-Modified. Do đó, các bản sao được lưu trong bộ nhớ đệm trước đó vẫn có thể được máy khách hoặc máy chủ proxy sử dụng, với các tiêu đề trước. Nếu bạn thay đổi siêu dữ liệu (ngôn ngữ, kiểu nội dung, bộ ký tự hoặc mã hóa), bạn có thể cần 'chạm' các tệp bị ảnh hưởng (cập nhật ngày sửa đổi lần cuối của chúng) để đảm bảo tất cả khách truy cập nhận được các tiêu đề nội dung đã được sửa chính xác.**

### Phục vụ tài nguyên với kiểu phương tiện đúng (còn gọi là kiểu MIME)

Liên kết các kiểu phương tiện với một hoặc nhiều phần mở rộng để đảm bảo các tài nguyên sẽ được phục vụ đúng cách.

Các máy chủ nên sử dụng `text/javascript` cho các tài nguyên JavaScript như được chỉ định trong [đặc tả HTML](https://html.spec.whatwg.org/multipage/scripting.html#scriptingLanguages).

```apacheconf
<IfModule mod_mime.c>
  # Data interchange
    AddType application/atom+xml      atom
    AddType application/json          json map topojson
    AddType application/ld+json       jsonld
    AddType application/rss+xml       rss
    AddType application/geo+json      geojson
    AddType application/rdf+xml       rdf
    AddType application/xml           xml
  # JavaScript
    AddType text/javascript           js mjs
  # Manifest files
    AddType application/manifest+json     webmanifest
    AddType application/x-web-app-manifest+json         webapp
    AddType text/cache-manifest           appcache
  # Media files
    AddType audio/mp4                     f4a f4b m4a
    AddType audio/ogg                     oga ogg opus
    AddType image/bmp                     bmp
    AddType image/svg+xml                 svg svgz
    AddType image/webp                    webp
    AddType video/mp4                     f4v f4p m4v mp4
    AddType video/ogg                     ogv
    AddType video/webm                    webm
    AddType image/x-icon    cur ico
  # HEIF Images
    AddType image/heic                    heic
    AddType image/heif                    heif
  # HEIF Image Sequence
    AddType image/heics                   heics
    AddType image/heifs                   heifs
  # AVIF Images
    AddType image/avif                    avif
  # AVIF Image Sequence
    AddType image/avis                    avis
  # WebAssembly
    AddType application/wasm              wasm
  # Web fonts
    AddType font/woff                         woff
    AddType font/woff2                        woff2
    AddType application/vnd.ms-fontobject                eot
    AddType font/ttf                          ttf
    AddType font/collection                   ttc
    AddType font/otf                          otf
  # Other
    AddType application/octet-stream          safariextz
    AddType application/x-bb-appworld         bbaw
    AddType application/x-chrome-extension    crx
    AddType application/x-opera-extension     oex
    AddType application/x-xpinstall           xpi
    AddType text/calendar                     ics
    AddType text/markdown                     markdown md
    AddType text/vcard                        vcard vcf
    AddType text/vnd.rim.location.xloc        xloc
    AddType text/vtt                          vtt
    AddType text/x-component                  htc
</IfModule>
```

## Đặt thuộc tính charset mặc định

Mỗi phần nội dung trên web đều có một bộ ký tự. Hầu hết, nếu không phải tất cả, nội dung là UTF-8 Unicode.

Sử dụng [AddDefaultCharset](https://httpd.apache.org/docs/current/mod/core.html#adddefaultcharset) để phục vụ tất cả tài nguyên được gán nhãn là `text/html` hoặc `text/plain` với bộ ký tự `UTF-8`.

```apacheconf
<IfModule mod_mime.c>
  AddDefaultCharset utf-8
</IfModule>
```

## Đặt charset cho các kiểu phương tiện cụ thể

Phục vụ các loại tệp sau với tham số `charset` được đặt thành `UTF-8` bằng cách sử dụng chỉ thị [AddCharset](https://httpd.apache.org/docs/current/mod/mod_mime.html#addcharset) có trong `mod_mime`.

```apacheconf
<IfModule mod_mime.c>
  AddCharset utf-8 .appcache \
    .bbaw \
    .css \
    .htc \
    .ics \
    .js \
    .json \
    .manifest \
    .map \
    .markdown \
    .md \
    .mjs \
    .topojson \
    .vtt \
    .vcard \
    .vcf \
    .webmanifest \
    .xloc
</IfModule>
```

## Các chỉ thị `Mod_rewrite` và `RewriteEngine`

[mod_rewrite](https://httpd.apache.org/docs/current/mod/mod_rewrite.html) cung cấp một cách để sửa đổi các yêu cầu URL đến, một cách động, dựa trên các quy tắc biểu thức chính quy. Điều này cho phép bạn ánh xạ các URL tùy ý vào cấu trúc URL nội bộ của bạn theo bất kỳ cách nào bạn muốn.

Nó hỗ trợ số lượng quy tắc không giới hạn và số lượng điều kiện quy tắc đính kèm không giới hạn cho mỗi quy tắc để cung cấp một cơ chế thao tác URL thực sự linh hoạt và mạnh mẽ. Các thao tác URL có thể phụ thuộc vào nhiều bài kiểm tra khác nhau: biến máy chủ, biến môi trường, tiêu đề HTTP, dấu thời gian, tra cứu cơ sở dữ liệu ngoài, và nhiều chương trình hoặc trình xử lý bên ngoài khác, có thể được sử dụng để đạt được khớp URL chi tiết.

### Bật `mod_rewrite`

Mẫu cơ bản để bật `mod_rewrite` là điều kiện tiên quyết cho tất cả các tác vụ khác sử dụng nó.

Các bước cần thiết là:

1. Bật công cụ viết lại (điều này là cần thiết để các chỉ thị `RewriteRule` hoạt động) như được ghi lại trong tài liệu [RewriteEngine](https://httpd.apache.org/docs/current/mod/mod_rewrite.html#RewriteEngine)
2. Bật tùy chọn `FollowSymLinks` nếu chưa được bật. Xem tài liệu [Tùy chọn Core](https://httpd.apache.org/docs/current/mod/core.html#options)
3. Nếu nhà cung cấp dịch vụ lưu trữ web của bạn không cho phép tùy chọn `FollowSymlinks`, bạn cần bình luận nó ra hoặc xóa nó, và sau đó bỏ bình luận dòng `Options +SymLinksIfOwnerMatch`, nhưng hãy lưu ý đến [tác động hiệu suất](https://httpd.apache.org/docs/current/misc/perf-tuning.html#symlinks)
   - Một số dịch vụ lưu trữ đám mây sẽ yêu cầu bạn đặt `RewriteBase`
   - Xem [Câu hỏi thường gặp Rackspace](https://web.archive.org/web/20151223141222/http://www.rackspace.com/knowledge_center/frequently-asked-question/why-is-modrewrite-not-working-on-my-site) và [tài liệu HTTPD](https://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewritebase)
   - Tùy thuộc vào cách máy chủ của bạn được thiết lập, bạn cũng có thể cần sử dụng chỉ thị [`RewriteOptions`](https://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewriteoptions) để bật một số tùy chọn cho công cụ viết lại

```apacheconf
<IfModule mod_rewrite.c>
  RewriteEngine On
  Options +FollowSymlinks
  # Options +SymLinksIfOwnerMatch
  # RewriteBase /
  # RewriteOptions <options>
</IfModule>
```

### Bắt buộc HTTPS

Các quy tắc Rewrite này sẽ chuyển hướng từ phiên bản `http://` không an toàn sang phiên bản `https://` an toàn của URL như được mô tả trong [wiki Apache HTTPD](https://cwiki.apache.org/confluence/display/httpd/RewriteHTTPToHTTPS).

```apacheconf
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]
</IfModule>
```

Nếu bạn đang sử dụng phương pháp webroot cPanel AutoSSL hoặc Let's Encrypt để tạo chứng chỉ TLS của bạn, nó sẽ không xác thực được chứng chỉ nếu các yêu cầu xác thực được chuyển hướng sang HTTPS. Bật điều kiện bạn cần.

```apacheconf
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteCond %{REQUEST_URI} !^/\.well-known/acme-challenge/
  RewriteCond %{REQUEST_URI} !^/\.well-known/cpanel-dcv/[\w-]+$
  RewriteCond %{REQUEST_URI} !^/\.well-known/pki-validation/[A-F0-9]{32}\.txt(?:\ Comodo\ DCV)?$
  RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
</IfModule>
```

### Chuyển hướng từ URL `www.`

Các chỉ thị này sẽ viết lại `www.example.com` thành `example.com`.

Bạn không nên có cùng nội dung ở nhiều nguồn gốc (có và không có www). Điều này có thể gây ra các vấn đề SEO (nội dung trùng lặp), và do đó, bạn nên chọn một trong các lựa chọn thay thế và chuyển hướng cái còn lại. Bạn cũng nên sử dụng [Canonical URLs](https://www.semrush.com/blog/canonical-url-guide/) để chỉ ra URL nào các công cụ tìm kiếm nên thu thập (nếu chúng hỗ trợ tính năng).

Đặt biến `%{ENV:PROTO}`, để cho phép các viết lại chuyển hướng với giao thức thích hợp tự động (`http` hoặc `https`).

Quy tắc mặc định giả định rằng cả hai môi trường HTTP và HTTPS đều khả dụng để chuyển hướng.

```apacheconf
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTPS} =on
  RewriteRule ^ - [E=PROTO:https]
  RewriteCond %{HTTPS} !=on
  RewriteRule ^ - [E=PROTO:http]

  RewriteCond %{HTTP_HOST} ^www\.(.+)$ [NC]
  RewriteRule ^ %{ENV:PROTO}://%1%{REQUEST_URI} [R=301,L]
</IfModule>
```

### Chèn `www.` vào đầu URL

Các quy tắc này sẽ chèn `www.` vào đầu URL. Điều quan trọng cần lưu ý là bạn không bao giờ nên cung cấp cùng nội dung dưới hai URL khác nhau.

Điều này có thể gây ra các vấn đề SEO (nội dung trùng lặp), và do đó, bạn nên chọn một trong các lựa chọn thay thế và chuyển hướng cái còn lại. Đối với các công cụ tìm kiếm hỗ trợ chúng, bạn nên sử dụng [Canonical URLs](https://www.semrush.com/blog/canonical-url-guide/) để chỉ ra URL nào các công cụ tìm kiếm nên thu thập.

Đặt biến `%{ENV:PROTO}`, để cho phép các viết lại chuyển hướng với giao thức thích hợp tự động (`http` hoặc `https`).

Quy tắc mặc định giả định rằng cả hai môi trường HTTP và HTTPS đều khả dụng để chuyển hướng. Nếu chứng chỉ TLS của bạn không thể xử lý một trong các miền được sử dụng trong quá trình chuyển hướng, bạn nên bật điều kiện.

Điều sau có thể không phải là ý tưởng hay nếu bạn sử dụng các tên miền phụ "thực sự" cho các phần nhất định của trang web của bạn.

```apacheconf
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTPS} =on
  RewriteRule ^ - [E=PROTO:https]
  RewriteCond %{HTTPS} !=on
  RewriteRule ^ - [E=PROTO:http]

  RewriteCond %{HTTPS} !=on

  RewriteCond %{HTTP_HOST} !^www\. [NC]
  RewriteCond %{SERVER_ADDR} !=127.0.0.1
  RewriteCond %{SERVER_ADDR} !=::1
  RewriteRule ^ %{ENV:PROTO}://www.%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
</IfModule>
```

## Tùy chọn frame

Ví dụ dưới đây gửi tiêu đề phản hồi `X-Frame-Options` với DENY làm giá trị, thông báo cho các trình duyệt không hiển thị nội dung của trang web trong bất kỳ frame nào để bảo vệ trang web khỏi các cuộc tấn công [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking).

Đây có thể không phải là cài đặt tốt nhất cho mọi người. Bạn nên đọc về [hai giá trị có thể khác cho tiêu đề `X-Frame-Options`](https://datatracker.ietf.org/doc/html/rfc7034#section-2.1): `SAMEORIGIN` và `ALLOW-FROM`.

Mặc dù bạn có thể gửi tiêu đề `X-Frame-Options` cho tất cả các trang của trang web của bạn, điều này có nhược điểm tiềm ẩn là nó cấm thậm chí bất kỳ việc đóng khung nội dung của bạn (ví dụ: khi người dùng truy cập trang web của bạn bằng trang kết quả Google Image Search).

Tuy nhiên, bạn nên đảm bảo rằng bạn gửi tiêu đề `X-Frame-Options` cho tất cả các trang cho phép người dùng thực hiện một thao tác thay đổi trạng thái (ví dụ: các trang chứa liên kết mua một cú nhấp, thanh toán, hoặc các trang xác nhận chuyển tiền ngân hàng, các trang thực hiện thay đổi cấu hình vĩnh viễn, v.v.).

```apacheconf
<IfModule mod_headers.c>
  Header always set X-Frame-Options "DENY" "expr=%{CONTENT_TYPE} =~ m#text/html#i"
</IfModule>
```

## Chính sách bảo mật nội dung (CSP)

[CSP (Chính sách bảo mật nội dung)](https://content-security-policy.com/) giảm thiểu nguy cơ của cross-site scripting và các cuộc tấn công tiêm nội dung khác bằng cách đặt `Chính sách bảo mật nội dung` cho phép các nguồn nội dung đáng tin cậy cho trang web của bạn.

Không có chính sách phù hợp với tất cả các trang web, ví dụ dưới đây được thiết kế như hướng dẫn để bạn sửa đổi cho trang web của mình.

Để triển khai CSP của bạn dễ dàng hơn, bạn có thể sử dụng [trình tạo tiêu đề CSP](https://report-uri.com/home/generate/) trực tuyến. Bạn cũng nên sử dụng [trình xác thực](https://csp-evaluator.withgoogle.com/) để đảm bảo tiêu đề của bạn làm những gì bạn muốn nó làm.

```apacheconf
<IfModule mod_headers.c>
  Content-Security-Policy "default-src 'self'; base-uri 'none'; form-action 'self'; frame-ancestors 'none'; upgrade-insecure-requests" "expr=%{CONTENT_TYPE} =~ m#text\/(html|javascript)|application\/pdf|xml#i"
</IfModule>
```

CSP này:

1. Hạn chế tất cả các fetch theo mặc định về nguồn gốc của trang web hiện tại bằng cách đặt chỉ thị `default-src` thành `'self'` - đây hoạt động như dự phòng cho tất cả [Chỉ thị Fetch](/en-US/docs/Glossary/Fetch_directive).
   - Điều này thuận tiện vì bạn không phải chỉ định tất cả các Chỉ thị Fetch áp dụng cho trang web của mình, ví dụ: `connect-src 'self'; font-src 'self'; script-src 'self'; style-src 'self'`, v.v.
   - Hạn chế này cũng có nghĩa là bạn phải xác định rõ ràng từ (các) trang web nào trang web của bạn được phép tải tài nguyên. Nếu không, nó sẽ bị hạn chế về cùng nguồn gốc với trang đang thực hiện yêu cầu

2. Không cho phép phần tử `<base>` trên trang web. Điều này để ngăn chặn những kẻ tấn công thay đổi vị trí của các tài nguyên được tải từ các URL tương đối
   - Nếu bạn muốn sử dụng phần tử `<base>`, hãy sử dụng `base-uri 'self'` thay thế

3. Chỉ cho phép các form được gửi từ nguồn gốc hiện tại với: `form-action 'self'`
4. Ngăn chặn tất cả các trang web (bao gồm cả trang web của riêng bạn) nhúng trang web của bạn trong ví dụ: phần tử `<iframe>` hoặc `<object>` bằng cách đặt: `frame-ancestors 'none'`.
   - Chỉ thị `frame-ancestors` giúp tránh các cuộc tấn công [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) và tương tự tiêu đề `X-Frame-Options`
   - Các trình duyệt hỗ trợ tiêu đề CSP sẽ bỏ qua `X-Frame-Options` nếu `frame-ancestors` cũng được chỉ định

5. Buộc trình duyệt xử lý tất cả tài nguyên được phục vụ qua HTTP như thể chúng được tải an toàn qua HTTPS bằng cách đặt chỉ thị `upgrade-insecure-requests`
   - **`upgrade-insecure-requests` không đảm bảo HTTPS cho điều hướng cấp độ cao nhất. Nếu bạn muốn buộc trang web tự nó được tải qua HTTPS, bạn phải bao gồm tiêu đề `Strict-Transport-Security`**

6. Bao gồm tiêu đề `Content-Security-Policy` trong tất cả các phản hồi có thể thực thi script. Điều này bao gồm các loại tệp thường dùng: tài liệu HTML, XML và PDF. Mặc dù các tệp JavaScript không thể thực thi script trong "ngữ cảnh duyệt web", chúng được bao gồm để nhắm mục tiêu vào [web workers](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#csp_in_workers)

## Quyền truy cập thư mục

Chỉ thị này sẽ ngăn truy cập vào các thư mục không có tệp chỉ mục có trong bất kỳ định dạng nào mà máy chủ được cấu hình để sử dụng, như `index.html`, hoặc `index.php`.

```apacheconf
<IfModule mod_autoindex.c>
    Options -Indexes
</IfModule>
```

## Chặn quyền truy cập vào các tệp và thư mục ẩn

Trong các hệ thống Macintosh và Linux, các tệp bắt đầu bằng dấu chấm bị ẩn khỏi tầm nhìn nhưng không phải khỏi quyền truy cập nếu bạn biết tên và vị trí của chúng. Các loại tệp này thường chứa tùy chọn người dùng hoặc trạng thái được bảo toàn của một tiện ích, và có thể bao gồm các nơi khá riêng tư như, ví dụ, các thư mục `.git` hoặc `.svn`.

Thư mục `.well-known/` đại diện cho [tiêu chuẩn (RFC 5785)](https://datatracker.ietf.org/doc/html/rfc5785) tiền tố đường dẫn cho "các vị trí được biết đến rộng rãi" (ví dụ: `/.well-known/manifest.json`, `/.well-known/keybase.txt`), và do đó, quyền truy cập vào nội dung hiển thị của nó không nên bị chặn.

```apacheconf
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_URI} "!(^|/)\.well-known/([^./]+./?)+$" [NC]
    RewriteCond %{SCRIPT_FILENAME} -d [OR]
    RewriteCond %{SCRIPT_FILENAME} -f
    RewriteRule "(^|/)\." - [F]
</IfModule>
```

## Chặn quyền truy cập vào các tệp có thông tin nhạy cảm

Chặn quyền truy cập vào các tệp sao lưu và tệp nguồn có thể bị để lại bởi một số trình soạn thảo văn bản và có thể gây ra rủi ro bảo mật khi ai đó có quyền truy cập vào chúng.

Cập nhật biểu thức chính quy `<FilesMatch>` trong ví dụ sau để bao gồm bất kỳ tệp nào có thể kết thúc trên máy chủ sản xuất của bạn và có thể tiết lộ thông tin nhạy cảm về trang web của bạn. Các tệp này có thể bao gồm các tệp cấu hình hoặc các tệp chứa siêu dữ liệu về dự án, trong số các tệp khác.

```apacheconf
<IfModule mod_authz_core.c>
  <FilesMatch "(^#.*#|\.(bak|conf|dist|fla|in[ci]|log|orig|psd|sh|sql|sw[op])|~)$">
    Require all denied
  </FilesMatch>
</IfModule>
```

## HTTP Strict Transport Security (HSTS)

Nếu người dùng nhập `example.com` trong trình duyệt của họ, ngay cả khi máy chủ chuyển hướng họ đến phiên bản an toàn của trang web, điều đó vẫn tạo ra một cửa sổ cơ hội (kết nối HTTP ban đầu) cho kẻ tấn công hạ cấp hoặc chuyển hướng yêu cầu.

Tiêu đề sau đây đảm bảo rằng trình duyệt chỉ kết nối với máy chủ của bạn qua HTTPS, bất kể những gì người dùng nhập vào thanh địa chỉ của trình duyệt.

Hãy lưu ý rằng Strict Transport Security không thể thu hồi, và bạn phải đảm bảo có thể phục vụ trang web qua HTTPS miễn là bạn đã chỉ định trong chỉ thị `max-age`. Nếu bạn không còn có kết nối TLS hợp lệ nữa (ví dụ: do chứng chỉ TLS hết hạn), khách truy cập của bạn sẽ thấy thông báo lỗi ngay cả khi cố gắng kết nối qua HTTP.

```apacheconf
<IfModule mod_headers.c>
  # Header always set
  Strict-Transport-Security "max-age=16070400; includeSubDomains" "expr=%{HTTPS} == 'on'"
  # (1) Enable your site for HSTS preload inclusion.
  # Header always set
  Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" "expr=%{HTTPS} == 'on'"
</IfModule>
```

## Ngăn chặn một số trình duyệt MIME-sniffing phản hồi

Một số trình duyệt cũ hơn sẽ cố gắng đoán kiểu nội dung của tài nguyên, ngay cả khi nó không được thiết lập đúng trên cấu hình máy chủ. Điều này giảm thiểu tiếp xúc với các cuộc tấn công tải xuống drive-by và rò rỉ dữ liệu cross-origin.

```apacheconf
<IfModule mod_headers.c>
    Header always set X-Content-Type-Options "nosniff"
</IfModule>
```

## Chính sách Referrer

Chúng ta bao gồm tiêu đề `Referrer-Policy` trong các phản hồi cho các tài nguyên có thể yêu cầu (hoặc điều hướng đến) các tài nguyên khác.

Điều này bao gồm các loại tài nguyên thường dùng: HTML, CSS, XML/SVG, tài liệu PDF, script, và worker.

Để ngăn rò rỉ referrer hoàn toàn, hãy chỉ định giá trị `no-referrer` thay thế. Lưu ý rằng hiệu quả có thể ảnh hưởng tiêu cực đến các công cụ phân tích.

Sử dụng các dịch vụ như những dịch vụ dưới đây để kiểm tra `Referrer-Policy` của bạn:

- [HTTP Observatory](/en-US/observatory)
- [securityheaders.com](https://securityheaders.com/)

```apacheconf
<IfModule mod_headers.c>
  Header always set Referrer-Policy "strict-origin-when-cross-origin" "expr=%{CONTENT_TYPE} =~ m#text\/(css|html|javascript)|application\/pdf|xml#i"
</IfModule>
```

## Vô hiệu hóa phương thức HTTP `TRACE`

Phương thức [TRACE](/en-US/docs/Web/HTTP/Reference/Methods/TRACE), mặc dù có vẻ vô hại, có thể được tận dụng thành công trong một số tình huống để đánh cắp thông tin xác thực hợp lệ của người dùng. Xem [Cuộc tấn công Cross-Site Tracing (XST)](https://owasp.org/www-community/attacks/Cross_Site_Tracing) và [Hướng dẫn kiểm thử bảo mật web OWASP](https://owasp.org/www-project-web-security-testing-guide/v41/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/06-Test_HTTP_Methods#test-xst-potential)

Các trình duyệt hiện đại hiện ngăn các yêu cầu TRACE được thực hiện qua JavaScript, tuy nhiên, các cách khác để gửi yêu cầu TRACE với trình duyệt đã được phát hiện, chẳng hạn như sử dụng Java.

Nếu bạn có quyền truy cập vào tệp cấu hình máy chủ chính, hãy sử dụng chỉ thị [`TraceEnable`](https://httpd.apache.org/docs/current/mod/core.html#traceenable) thay thế.

```apacheconf
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{REQUEST_METHOD} ^TRACE [NC]
  RewriteRule .* - [R=405,L]
</IfModule>
```

## Xóa tiêu đề phản hồi `X-Powered-By`

Một số framework như PHP và ASP.NET đặt tiêu đề `X-Powered-By` chứa thông tin về chúng (ví dụ: tên, số phiên bản)

Tiêu đề này không cung cấp bất kỳ giá trị nào, và trong một số trường hợp, thông tin nó cung cấp có thể tiết lộ các lỗ hổng.

```apacheconf
<IfModule mod_headers.c>
  Header unset X-Powered-By
  Header always unset X-Powered-By
</IfModule>
```

Nếu có thể, bạn nên vô hiệu hóa tiêu đề `X-Powered-By` từ cấp độ ngôn ngữ/framework (ví dụ: đối với PHP, bạn có thể làm điều đó bằng cách đặt giá trị sau trong `php.ini`.

```ini
expose_php = off;
```

## Xóa chân trang thông tin máy chủ do Apache tạo ra

Ngăn Apache thêm dòng chân trang chứa thông tin về máy chủ vào các tài liệu do máy chủ tạo (ví dụ: thông báo lỗi, danh sách thư mục, v.v.). Xem tài liệu [Chỉ thị `ServerSignature`](https://httpd.apache.org/docs/current/mod/core.html#serversignature) để biết thêm thông tin về những gì chữ ký máy chủ cung cấp và [Chỉ thị `ServerTokens`](https://httpd.apache.org/docs/current/mod/core.html#servertokens) để biết thông tin về cấu hình thông tin được cung cấp trong chữ ký.

```apacheconf
ServerSignature Off
```

## Sửa các tiêu đề `AcceptEncoding` bị hỏng

Một số máy chủ proxy và phần mềm bảo mật làm hỏng hoặc loại bỏ tiêu đề HTTP `Accept-Encoding`. Xem [Pushing Beyond Gzipping](https://calendar.perfplanet.com/2010/pushing-beyond-gzipping/) để có giải thích chi tiết hơn.

```apacheconf
<IfModule mod_deflate.c>
  <IfModule mod_setenvif.c>
    <IfModule mod_headers.c>
      SetEnvIfNoCase ^(Accept-EncodXng|X-cept-Encoding|X{15}|~{15}|-{15})$ ^((gzip|deflate)\s*,?\s*)+|[X~-]{4,13}$ HAVE_Accept-Encoding
      RequestHeader append Accept-Encoding "gzip,deflate" env=HAVE_Accept-Encoding
    </IfModule>
  </IfModule>
</IfModule>
```

## Nén các kiểu phương tiện

Nén tất cả đầu ra được gán nhãn với một trong các kiểu phương tiện sau bằng cách sử dụng [Chỉ thị AddOutputFilterByType](https://httpd.apache.org/docs/current/mod/mod_filter.html#addoutputfilterbytype).

```apacheconf
<IfModule mod_deflate.c>
  <IfModule mod_filter.c>
    AddOutputFilterByType DEFLATE "application/atom+xml" \
      "application/javascript" \
      "application/json" \
      "application/ld+json" \
      "application/manifest+json" \
      "application/rdf+xml" \
      "application/rss+xml" \
      "application/schema+json" \
      "application/geo+json" \
      "application/vnd.ms-fontobject" \
      "application/wasm" \
      "application/x-font-ttf" \
      "application/x-javascript" \
      "application/x-web-app-manifest+json" \
      "application/xhtml+xml" \
      "application/xml" \
      "font/eot" \
      "font/opentype" \
      "font/otf" \
      "font/ttf" \
      "image/bmp" \
      "image/svg+xml" \
      "image/vnd.microsoft.icon" \
      "text/cache-manifest" \
      "text/calendar" \
      "text/css" \
      "text/html" \
      "text/javascript" \
      "text/plain" \
      "text/markdown" \
      "text/vcard" \
      "text/vnd.rim.location.xloc" \
      "text/vtt" \
      "text/x-component" \
      "text/x-cross-domain-policy" \
      "text/xml"
  </IfModule>
</IfModule>
```

## Ánh xạ phần mở rộng sang kiểu phương tiện

Ánh xạ các phần mở rộng tên tệp sau sang kiểu mã hóa được chỉ định bằng cách sử dụng [AddEncoding](https://httpd.apache.org/docs/current/mod/mod_mime.html#addencoding) để Apache có thể phục vụ các loại tệp với tiêu đề phản hồi `Content-Encoding` thích hợp (điều này KHÔNG làm cho Apache nén chúng!). Nếu các loại tệp này được phục vụ mà không có tiêu đề phản hồi `Content-Encoding` thích hợp, các ứng dụng khách (ví dụ: trình duyệt) sẽ không biết rằng họ cần giải nén phản hồi trước tiên, và do đó, sẽ không thể hiểu nội dung.

```apacheconf
<IfModule mod_deflate.c>
  <IfModule mod_mime.c>
    AddEncoding gzip svgz
  </IfModule>
</IfModule>
```

## Hết hạn bộ nhớ đệm

Phục vụ tài nguyên với ngày hết hạn trong tương lai xa bằng cách sử dụng mô-đun [mod_expires](https://httpd.apache.org/docs/current/mod/mod_expires.html), và các tiêu đề [Cache-Control](/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control) và [Expires](/en-US/docs/Web/HTTP/Reference/Headers/Expires).

```apacheconf
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresDefault                                      "access plus 1 month"

  # CSS
    ExpiresByType text/css                              "access plus 1 year"
  # Data interchange
    ExpiresByType application/atom+xml                  "access plus 1 hour"
    ExpiresByType application/rdf+xml                   "access plus 1 hour"
    ExpiresByType application/rss+xml                   "access plus 1 hour"
    ExpiresByType application/json                      "access plus 0 seconds"
    ExpiresByType application/ld+json                   "access plus 0 seconds"
    ExpiresByType application/schema+json               "access plus 0 seconds"
    ExpiresByType application/geo+json                  "access plus 0 seconds"
    ExpiresByType application/xml                       "access plus 0 seconds"
    ExpiresByType text/calendar                         "access plus 0 seconds"
    ExpiresByType text/xml                              "access plus 0 seconds"
  # Favicon (cannot be renamed!) and cursor images
    ExpiresByType image/vnd.microsoft.icon              "access plus 1 week"
    ExpiresByType image/x-icon                          "access plus 1 week"
  # HTML
    ExpiresByType text/html                             "access plus 0 seconds"
  # JavaScript
    ExpiresByType text/javascript                       "access plus 1 year"
  # Manifest files
    ExpiresByType application/manifest+json             "access plus 1 week"
    ExpiresByType application/x-web-app-manifest+json   "access plus 0 seconds"
    ExpiresByType text/cache-manifest                   "access plus 0 seconds"
  # Markdown
    ExpiresByType text/markdown                         "access plus 0 seconds"
  # Media files
    ExpiresByType audio/ogg                             "access plus 1 month"
    ExpiresByType image/bmp                             "access plus 1 month"
    ExpiresByType image/gif                             "access plus 1 month"
    ExpiresByType image/jpeg                            "access plus 1 month"
    ExpiresByType image/svg+xml                         "access plus 1 month"
    ExpiresByType image/webp                            "access plus 1 month"
    # PNG and animated PNG
    ExpiresByType image/apng                            "access plus 1 month"
    ExpiresByType image/png                             "access plus 1 month"
    # HEIF Images
    ExpiresByType image/heic                            "access plus 1 month"
    ExpiresByType image/heif                            "access plus 1 month"
    # HEIF Image Sequence
    ExpiresByType image/heics                           "access plus 1 month"
    ExpiresByType image/heifs                           "access plus 1 month"
    # AVIF Images
    ExpiresByType image/avif                            "access plus 1 month"
    # AVIF Image Sequence
    ExpiresByType image/avis                            "access plus 1 month"
    ExpiresByType video/mp4                             "access plus 1 month"
    ExpiresByType video/ogg                             "access plus 1 month"
    ExpiresByType video/webm                            "access plus 1 month"
  # WebAssembly
    ExpiresByType application/wasm                      "access plus 1 year"
  # Web fonts
    # Collection
    ExpiresByType font/collection                       "access plus 1 month"
    # Embedded OpenType (EOT)
    ExpiresByType application/vnd.ms-fontobject         "access plus 1 month"
    ExpiresByType font/eot                              "access plus 1 month"
    # OpenType
    ExpiresByType font/opentype                         "access plus 1 month"
    ExpiresByType font/otf                              "access plus 1 month"
    # TrueType
    ExpiresByType application/x-font-ttf                "access plus 1 month"
    ExpiresByType font/ttf                              "access plus 1 month"
    # Web Open Font Format (WOFF) 1.0
    ExpiresByType application/font-woff                 "access plus 1 month"
    ExpiresByType application/x-font-woff               "access plus 1 month"
    ExpiresByType font/woff                             "access plus 1 month"
    # Web Open Font Format (WOFF) 2.0
    ExpiresByType application/font-woff2                "access plus 1 month"
    ExpiresByType font/woff2                            "access plus 1 month"
  # Other
    ExpiresByType text/x-cross-domain-policy            "access plus 1 week"
</IfModule>
```
