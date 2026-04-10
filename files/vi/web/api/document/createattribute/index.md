---
title: "Document: phương thức createAttribute()"
short-title: createAttribute()
slug: Web/API/Document/createAttribute
page-type: web-api-instance-method
browser-compat: api.Document.createAttribute
---

{{ ApiRef("DOM") }}

Phương thức **`createAttribute()`** của giao diện {{domxref("Document")}} tạo một nút thuộc tính mới.

Đối tượng được tạo là một nút triển khai giao diện {{domxref("Attr")}}.
DOM không thực thi loại thuộc tính nào có thể được thêm vào một phần tử cụ thể theo cách này.

> [!NOTE]
> Chuỗi được cung cấp trong tham số được chuyển đổi thành chữ thường.

## Cú pháp

```js-nolint
createAttribute(localName)
```

### Tham số

- `localName`
  - : Một chuỗi chứa tên của thuộc tính.
    Giá trị được sử dụng để khởi tạo thuộc tính {{DOMxRef("Attr.localName", "localName")}} của thuộc tính mới.

### Giá trị trả về

Một nút {{domxref("Attr")}}.

### Ngoại lệ

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị [`localName`](#localName) không phải là tên thuộc tính hợp lệ.
    Nó phải có ít nhất một ký tự và không được chứa khoảng trắng ASCII, `NULL`, `/`, `=` hoặc `>` (lần lượt là U+0000, U+002F, U+003D hoặc U+003E).

    > [!NOTE]
    > Các phiên bản trước của đặc tả kỹ thuật hạn chế hơn, yêu cầu `localName` phải là một [tên XML](https://www.w3.org/TR/xml/#dt-name) hợp lệ.

## Ví dụ

### Ví dụ cơ bản

```js
const node = document.getElementById("div1");
const a = document.createAttribute("my_attrib");
a.value = "newVal";
node.setAttributeNode(a);
console.log(node.getAttribute("my_attrib")); // "newVal"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.createAttributeNS()")}}
- {{domxref("Document.createElement()")}}
- {{domxref("Element.setAttribute()")}}
- {{domxref("Element.setAttributeNode()")}}
