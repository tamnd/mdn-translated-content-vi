---
title: "XMLSerializer: serializeToString() method"
short-title: serializeToString()
slug: Web/API/XMLSerializer/serializeToString
page-type: web-api-instance-method
browser-compat: api.XMLSerializer.serializeToString
---

{{APIRef("HTML DOM")}}

Phương thức {{domxref("XMLSerializer")}} **`serializeToString()`** xây dựng một chuỗi biểu diễn cây {{Glossary("DOM")}} đã chỉ định dưới dạng {{Glossary("XML")}}.

## Cú pháp

```js-nolint
serializeToString(rootNode)
```

### Tham số

- `rootNode`
  - : {{domxref("Node")}} dùng làm gốc của cây DOM hoặc cây con cần xây dựng biểu diễn XML.

### Giá trị trả về

Một chuỗi chứa biểu diễn XML của cây DOM đã chỉ định.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `rootNode` đã chỉ định không phải là kiểu nút tương thích. Nút gốc phải là {{domxref("Node")}} hoặc {{domxref("Attr")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu cây không thể được tuần tự hóa thành công, thường do vấn đề về khả năng tương thích của nội dung với tuần tự hóa XML.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném ra nếu yêu cầu tuần tự hóa HTML nhưng không thể thành công do nội dung không đúng định dạng.

## Ghi chú sử dụng

### Kiểu nút tương thích

Nút gốc đã chỉ định — và tất cả các hậu duệ của nó — phải tương thích với thuật toán tuần tự hóa XML. Bản thân nút gốc phải là đối tượng {{domxref("Node")}} hoặc {{domxref("Attr")}}.

Các kiểu sau cũng được phép là hậu duệ của nút gốc, ngoài `Node` và `Attr`:

- {{domxref("DocumentType")}}
- {{domxref("Document")}}
- {{domxref("DocumentFragment")}}
- {{domxref("Element")}}
- {{domxref("Comment")}}
- {{domxref("Text")}}
- {{domxref("ProcessingInstruction")}}
- {{domxref("Attr")}}

Nếu gặp bất kỳ kiểu nào khác, ngoại lệ {{jsxref("TypeError")}} sẽ được ném ra.

### Ghi chú về XML kết quả

Có một số điểm đáng lưu ý về XML do `serializeToString()` xuất ra:

- Đối với tuần tự hóa XML, các nút `Element` và `Attr` luôn được tuần tự hóa với {{domxref("Element.namespaceURI", "namespaceURI")}} của chúng. Điều này có thể nghĩa là {{domxref("Element.prefix", "prefix")}} hoặc namespace mặc định được chỉ định trước đó có thể bị loại bỏ hoặc thay đổi.
- XML kết quả tương thích với trình phân tích cú pháp HTML.
- Các phần tử trong namespace HTML không có nút con (do đó đại diện cho thẻ rỗng) được tuần tự hóa với cả thẻ mở và thẻ đóng (`"<someelement></someelement>"`) thay vì dùng thẻ rỗng (`"<someelement/>"`).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Phân tích cú pháp và tuần tự hóa XML](/en-US/docs/Web/XML/Guides/Parsing_and_serializing_XML)
- Tuần tự hóa sang HTML: {{domxref("Element.innerHTML")}} và {{domxref("Element.outerHTML")}}
- Phân tích cú pháp HTML hoặc XML để tạo cây DOM: {{domxref("DOMParser")}}
