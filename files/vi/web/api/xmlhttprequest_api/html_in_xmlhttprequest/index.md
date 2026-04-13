---
title: HTML in XMLHttpRequest
slug: Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest
page-type: guide
browser-compat: api.XMLHttpRequest
---

{{DefaultAPISidebar("XMLHttpRequest API")}}

Đặc tả {{domxref("XMLHttpRequest")}} của W3C bổ sung hỗ trợ phân tích [HTML](/en-US/docs/Web/HTML) cho {{domxref("XMLHttpRequest")}}, vốn ban đầu chỉ hỗ trợ phân tích {{Glossary("XML")}}. Tính năng này cho phép ứng dụng web nhận một tài nguyên HTML dưới dạng một {{Glossary("DOM")}} đã được phân tích bằng `XMLHttpRequest`.

Để có cái nhìn tổng quan về cách dùng `XMLHttpRequest` nói chung, hãy xem [Using XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest).

## Hạn chế

Để hạn chế việc dùng `XMLHttpRequest` theo kiểu đồng bộ, hỗ trợ HTML không có trong chế độ đồng bộ. Ngoài ra, hỗ trợ HTML chỉ có sẵn nếu thuộc tính {{domxref("XMLHttpRequest.responseType", "responseType")}} đã được đặt thành `"document"`. Hạn chế này tránh lãng phí thời gian phân tích HTML vô ích khi mã cũ dùng `XMLHttpRequest` ở chế độ mặc định để lấy {{domxref("XMLHttpRequest.responseText", "responseText")}} cho tài nguyên `text/html`. Nó cũng tránh các vấn đề với mã cũ giả định rằng {{domxref("XMLHttpRequest.responseXML", "responseXML")}} là `null` đối với các trang lỗi HTTP, vốn thường có phần thân phản hồi `text/html`.

## Cách dùng

Lấy một tài nguyên HTML dưới dạng DOM bằng {{domxref("XMLHttpRequest")}} hoạt động giống như lấy một tài nguyên XML dưới dạng DOM bằng `XMLHttpRequest`, trừ việc bạn không thể dùng chế độ đồng bộ và phải yêu cầu rõ một tài liệu bằng cách gán chuỗi `"document"` cho thuộc tính {{domxref("XMLHttpRequest.responseType", "responseType")}} của đối tượng `XMLHttpRequest` sau khi gọi {{domxref("XMLHttpRequest.open", "open()")}} nhưng trước khi gọi {{domxref("XMLHttpRequest.send", "send()")}}.

```js
const xhr = new XMLHttpRequest();
xhr.onload = () => {
  console.log(xhr.responseXML.title);
};
xhr.open("GET", "file.html");
xhr.responseType = "document";
xhr.send();
```

## Mã hóa ký tự

Nếu mã hóa ký tự được khai báo trong header HTTP {{HTTPHeader("Content-Type")}}, mã hóa đó sẽ được dùng. Nếu không có, và có byte order mark, thì mã hóa được chỉ ra bởi byte order mark sẽ được dùng. Nếu vẫn không có, và có một phần tử {{HTMLElement("meta")}} khai báo mã hóa trong 1024 byte đầu tiên của tệp, mã hóa đó sẽ được dùng. Nếu không, tệp sẽ được giải mã như UTF-8.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLHttpRequest")}}
- [Using XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
