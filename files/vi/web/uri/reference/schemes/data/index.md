---
title: "data: URLs"
short-title: "data:"
slug: Web/URI/Reference/Schemes/data
page-type: uri-scheme
browser-compat: http.data-url
sidebar: urlsidebar
---

**Data URL**, tức các URL có tiền tố bằng scheme `data:`, cho phép người tạo nội dung nhúng các tệp nhỏ trực tiếp trong tài liệu. Chúng trước đây được gọi là "data URIs" cho đến khi tên đó bị WHATWG ngừng sử dụng.

> [!NOTE]
> Các Data URL được các trình duyệt hiện đại xem là các origin opaque duy nhất, thay vì kế thừa origin của đối tượng thiết lập chịu trách nhiệm cho điều hướng.

## Cú pháp

```url
data:[<media-type>][;base64],<data>
```

- `data:`
  - : Scheme của URL.
- `<media-type>` {{optional_inline}}
  - : [MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) cho biết kiểu dữ liệu, chẳng hạn `image/jpeg` cho một tệp ảnh JPEG. Nếu bỏ qua, mặc định là `text/plain;charset=US-ASCII`. Bạn có thể xem [phân tích đầy đủ về cấu trúc MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) và [bảng các MIME type phổ biến trên web](/en-US/docs/Web/HTTP/Guides/MIME_types/Common_types).
