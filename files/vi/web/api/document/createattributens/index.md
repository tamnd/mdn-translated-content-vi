---
title: "Document: phương thức createAttributeNS()"
short-title: createAttributeNS()
slug: Web/API/Document/createAttributeNS
page-type: web-api-instance-method
browser-compat: api.Document.createAttributeNS
---

{{ ApiRef("DOM") }}

Phương thức **`createAttributeNS()`** của giao diện {{domxref("Document")}} tạo một nút thuộc tính mới với URI namespace và qualified name được chỉ định.

Đối tượng được tạo là một nút triển khai giao diện {{domxref("Attr")}}.
DOM không thực thi loại thuộc tính nào có thể được thêm vào một phần tử cụ thể theo cách này.

## Cú pháp

```js-nolint
createAttributeNS(namespaceURI, qualifiedName)
```

### Tham số

- `namespaceURI`
  - : Một chuỗi chỉ định {{DOMxRef("Attr.namespaceURI", "namespaceURI")}} để liên kết với thuộc tính, hoặc chuỗi rỗng.
    Một số URI namespace quan trọng là:
    - [HTML](/en-US/docs/Web/HTML)
      - : `http://www.w3.org/1999/xhtml`
    - [SVG](/en-US/docs/Web/SVG)
      - : `http://www.w3.org/2000/svg`
    - [MathML](/en-US/docs/Web/MathML)
      - : `http://www.w3.org/1998/Math/MathML`
- `qualifiedName`
  - : Một chuỗi chứa qualified name của thuộc tính mới.
    Thuộc tính {{DOMxRef("Attr.name", "name")}} của thuộc tính được tạo được khởi tạo với giá trị này.

    Định dạng của qualified name là `prefix:localName` hoặc `localName`, trong đó các phần được định nghĩa là:
    - `prefix` {{optional_inline}}
      - : Một "bí danh ngắn" cho namespace.
        Tiền tố là tùy chọn, nhưng nếu được chỉ định thì tham số `namespaceURI` cũng phải được chỉ định.
        Nếu tiền tố được đặt thành `xml` hoặc `xmlns`, thì `namespaceURI` phải được đặt thành `http://www.w3.org/XML/1998/namespace` hoặc `http://www.w3.org/2000/xmlns/`, tương ứng.

        Giá trị được sử dụng để khởi tạo thuộc tính {{DOMxRef("Attr.prefix", "prefix")}} của thuộc tính mới.
        Mặc định là `null`.

    - `localName`
      - : Tên cục bộ của thuộc tính.
        Giá trị được sử dụng để khởi tạo thuộc tính {{DOMxRef("Attr.localName", "localName")}} của thuộc tính mới.

### Giá trị trả về

Nút {{domxref("Attr")}} mới.

### Ngoại lệ

- `NamespaceError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị [`namespaceURI`](#namespaceURI) là:
    - không phải là URI namespace hợp lệ.
    - được đặt thành chuỗi rỗng khi `prefix` có giá trị.
    - không phải là giá trị `http://www.w3.org/XML/1998/namespace` hoặc `http://www.w3.org/2000/xmlns/` khi [`prefix`](#prefix) được đặt thành `xml` hoặc `xmlns`, tương ứng.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu `prefix` hoặc `localName` không hợp lệ:
    - `prefix` phải có ít nhất một ký tự và không được chứa khoảng trắng ASCII, `NULL`, `/` hoặc `>` (lần lượt là U+0000, U+002F hoặc U+003E).
    - `localName` phải có ít nhất một ký tự và không được chứa khoảng trắng ASCII, `NULL`, `/`, `=` hoặc `>` (lần lượt là U+0000, U+002F, U+003D hoặc U+003E).

    > [!NOTE]
    > Các phiên bản trước của đặc tả kỹ thuật hạn chế hơn, yêu cầu `localName` phải là một [tên XML](https://www.w3.org/TR/xml/#dt-name) hợp lệ.

## Ví dụ

### Sử dụng cơ bản

```js
const node = document.getElementById("svg");
const a = document.createAttributeNS("http://www.w3.org/2000/svg", "viewBox");
a.value = "0 0 100 100";
node.setAttributeNode(a);
console.log(node.getAttribute("viewBox")); // "0 0 100 100"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.createAttribute()")}}
- {{domxref("Document.createElementNS()")}}
- {{domxref("Element.setAttributeNS()")}}
- {{domxref("Element.setAttributeNode()")}}
- {{domxref("Element.setAttributeNodeNS()")}}
