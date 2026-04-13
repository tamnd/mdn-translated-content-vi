---
title: "Document: phương thức createElementNS()"
short-title: createElementNS()
slug: Web/API/Document/createElementNS
page-type: web-api-instance-method
browser-compat: api.Document.createElementNS
---

{{APIRef("DOM")}}

Phương thức **`createElementNS()`** của giao diện {{domxref("Document")}} tạo một phần tử mới với URI namespace và qualified name được chỉ định.

Phương thức này hữu ích trong các tài liệu đa namespace, chẳng hạn như SVG hoặc MathML được nhúng trong HTML, nơi parser không thể suy luận đáng tin cậy namespace.

Phương thức {{DOMxRef("Document.createElement()", "createElement()")}} đơn giản hơn nếu bạn muốn tạo một phần tử HTML thông thường.

## Cú pháp

```js-nolint
createElementNS(namespaceURI, qualifiedName)
createElementNS(namespaceURI, qualifiedName, options)
```

### Tham số

- `namespaceURI`
  - : Một chuỗi chỉ định {{DOMxRef("element.namespaceURI", "namespaceURI")}} để liên kết với phần tử. Một số URI namespace quan trọng là:
    - [HTML](/en-US/docs/Web/HTML)
      - : `http://www.w3.org/1999/xhtml`
    - [SVG](/en-US/docs/Web/SVG)
      - : `http://www.w3.org/2000/svg`
    - [MathML](/en-US/docs/Web/MathML)
      - : `http://www.w3.org/1998/Math/MathML`

- `qualifiedName`
  - : Một chuỗi chứa qualified name của phần tử mới.
    Thuộc tính {{DOMxRef("node.nodeName", "nodeName")}} của phần tử được tạo được khởi tạo với giá trị này.

    Định dạng của qualified name là `prefix:localName` hoặc `localName`, trong đó các phần được định nghĩa là:
    - `prefix` {{optional_inline}}
      - : Một "bí danh ngắn" cho namespace.
        Tiền tố là tùy chọn, nhưng nếu được chỉ định thì tham số `namespaceURI` cũng phải được chỉ định.
        Nếu tiền tố được đặt thành `xml` hoặc `xmlns`, thì `namespaceURI` phải được đặt thành `http://www.w3.org/XML/1998/namespace` hoặc `http://www.w3.org/2000/xmlns/`, tương ứng.

        Giá trị được sử dụng để khởi tạo thuộc tính {{DOMxRef("Element/prefix", "prefix")}} của phần tử mới.
        Mặc định là `null`.

    - `localName`
      - : Tên cục bộ của phần tử.
        Giá trị được sử dụng để khởi tạo thuộc tính {{DOMxRef("Element.localName", "localName")}} của phần tử mới.

- `options` {{Optional_Inline}}
  - : Một đối tượng với các thuộc tính tùy chọn sau (lưu ý rằng chỉ một trong `is` và `customElementRegistry` có thể được đặt):
    - `is` {{Optional_Inline}}
      - : Một chuỗi xác định tên thẻ cho một custom element đã được định nghĩa trước đó bằng {{domxref("CustomElementRegistry/define", "customElements.define()")}}.
        Phần tử mới sẽ được gán một thuộc tính `is` có giá trị là tên thẻ của custom element.
    - `customElementRegistry` {{Optional_Inline}}
      - : Một {{domxref("CustomElementRegistry")}} thiết lập [Scoped custom element registry](/en-US/docs/Web/API/Web_components/Using_custom_elements#scoped_custom_element_registries) của một custom element.

    Để tương thích ngược, một số trình duyệt cho phép bạn truyền một chuỗi thay vì một đối tượng, trong đó giá trị của chuỗi là tên thẻ của custom element.
    Xem [Mở rộng các phần tử HTML gốc](https://web.dev/articles/web-components) để biết thêm thông tin về cách sử dụng tham số này.

### Giá trị trả về

{{DOMxRef("Element")}} mới.

### Ngoại lệ

- `NamespaceError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị [`namespaceURI`](#namespaceURI) là:
    - không phải là URI namespace hợp lệ.
    - được đặt thành chuỗi rỗng khi `prefix` có giá trị.
    - không phải là giá trị `http://www.w3.org/XML/1998/namespace` hoặc `http://www.w3.org/2000/xmlns/` khi [`prefix`](#prefix) được đặt thành `xml` hoặc `xmlns`, tương ứng.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu `prefix` hoặc `localName` không hợp lệ:
    - `prefix` phải có ít nhất một ký tự và không được chứa khoảng trắng ASCII, `NULL`, `/` hoặc `>` (lần lượt là U+0000, U+002F hoặc U+003E).
    - `localName` là tên phần tử hợp lệ nếu nó có độ dài ít nhất là 1 và:
      - nó bắt đầu bằng một chữ cái và không chứa khoảng trắng ASCII, `NULL`, `/` hoặc `>` (lần lượt là U+0000, U+002F hoặc U+003E).
      - nó bắt đầu bằng `:` (U+003A), `_` (U+005F) hoặc bất kỳ ký tự nào trong khoảng U+0080 đến U+10FFFF (bao gồm), _và_ các code point còn lại chỉ bao gồm các ký tự tương tự cùng với các ký tự chữ-số ASCII, `-` (U+002D) và `.` (U+002E).

    > [!NOTE]
    > Các phiên bản trước của đặc tả kỹ thuật hạn chế hơn, yêu cầu `qualifiedName` phải là một [tên XML](https://www.w3.org/TR/xml/#dt-name) hợp lệ.

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu cả hai tùy chọn [`is`](#is) và [`customElementRegistry`](#customElementRegistry) đều được chỉ định.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này cho thấy cách tạo một phần tử `<div>` mới trong namespace {{Glossary("XHTML")}}.

```js
const divElementXHTML = document.createElementNS(
  "http://www.w3.org/1999/xhtml",
  "div",
);

// This is equivalent!
const divElementHTML = document.createElement("div");
```

### Tạo một phần tử SVG

Ví dụ này cho thấy cách bạn có thể tạo một phần tử SVG ({{domxref("SVGSVGElement")}}) và thêm nó vào phần tử `<body>` HTML.

Sử dụng `createElementNS()` với namespace SVG là cần thiết khi làm việc với tài liệu HTML.
Nếu bạn gọi {{DOMxRef("Document.createElement()", "createElement(\"svg\")")}}, một {{domxref("HTMLUnknownElement")}} sẽ được trả về và SVG sẽ không được kết xuất.

```js
const svgNS = "http://www.w3.org/2000/svg";

const svg = document.createElementNS(svgNS, "svg");
svg.setAttribute("width", "100");
svg.setAttribute("height", "100");

const circle = document.createElementNS(svgNS, "circle");
circle.setAttribute("cx", "50");
circle.setAttribute("cy", "50");
circle.setAttribute("r", "40");
circle.setAttribute("fill", "steelblue");

svg.appendChild(circle);
document.body.appendChild(svg);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("document.createElement()")}}
- {{DOMxRef("document.createTextNode()")}}
- {{DOMxRef("Element.namespaceURI")}}
