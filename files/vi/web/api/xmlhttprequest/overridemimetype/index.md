---
title: "XMLHttpRequest: phương thức overrideMimeType()"
short-title: overrideMimeType()
slug: Web/API/XMLHttpRequest/overrideMimeType
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.overrideMimeType
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức {{domxref("XMLHttpRequest")}} **`overrideMimeType()`** chỉ định một kiểu MIME khác với kiểu do máy chủ cung cấp để sử dụng thay thế khi diễn giải dữ liệu đang được truyền trong một yêu cầu.

Điều này có thể được sử dụng, ví dụ, để buộc một luồng được xử lý và phân tích cú pháp dưới dạng `"text/xml"`, ngay cả khi máy chủ không báo cáo như vậy. Phương thức này phải được gọi trước khi gọi {{domxref("XMLHttpRequest.send", "send()")}}.

## Cú pháp

```js-nolint
overrideMimeType(mimeType)
```

### Tham số

- `mimeType`
  - : Một chuỗi chỉ định kiểu MIME để sử dụng thay vì kiểu do máy chủ chỉ định. Nếu máy chủ không chỉ định kiểu, `XMLHttpRequest` giả định `"text/xml"`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này chỉ định kiểu MIME là `"text/plain"`, ghi đè lên kiểu được máy chủ khai báo cho dữ liệu đang nhận.

> [!NOTE]
> Nếu máy chủ không cung cấp tiêu đề [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type), {{domxref("XMLHttpRequest")}} giả định rằng kiểu MIME là `"text/xml"`. Nếu nội dung không phải là XML hợp lệ, lỗi "XML Parsing Error: not well-formed" sẽ xảy ra. Bạn có thể tránh điều này bằng cách gọi `overrideMimeType()` để chỉ định một kiểu khác.

```js
// Diễn giải dữ liệu nhận được dưới dạng văn bản thuần túy

req = new XMLHttpRequest();
req.overrideMimeType("text/plain");
req.addEventListener("load", callback);
req.open("get", url);
req.send();
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- {{domxref("XMLHttpRequest.responseType")}}
