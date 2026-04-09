---
title: URI schemes
short-title: Scheme
slug: Web/URI/Reference/Schemes
page-type: uri-component
spec-urls: https://www.rfc-editor.org/rfc/rfc3986.html#section-3.1
sidebar: urlsidebar
---

**Scheme** của một URI là phần đầu tiên của URI, nằm trước ký tự `:`. Nó cho biết trình duyệt phải dùng giao thức nào để lấy tài nguyên. Scheme có thể ảnh hưởng đến cách phần còn lại của URI được cấu trúc và diễn giải.

## Cú pháp

```url
protocol:
```

- `protocol`
  - : Một chuỗi ký tự xác định giao thức cần dùng. Nó chỉ nên gồm các ký tự chữ và số cùng với các ký tự `+`, `-`, và `.`. Các scheme phổ biến gồm:
    - [`blob`](/en-US/docs/Web/URI/Reference/Schemes/blob)
      - : Binary Large Object; một con trỏ tới một đối tượng lớn nằm trong bộ nhớ
    - [`data`](/en-US/docs/Web/URI/Reference/Schemes/data)
      - : Dữ liệu được nhúng trực tiếp trong URL
    - `file`
      - : Tên tệp phụ thuộc vào máy chủ
    - `ftp`
      - : {{Glossary("FTP","File Transfer Protocol")}}
    - `http` / `https`
      - : [Hypertext Transfer Protocol](/en-US/docs/Web/HTTP) (và các kết nối an toàn)
    - [`javascript`](/en-US/docs/Web/URI/Reference/Schemes/javascript)
      - : Mã JavaScript nhúng trong URL
    - `mailto`
      - : Địa chỉ thư điện tử
    - [`resource`](/en-US/docs/Web/URI/Reference/Schemes/resource) {{Non-standard_inline}}
      - : Dùng cho Firefox và các tiện ích mở rộng của Firefox để tải tài nguyên nội bộ
    - `ssh`
      - : Secure shell
    - `tel`
      - : Điện thoại
    - [`urn`](/en-US/docs/Web/URI/Reference/Schemes/urn)
      - : Tên tài nguyên thống nhất
    - `view-source`
      - : Mã nguồn của tài nguyên
    - `ws` / `wss`
      - : [Kết nối WebSocket](/en-US/docs/Web/API/WebSockets_API) (và các kết nối an toàn)

## Mô tả

Hãy xem URL sau:

```url
http://www.example.com:80/path/to/myfile.html?key1=value1&key2=value2#SomewhereInTheDocument
```

`http` là _scheme_ của URL, cho biết giao thức nào trình duyệt phải dùng. Thông thường đó là giao thức HTTP hoặc phiên bản an toàn của nó, HTTPS. Web yêu cầu `http` hoặc `https`, nhưng trình duyệt có thể mở các URI với các scheme khác, như những URI bắt đầu bằng `mailto:` (để mở ứng dụng thư) hoặc `ftp:` (truyền tệp).

Khi dùng URL trong nội dung {{Glossary("HTML")}}, bạn thường chỉ dùng một vài trong số các URL scheme này. Khi tham chiếu đến subresource, tức là các tệp được tải như một phần của tài liệu lớn hơn, bạn chỉ nên dùng scheme HTTP và HTTPS. Ngày càng nhiều trình duyệt loại bỏ hỗ trợ dùng FTP để tải subresource, vì lý do bảo mật.

FTP vẫn được chấp nhận ở cấp cao nhất, chẳng hạn khi được nhập trực tiếp vào thanh địa chỉ của trình duyệt hoặc là đích của một liên kết, mặc dù một số trình duyệt có thể chuyển việc tải nội dung FTP sang một ứng dụng khác.

## Ví dụ

### Các URI scheme khác nhau

Ví dụ sau cho thấy các định dạng URI khác nhau dựa trên scheme của URI.

```url
tel:+1-816-555-1212
git@github.com:mdn/browser-compat-data.git
ftp://example.org/resource.txt
urn:isbn:9780141036144
mailto:help@supercyberhelpdesk.info
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
- [Data URLs](/en-US/docs/Web/URI/Reference/Schemes/data)
- [Resource URLs](/en-US/docs/Web/URI/Reference/Schemes/resource)
- [Danh sách IANA các URI schemes](https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml)
