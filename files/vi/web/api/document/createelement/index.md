---
title: "Document: phương thức createElement()"
short-title: createElement()
slug: Web/API/Document/createElement
page-type: web-api-instance-method
browser-compat: api.Document.createElement
---

{{APIRef("DOM")}}

Phương thức **`createElement()`** của giao diện {{domxref("Document")}} tạo một {{domxref("HTMLElement")}} mới có `localName` được chỉ định.

Nếu `localName` không được nhận dạng, phương thức sẽ tạo một {{domxref("HTMLUnknownElement")}}.

## Cú pháp

```js-nolint
createElement(localName)
createElement(localName, options)
```

### Tham số

- `localName`
  - : Một chuỗi chỉ định loại phần tử cần tạo.
    Không sử dụng qualified names (như "html:a") với phương thức này.
    Khi được gọi trên một tài liệu HTML, `createElement()` chuyển đổi `localName` thành chữ thường trước khi tạo phần tử.
    Trong Firefox, Opera và Chrome, `createElement(null)` hoạt động giống như `createElement("null")`.
- `options` {{Optional_Inline}}
  - : Một đối tượng với các thuộc tính tùy chọn sau (lưu ý rằng chỉ một trong `is` và `customElementRegistry` có thể được đặt):
    - `is` {{Optional_Inline}}
      - : Một chuỗi xác định tên thẻ cho một custom element đã được định nghĩa trước đó bằng {{domxref("CustomElementRegistry/define", "customElements.define()")}}.
        Phần tử mới sẽ được gán một thuộc tính `is` có giá trị là tên thẻ của custom element.
        Xem [ví dụ về web component](#web_component_example) để biết thêm chi tiết.
    - `customElementRegistry` {{Optional_Inline}}
      - : Một {{domxref("CustomElementRegistry")}} thiết lập [Scoped custom element registry](/en-US/docs/Web/API/Web_components/Using_custom_elements#scoped_custom_element_registries) của một custom element.

### Giá trị trả về

{{domxref("Element")}} mới.

> [!NOTE]
> Một {{domxref("HTMLElement", "HTMLElement", "", "1")}} mới được trả về nếu tài liệu là một {{domxref("HTMLDocument", "HTMLDocument", "", "1")}}, đây là trường hợp phổ biến nhất.
> Nếu không, một {{domxref("Element","Element","","1")}} mới sẽ được trả về.

### Ngoại lệ

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị [`localName`](#localName) không phải là tên phần tử hợp lệ.
    Một chuỗi là tên phần tử hợp lệ nếu độ dài của nó ít nhất là 1 và:
    - nó bắt đầu bằng một chữ cái và không chứa khoảng trắng ASCII, `NULL`, `/` hoặc `>` (lần lượt là U+0000, U+002F hoặc U+003E).
    - nó bắt đầu bằng `:` (U+003A), `_` (U+005F) hoặc bất kỳ ký tự nào trong khoảng U+0080 đến U+10FFFF (bao gồm), _và_ các code point còn lại chỉ bao gồm các ký tự tương tự cùng với các ký tự chữ-số ASCII, `-` (U+002D) và `.` (U+002E).

    > [!NOTE]
    > Các phiên bản trước của đặc tả kỹ thuật hạn chế hơn, yêu cầu `localName` phải là một [tên XML](https://www.w3.org/TR/xml/#dt-name) hợp lệ.

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu cả hai tùy chọn [`is`](#is) và [`customElementRegistry`](#customElementRegistry) đều được chỉ định.

## Ví dụ

### Ví dụ cơ bản

Ví dụ này tạo một `<div>` mới và chèn nó trước phần tử có ID `div1`.

#### HTML

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>Working with elements</title>
  </head>
  <body>
    <div id="div1">The text above has been created dynamically.</div>
  </body>
</html>
```

#### JavaScript

```js
function addElement() {
  // create a new div element
  const newDiv = document.createElement("div");

  // and give it some content
  const newContent = document.createTextNode("Hi there and greetings!");

  // add the text node to the newly created div
  newDiv.appendChild(newContent);

  // add the newly created element and its content into the DOM
  const currentDiv = document.getElementById("div1");
  document.body.insertBefore(newDiv, currentDiv);
}

addElement();
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 500, 80)}}

### Ví dụ về web component

> [!NOTE]
> Kiểm tra phần [tương thích trình duyệt](#browser_compatibility) để biết hỗ trợ và tham khảo thuộc tính [`is`](/en-US/docs/Web/HTML/Reference/Global_attributes/is) để biết các lưu ý về triển khai customized built-in elements.

Đoạn mã ví dụ sau được lấy từ ví dụ [expanding-list-web-component](https://github.com/mdn/web-components-examples/tree/main/expanding-list-web-component) của chúng tôi ([xem trực tiếp](https://mdn.github.io/web-components-examples/expanding-list-web-component/)). Trong trường hợp này, custom element của chúng tôi mở rộng {{domxref("HTMLUListElement")}}, đại diện cho phần tử {{htmlelement("ul")}}.

```js
// Create a class for the element
class ExpandingList extends HTMLUListElement {
  constructor() {
    // Always call super first in constructor
    super();

    // constructor definition left out for brevity
    // …
  }
}

// Define the new element
customElements.define("expanding-list", ExpandingList, { extends: "ul" });
```

Nếu chúng ta muốn tạo một instance của phần tử này theo chương trình, chúng ta sẽ sử dụng một lệnh gọi như sau:

```js
let expandingList = document.createElement("ul", { is: "expanding-list" });
```

Phần tử mới sẽ được gán một thuộc tính [`is`](/en-US/docs/Web/HTML/Reference/Global_attributes/is) có giá trị là tên thẻ của custom element.

> [!NOTE]
> Để tương thích ngược, một số trình duyệt sẽ cho phép bạn truyền một chuỗi thay vì một đối tượng, trong đó giá trị của chuỗi là tên thẻ của custom element.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.removeChild()")}}
- {{domxref("Node.replaceChild()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Node.insertBefore()")}}
- {{domxref("Node.hasChildNodes()")}}
- {{domxref("document.createElementNS()")}} — để chỉ định rõ ràng namespace URI cho phần tử.
