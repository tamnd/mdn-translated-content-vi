---
title: "XMLHttpRequest: thuộc tính responseXML"
short-title: responseXML
slug: Web/API/XMLHttpRequest/responseXML
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.responseXML
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính chỉ đọc **`XMLHttpRequest.responseXML`** trả về một {{domxref("Document")}} chứa HTML hoặc XML được yêu cầu lấy về; hoặc `null` nếu yêu cầu không thành công, chưa được gửi, hoặc nếu dữ liệu không thể phân tích cú pháp dưới dạng XML hoặc HTML.

> [!NOTE]
> Tên `responseXML` là một di sản từ lịch sử của thuộc tính này; nó hoạt động cho cả HTML và XML.

Thông thường, phản hồi được phân tích cú pháp dưới dạng `"text/xml"`. Nếu {{domxref("XMLHttpRequest.responseType", "responseType")}} được đặt thành `"document"` và yêu cầu được thực hiện không đồng bộ, thay vào đó phản hồi được phân tích cú pháp dưới dạng `"text/html"`. `responseXML` là `null` cho bất kỳ loại dữ liệu nào khác, cũng như cho [`data:` URLs](/en-US/docs/Web/URI/Reference/Schemes/data).

Nếu máy chủ không chỉ định {{HTTPHeader("Content-Type")}} là `"text/xml"` hoặc `"application/xml"`, bạn có thể sử dụng {{domxref("XMLHttpRequest.overrideMimeType()")}} để phân tích cú pháp nó dưới dạng XML dù sao đi nữa.

Thuộc tính này không khả dụng cho workers.

## Giá trị

Một {{domxref("Document")}} từ việc phân tích cú pháp XML hoặc HTML nhận được bằng {{domxref("XMLHttpRequest")}}, hoặc `null` nếu không có dữ liệu nào được nhận hoặc nếu dữ liệu không phải là XML/HTML.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("XMLHttpRequest.responseType", "responseType")}} không phải là `document` hoặc một chuỗi rỗng.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/server");

// Nếu được chỉ định, responseType phải là chuỗi rỗng hoặc "document"
xhr.responseType = "document";

// Buộc phản hồi được phân tích cú pháp dưới dạng XML
xhr.overrideMimeType("text/xml");

xhr.onload = () => {
  if (xhr.readyState === xhr.DONE && xhr.status === 200) {
    console.log(xhr.response, xhr.responseXML);
  }
};

xhr.send();
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLHttpRequest")}}
- {{domxref("XMLHttpRequest.response")}}
- {{domxref("XMLHttpRequest.responseType")}}
- [Phân tích cú pháp và tuần tự hóa XML](/en-US/docs/Web/XML/Guides/Parsing_and_serializing_XML)
- Phân tích cú pháp XML thành cây DOM: {{domxref("DOMParser")}}
- Tuần tự hóa cây DOM thành XML: {{domxref("XMLSerializer")}} (cụ thể, phương thức {{domxref("XMLSerializer.serializeToString", "serializeToString()")}})
