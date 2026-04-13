---
title: "XMLHttpRequest: phương thức getAllResponseHeaders()"
short-title: getAllResponseHeaders()
slug: Web/API/XMLHttpRequest/getAllResponseHeaders
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.getAllResponseHeaders
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức {{domxref("XMLHttpRequest")}} **`getAllResponseHeaders()`** trả về tất cả các tiêu đề phản hồi, được phân tách bằng {{Glossary('CRLF')}}, dưới dạng chuỗi, hoặc trả về `null` nếu chưa nhận được phản hồi nào.

Nếu có lỗi mạng xảy ra, một chuỗi rỗng được trả về.

> [!NOTE]
> Đối với các yêu cầu nhiều phần (multipart), phương thức này trả về các tiêu đề từ phần _hiện tại_ của yêu cầu, không phải từ kênh ban đầu.

## Cú pháp

```js-nolint
getAllResponseHeaders()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho tất cả các tiêu đề của phản hồi (ngoại trừ những tiêu đề có tên trường là `Set-Cookie`) được phân tách bằng {{Glossary('CRLF')}}, hoặc `null` nếu chưa nhận được phản hồi. Nếu có lỗi mạng xảy ra, một chuỗi rỗng được trả về.

Ví dụ về chuỗi tiêu đề thô:

```http
date: Fri, 08 Dec 2017 21:04:30 GMT\r\n
content-encoding: gzip\r\n
x-content-type-options: nosniff\r\n
server: meinheld/0.6.1\r\n
x-frame-options: DENY\r\n
content-type: text/html; charset=utf-8\r\n
connection: keep-alive\r\n
strict-transport-security: max-age=63072000\r\n
vary: Cookie, Accept-Encoding\r\n
content-length: 6502\r\n
x-xss-protection: 1; mode=block\r\n
```

Mỗi dòng được kết thúc bằng cả ký tự carriage return và line feed (`\r\n`). Về cơ bản đây là các dấu phân tách từng tiêu đề.

> [!NOTE]
> Trong các trình duyệt hiện đại, tên tiêu đề được trả về dưới dạng chữ thường, theo đặc tả mới nhất.

## Ví dụ

Ví dụ này kiểm tra các tiêu đề trong sự kiện {{domxref("XMLHttpRequest/readystatechange_event", "readystatechange")}} của yêu cầu. Mã nguồn cho thấy cách lấy chuỗi tiêu đề thô, cũng như cách chuyển đổi nó thành một mảng các tiêu đề riêng lẻ và sau đó tạo một ánh xạ từ tên tiêu đề đến giá trị của chúng.

```js
const request = new XMLHttpRequest();
request.open("GET", "foo.txt", true);
request.send();

request.onreadystatechange = () => {
  if (request.readyState === request.HEADERS_RECEIVED) {
    // Lấy chuỗi tiêu đề thô
    const headers = request.getAllResponseHeaders();

    // Chuyển đổi chuỗi tiêu đề thành một mảng
    // các tiêu đề riêng lẻ
    const arr = headers.trim().split(/[\r\n]+/);

    // Tạo một ánh xạ từ tên tiêu đề đến giá trị
    const headerMap = {};
    arr.forEach((line) => {
      const parts = line.split(": ");
      const header = parts.shift();
      const value = parts.join(": ");
      headerMap[header] = value;
    });
  }
};
```

Sau khi hoàn tất, bạn có thể, ví dụ:

```js
const contentType = headerMap["content-type"];
```

Điều này lấy giá trị của tiêu đề {{httpheader("Content-Type")}} vào biến `contentType`.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- Thiết lập tiêu đề yêu cầu: {{domxref("XMLHttpRequest.setRequestHeader", "setRequestHeader()")}}
