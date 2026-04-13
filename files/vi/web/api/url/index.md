---
title: URL
slug: Web/API/URL
page-type: web-api-interface
browser-compat: api.URL
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Giao diện **`URL`** được dùng để phân tích, tạo, chuẩn hóa và mã hóa {{glossary("URL", "URL")}}. Nó hoạt động bằng cách cung cấp các thuộc tính cho phép bạn dễ dàng đọc và sửa đổi các thành phần của một URL.

Thông thường, bạn tạo một đối tượng `URL` mới bằng cách chỉ định URL dưới dạng chuỗi khi gọi constructor của nó, hoặc bằng cách cung cấp một URL tương đối và một URL cơ sở. Sau đó bạn có thể dễ dàng đọc các thành phần đã được phân tích của URL hoặc thay đổi URL.

## Constructor

- {{domxref("URL.URL", "URL()")}}
  - : Tạo và trả về một đối tượng `URL` từ một chuỗi URL và một chuỗi URL cơ sở tùy chọn.
    Ném lỗi nếu các đối số được truyền vào không xác định một URL hợp lệ.

## Thuộc tính thể hiện

- {{domxref("URL.hash", "hash")}}
  - : Một chuỗi chứa `"#"` theo sau là định danh phân mảnh của URL.
- {{domxref("URL.host", "host")}}
  - : Một chuỗi chứa domain (tức _hostname_) theo sau bởi, nếu có chỉ định port, một `":"` và _port_ của URL.
- {{domxref("URL.hostname", "hostname")}}
  - : Một chuỗi chứa domain của URL.
- {{domxref("URL.href", "href")}}
  - : Một {{Glossary("stringifier")}} trả về chuỗi chứa toàn bộ URL.
- {{domxref("URL.origin", "origin")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa origin của URL, tức là scheme, domain và port của nó.
- {{domxref("URL.password", "password")}}
  - : Một chuỗi chứa mật khẩu được chỉ định trước tên miền.
- {{domxref("URL.pathname", "pathname")}}
  - : Một chuỗi chứa dấu `'/'` ban đầu theo sau là đường dẫn của URL, không bao gồm query string hoặc fragment.
- {{domxref("URL.port", "port")}}
  - : Một chuỗi chứa số port của URL.
- {{domxref("URL.protocol", "protocol")}}
  - : Một chuỗi chứa scheme giao thức của URL, bao gồm dấu `':'` cuối cùng.
- {{domxref("URL.search", "search")}}
  - : Một chuỗi biểu thị chuỗi tham số của URL; nếu có tham số nào được cung cấp, chuỗi này sẽ bao gồm tất cả chúng, bắt đầu bằng ký tự `?`.
- {{domxref("URL.searchParams", "searchParams")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("URLSearchParams")}} có thể dùng để truy cập các tham số truy vấn riêng lẻ có trong `search`.
- {{domxref("URL.username","username")}}
  - : Một chuỗi chứa tên người dùng được chỉ định trước tên miền.

## Phương thức tĩnh

- {{domxref("URL.canParse_static", "canParse()")}}
  - : Trả về một giá trị boolean cho biết một URL được xác định từ chuỗi URL và chuỗi URL cơ sở tùy chọn có thể phân tích và hợp lệ hay không.
- {{domxref("URL.createObjectURL_static", "createObjectURL()")}}
  - : Trả về một chuỗi chứa một blob URL duy nhất, tức là một URL với `blob:` làm scheme, theo sau là một chuỗi opaque nhận diện duy nhất đối tượng trong trình duyệt.
- {{domxref("URL.parse_static", "parse()")}}
  - : Tạo và trả về một đối tượng `URL` từ một chuỗi URL và chuỗi URL cơ sở tùy chọn, hoặc trả về `null` nếu các tham số được truyền vào xác định một `URL` không hợp lệ.
- {{domxref("URL.revokeObjectURL_static", "revokeObjectURL()")}}
  - : Thu hồi một object URL đã được tạo trước đó bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}.

## Phương thức thể hiện

- {{domxref("URL.toString", "toString()")}}
  - : Trả về một chuỗi chứa toàn bộ URL. Nó là đồng nghĩa với {{domxref("URL.href")}}, dù không thể dùng nó để sửa đổi giá trị.
- {{domxref("URL.toJSON", "toJSON()")}}
  - : Trả về một chuỗi chứa toàn bộ URL. Nó trả về cùng chuỗi với thuộc tính `href`.

## Ghi chú sử dụng

Constructor nhận tham số `url` và một tham số `base` tùy chọn để dùng làm cơ sở nếu tham số `url` là một URL tương đối:

```js
const url = new URL("../cats", "http://www.example.com/dogs");
console.log(url.hostname); // "www.example.com"
console.log(url.pathname); // "/cats"
```

Constructor sẽ ném ngoại lệ nếu URL không thể được phân tích thành một URL hợp lệ.
Bạn có thể gọi đoạn mã trên trong một khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) hoặc dùng phương thức tĩnh {{domxref("URL.canParse_static", "canParse()")}} để kiểm tra trước rằng URL là hợp lệ:

```js
if (URL.canParse("../cats", "http://www.example.com/dogs")) {
  const url = new URL("../cats", "http://www.example.com/dogs");
  console.log(url.hostname); // "www.example.com"
  console.log(url.pathname); // "/cats"
} else {
  console.log("Invalid URL");
}
```

Các thuộc tính của URL có thể được đặt để tạo URL:

```js
url.hash = "tabby";
console.log(url.href); // "http://www.example.com/cats#tabby"
```

URL được mã hóa theo các quy tắc trong {{RFC(3986)}}. Ví dụ:

```js
url.pathname = "démonstration.html";
console.log(url.href); // "http://www.example.com/d%C3%A9monstration.html"
```

Giao diện {{domxref("URLSearchParams")}} có thể dùng để xây dựng và thao tác chuỗi truy vấn của URL.

Để lấy các tham số tìm kiếm từ URL của cửa sổ hiện tại, bạn có thể làm như sau:

```js
// https://some.site/?id=123
const parsedUrl = new URL(window.location.href);
console.log(parsedUrl.searchParams.get("id")); // "123"
```

Phương thức {{domxref("URL.toString", "toString()")}} của `URL` chỉ trả về giá trị của thuộc tính {{domxref("URL.href", "href")}}, vì vậy constructor có thể được dùng để chuẩn hóa và mã hóa một URL trực tiếp.

```js
const response = await fetch(
  new URL("http://www.example.com/démonstration.html"),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `URL` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
- [URL API](/en-US/docs/Web/API/URL_API)
- [URL là gì?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)
- {{domxref("URLSearchParams")}}.
