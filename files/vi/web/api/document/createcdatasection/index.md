---
title: "Document: phương thức createCDATASection()"
short-title: createCDATASection()
slug: Web/API/Document/createCDATASection
page-type: web-api-instance-method
browser-compat: api.Document.createCDATASection
---

{{APIRef("DOM")}}

**`createCDATASection()`** tạo một nút CDATA section mới và trả về nó.

## Cú pháp

```js-nolint
createCDATASection(data)
```

### Tham số

- `data`
  - : Một chuỗi chứa dữ liệu cần được thêm vào CDATA Section.

### Giá trị trả về

Một nút [CDATA Section](/en-US/docs/Web/API/CDATASection).

## Ví dụ

```js
const doc = new DOMParser().parseFromString("<xml></xml>", "application/xml");
const cdata = doc.createCDATASection("Some <CDATA> data & then some");
doc.querySelector("xml").appendChild(cdata);
console.log(new XMLSerializer().serializeToString(doc));
// Displays: <xml><![CDATA[Some <CDATA> data & then some]]></xml>
```

## Ghi chú

- Phương thức này chỉ hoạt động với XML, không hoạt động với tài liệu HTML (vì tài liệu HTML không hỗ trợ CDATA sections); cố gắng sử dụng trên tài liệu HTML sẽ ném ra `NOT_SUPPORTED_ERR`.
- Sẽ ném ra ngoại lệ `NS_ERROR_DOM_INVALID_CHARACTER_ERR` nếu cố gắng gửi chuỗi đóng CDATA (`]]>`) như một phần của dữ liệu, vì vậy dữ liệu do người dùng cung cấp không được escape không thể được sử dụng an toàn mà không gặp ngoại lệ này ({{domxref("document.createTextNode","createTextNode()")}} thường có thể được sử dụng thay thế).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
