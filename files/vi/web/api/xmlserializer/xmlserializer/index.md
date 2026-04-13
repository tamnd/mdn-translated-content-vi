---
title: "XMLSerializer: XMLSerializer() constructor"
short-title: XMLSerializer()
slug: Web/API/XMLSerializer/XMLSerializer
page-type: web-api-constructor
browser-compat: api.XMLSerializer.XMLSerializer
---

{{APIRef("HTML DOM")}}

Constructor **`XMLSerializer()`** tạo một {{domxref("XMLSerializer")}} mới.

## Cú pháp

```js-nolint
new XMLSerializer()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("XMLSerializer")}} mới.

## Ví dụ

### Tuần tự hóa XML thành chuỗi

Ví dụ này tuần tự hóa toàn bộ tài liệu thành một chuỗi chứa XML.

```js
const s = new XMLSerializer();
const d = document;
const str = s.serializeToString(d);
saveXML(str);
```

Quá trình này bao gồm việc tạo một đối tượng `XMLSerializer` mới, sau đó truyền {{domxref("Document")}} cần tuần tự hóa vào {{domxref("XMLSerializer.serializeToString", "serializeToString()")}}, phương thức này trả về chuỗi tương đương XML của tài liệu. `saveXML()` đại diện cho một hàm sẽ lưu chuỗi đã tuần tự hóa.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