- `;base64` {{optional_inline}}
  - : Cho biết dữ liệu nên được giải mã base64; xem [mã hóa dữ liệu sang định dạng base64](#encoding_data_into_base64_format).
- `<data>`
  - : Bản thân dữ liệu. Nếu dữ liệu chứa [các ký tự được định nghĩa trong RFC 3986 là ký tự dành riêng](https://datatracker.ietf.org/doc/html/rfc3986#section-2.2), hoặc chứa ký tự khoảng trắng, ký tự xuống dòng, hay các ký tự không in được khác, thì những ký tự đó phải được {{Glossary("Percent-encoding", "percent-encoded")}}. Nếu dữ liệu là văn bản, bạn có thể nhúng văn bản đó (dùng các entity hoặc escape phù hợp dựa trên kiểu của tài liệu bao ngoài). Nếu không, bạn có thể chỉ định `base64` để nhúng dữ liệu nhị phân đã được mã hóa base64.

Một vài ví dụ:

- `data:,Hello%2C%20World%21`
  - : Dữ liệu `text/plain` là `Hello, World!`. Lưu ý dấu phẩy được {{Glossary("Percent-encoding", "percent-encoded")}} thành `%2C`, và ký tự khoảng trắng thành `%20`.
- `data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==`
  - : Phiên bản base64 của ví dụ trên
- `data:text/html,%3Ch1%3EHello%2C%20World%21%3C%2Fh1%3E`
  - : Một tài liệu HTML với `<h1>Hello, World!</h1>`
- `data:text/html,%3Cscript%3Ealert%28%27hi%27%29%3B%3C%2Fscript%3E`
  - : Một tài liệu HTML với `<script>alert('hi');</script>` thực thi một JavaScript alert. Lưu ý rằng thẻ đóng script là bắt buộc.

## Mã hóa dữ liệu sang định dạng base64

Base64 là một nhóm các sơ đồ mã hóa nhị phân sang văn bản, biểu diễn dữ liệu nhị phân trong một chuỗi {{Glossary("ASCII")}} bằng cách chuyển nó sang biểu diễn radix-64. Vì nó chỉ bao gồm các ký tự được phép bởi cú pháp URL ("an toàn cho URL"), chúng ta có thể mã hóa an toàn dữ liệu nhị phân trong Data URL. Base64 dùng các ký tự `+` và `/`, vốn có thể có ý nghĩa đặc biệt trong URL. Vì Data URL không có các phân đoạn đường dẫn hay tham số truy vấn, cách mã hóa này là an toàn trong ngữ cảnh này.

### Mã hóa trong JavaScript

Các Web API có sẵn các phương thức gốc để mã hóa hoặc giải mã sang base64: [Base64](/en-US/docs/Glossary/Base64).

### Mã hóa trên hệ thống Unix

Mã hóa base64 của một tệp hoặc chuỗi trên Linux và macOS có thể được thực hiện bằng lệnh `base64` của dòng lệnh (hoặc thay thế bằng tiện ích `uuencode` với đối số `-m`).

```bash
echo -n hello|base64
# outputs to console: aGVsbG8=

echo -n hello>a.txt
base64 a.txt
# outputs to console: aGVsbG8=

base64 a.txt>b.txt
# outputs to file b.txt: aGVsbG8=
```

### Mã hóa trên Microsoft Windows

Trên Windows, [Convert.ToBase64String](https://learn.microsoft.com/en-us/dotnet/api/system.convert.tobase64string?view=net-5.0) từ PowerShell có thể được dùng để thực hiện mã hóa Base64:

```plain
[convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("hello"))
# outputs to console: aGVsbG8=
```

Ngoài ra, một shell GNU/Linux (chẳng hạn [WSL](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux)) cung cấp tiện ích `base64`:

```bash
bash$ echo -n hello | base64
# outputs to console: aGVsbG8=
```

## Các vấn đề thường gặp

Phần này mô tả những vấn đề thường xảy ra khi tạo và sử dụng các URL `data`.

```plain
data:text/html,lots of text…<p><span class%3D"bottom">bottom</span>?arg=val</p>
```

Điều này biểu diễn một tài nguyên HTML có nội dung là:

```html
lots of text…
<p><span class="bottom">bottom</span>?arg=val</p>
```

- Cú pháp
  - : Định dạng của URL `data` rất đơn giản, nhưng rất dễ quên đặt dấu phẩy trước đoạn "data", hoặc mã hóa dữ liệu sang định dạng base64 một cách sai.
- Định dạng trong HTML
  - : Một URL `data` cung cấp một tệp bên trong một tệp, điều này có thể rất rộng so với chiều rộng của tài liệu bao ngoài. Là một URL, phần `data` nên có thể được định dạng với khoảng trắng (xuống dòng, tab, hoặc dấu cách), nhưng có các vấn đề thực tế phát sinh [khi dùng mã hóa base64](https://bugzil.la/73026#c12).
- Giới hạn độ dài
  - : Trình duyệt không bắt buộc phải hỗ trợ bất kỳ độ dài tối đa cụ thể nào của dữ liệu.
    Chromium và Firefox giới hạn URL `data` ở mức 512MB, còn Safari (WebKit) giới hạn ở 2048MB.
    Lưu ý rằng Firefox 97 đã tăng giới hạn từ 256KB lên 32MB, và [Firefox 136 đã tăng nó lên 512MB](/en-US/docs/Mozilla/Firefox/Releases/136).
- Thiếu xử lý lỗi
  - : Các tham số không hợp lệ trong media, hoặc lỗi đánh máy khi chỉ định `'base64'`, sẽ bị bỏ qua, nhưng không có lỗi nào được báo.
- Không hỗ trợ chuỗi truy vấn, v.v.
  - : Phần dữ liệu của một data URL là opaque, nên một nỗ lực dùng chuỗi truy vấn (các tham số theo trang, với cú pháp `<url>?parameter-data`) với một data URL sẽ chỉ đưa chuỗi truy vấn vào dữ liệu mà URL đó biểu diễn.
- Vấn đề bảo mật
  - : Một số vấn đề bảo mật (ví dụ, phishing) đã liên quan đến Data URL, và việc điều hướng tới chúng ở cấp cao nhất của trình duyệt. Để giảm thiểu các vấn đề như vậy, điều hướng cấp cao nhất tới các URL `data:` bị chặn trong tất cả các trình duyệt hiện đại. Xem [bài đăng này của Mozilla Security Team](https://blog.mozilla.org/security/2017/11/27/blocking-top-level-navigations-data-urls-firefox-59/) để biết thêm chi tiết.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Glossary("Base64")}}
- {{Glossary("Percent-encoding")}}
- {{domxref("WorkerGlobalScope.atob()", "atob()")}}
- {{domxref("WorkerGlobalScope.btoa()", "btoa()")}}
- CSS {{CSSXref("url_value", "&lt;url&gt;")}}
- {{Glossary("URI")}}
