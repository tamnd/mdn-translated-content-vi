---
title: "XMLHttpRequest: phương thức getResponseHeader()"
short-title: getResponseHeader()
slug: Web/API/XMLHttpRequest/getResponseHeader
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.getResponseHeader
---

{{DOMxRef("XMLHttpRequest")}}

Phương thức {{DOMxRef("XMLHttpRequest")}} **`getResponseHeader()`** trả về chuỗi chứa văn bản của một giá trị tiêu đề cụ thể.

Nếu có nhiều tiêu đề phản hồi cùng tên, giá trị của chúng sẽ được trả về dưới dạng một chuỗi nối duy nhất, trong đó mỗi giá trị được phân tách với giá trị trước đó bằng dấu phẩy và khoảng trắng. Phương thức `getResponseHeader()` trả về giá trị dưới dạng dãy byte UTF.

> [!NOTE]
> Việc tìm kiếm tên tiêu đề không phân biệt chữ hoa chữ thường.

Nếu bạn cần lấy chuỗi thô của tất cả các tiêu đề, hãy sử dụng phương thức {{DOMxRef("XMLHttpRequest.getAllResponseHeaders", "getAllResponseHeaders()")}}, phương thức này trả về toàn bộ chuỗi tiêu đề thô.

## Cú pháp

```js-nolint
getResponseHeader(headerName)
```

### Tham số

- `headerName`
  - : Một chuỗi cho biết tên của tiêu đề bạn muốn trả về giá trị văn bản.

### Giá trị trả về

Một chuỗi đại diện cho giá trị văn bản của tiêu đề, hoặc `null` nếu phản hồi chưa được nhận hoặc tiêu đề không tồn tại trong phản hồi.

## Ví dụ

Trong ví dụ này, một yêu cầu được tạo và gửi, và một trình xử lý {{domxref("XMLHttpRequest/readystatechange_event", "readystatechange")}} được thiết lập để kiểm tra {{DOMxRef("XMLHttpRequest.readyState", "readyState")}} cho biết các tiêu đề đã được nhận; khi đó, giá trị của tiêu đề {{httpheader("Content-Type")}} được lấy. Nếu `Content-Type` không phải là giá trị mong muốn, {{DOMxRef("XMLHttpRequest")}} bị hủy bằng cách gọi {{DOMxRef("XMLHttpRequest.abort", "abort()")}}.

```js
const client = new XMLHttpRequest();
client.open("GET", "unicorns-are-awesome.txt", true);
client.send();

client.onreadystatechange = () => {
  if (client.readyState === client.HEADERS_RECEIVED) {
    const contentType = client.getResponseHeader("Content-Type");
    if (contentType !== myExpectedType) {
      client.abort();
    }
  }
};
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- {{DOMxRef("XMLHttpRequest.getAllResponseHeaders", "getAllResponseHeaders()")}}
- {{DOMxRef("XMLHttpRequest.response", "response")}}
- Thiết lập tiêu đề yêu cầu: {{DOMxRef("XMLHttpRequest.setRequestHeader", "setRequestHeader()")}}
