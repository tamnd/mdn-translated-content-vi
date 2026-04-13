---
title: Document Object Model (DOM)
slug: Web/API/Document_Object_Model
page-type: web-api-overview
spec-urls: https://dom.spec.whatwg.org/
---

{{DefaultAPISidebar("DOM")}}

**Document Object Model** (**DOM**) kết nối các trang web với các script hoặc ngôn ngữ lập trình bằng cách biểu diễn cấu trúc của tài liệu trong bộ nhớ, chẳng hạn như HTML biểu diễn một trang web. Thường thì nó đề cập đến JavaScript, mặc dù việc mô hình hóa tài liệu HTML, SVG hoặc XML dưới dạng đối tượng không phải là một phần của ngôn ngữ JavaScript cốt lõi.

DOM biểu diễn tài liệu dưới dạng cây logic. Mỗi nhánh của cây kết thúc bằng một nút và mỗi nút chứa các đối tượng. Các phương thức DOM cho phép truy cập lập trình vào cây. Với chúng, bạn có thể thay đổi cấu trúc, kiểu dáng hoặc nội dung của tài liệu.

Các nút cũng có thể có các trình xử lý sự kiện được gắn vào chúng. Khi một sự kiện được kích hoạt, các trình xử lý sự kiện sẽ được thực thi.

## Khái niệm và cách sử dụng

Document Object Model (DOM) là giao diện lập trình cho các tài liệu web. Nó biểu diễn trang để các chương trình có thể thay đổi cấu trúc, kiểu dáng và nội dung tài liệu. DOM biểu diễn tài liệu dưới dạng các nút và đối tượng; theo cách đó, các ngôn ngữ lập trình có thể tương tác với trang.

Một trang web là một tài liệu có thể được hiển thị trong cửa sổ trình duyệt hoặc dưới dạng mã nguồn HTML. Trong cả hai trường hợp, đó là cùng một tài liệu nhưng biểu diễn Document Object Model (DOM) cho phép nó được thao tác. Là biểu diễn hướng đối tượng của trang web, nó có thể được sửa đổi bằng ngôn ngữ scripting như JavaScript.

Ví dụ, DOM chỉ định rằng phương thức `querySelectorAll` trong đoạn mã này phải trả về danh sách tất cả các phần tử {{HTMLElement("p")}} trong tài liệu:

```js
const paragraphs = document.querySelectorAll("p");
// paragraphs[0] is the first <p> element
// paragraphs[1] is the second <p> element, etc.
alert(paragraphs[0].nodeName);
```

Tất cả các thuộc tính, phương thức và sự kiện có sẵn để thao tác và tạo trang web được tổ chức thành các đối tượng. Ví dụ, đối tượng `document` đại diện cho bản thân tài liệu, bất kỳ đối tượng `table` nào thực hiện giao diện DOM {{domxref("HTMLTableElement")}} để truy cập bảng HTML, và v.v, tất cả đều là các đối tượng.

DOM được xây dựng bằng nhiều API hoạt động cùng nhau. DOM cốt lõi định nghĩa các thực thể mô tả bất kỳ tài liệu nào và các đối tượng trong đó. Điều này được mở rộng khi cần thiết bởi các API khác thêm các tính năng và khả năng mới vào DOM. Ví dụ, [HTML DOM API](/en-US/docs/Web/API/HTML_DOM_API) thêm hỗ trợ để biểu diễn tài liệu HTML vào DOM cốt lõi và SVG API thêm hỗ trợ để biểu diễn tài liệu SVG.

### Cây DOM là gì?

**Cây DOM** là một [cấu trúc cây](https://en.wikipedia.org/wiki/Tree_structure) có các nút đại diện cho nội dung của tài liệu HTML hoặc XML. Mỗi tài liệu HTML hoặc XML có một biểu diễn cây DOM. Ví dụ, xem xét tài liệu sau:

```html
<html lang="en">
  <head>
    <title>My Document</title>
  </head>
  <body>
    <h1>Header</h1>
    <p>Paragraph</p>
  </body>
</html>
```

Nó có cây DOM trông như thế này:

![DOM dưới dạng biểu diễn giống cây của tài liệu có gốc và các phần tử nút chứa nội dung](using_the_w3c_dom_level_1_core-doctree.jpg)

Mặc dù cây trên tương tự như cây DOM của tài liệu trên, chúng không giống nhau vì cây DOM thực tế bảo tồn [khoảng trắng](/en-US/docs/Web/CSS/Guides/Text/Whitespace).

Khi trình duyệt web phân tích cú pháp tài liệu HTML, nó xây dựng cây DOM và sau đó sử dụng nó để hiển thị tài liệu.

### DOM và JavaScript

Ví dụ ngắn trước, giống như hầu hết các ví dụ, là {{glossary("JavaScript")}}. Nghĩa là, nó được _viết_ bằng JavaScript, nhưng _sử dụng_ DOM để truy cập tài liệu và các phần tử của nó. DOM không phải là ngôn ngữ lập trình, nhưng nếu không có nó, ngôn ngữ JavaScript sẽ không có mô hình hay khái niệm nào về các trang web, tài liệu HTML, tài liệu SVG và các phần của chúng. Toàn bộ tài liệu, phần đầu, các bảng trong tài liệu, tiêu đề bảng, văn bản trong các ô bảng và tất cả các phần tử khác trong tài liệu đều là các phần của mô hình đối tượng tài liệu cho tài liệu đó. Chúng đều có thể được truy cập và thao tác bằng DOM và ngôn ngữ scripting như JavaScript.

DOM không phải là một phần của ngôn ngữ JavaScript mà là một Web API được sử dụng để xây dựng trang web. JavaScript cũng có thể được sử dụng trong các ngữ cảnh khác. Ví dụ, Node.js chạy các chương trình JavaScript trên máy tính nhưng cung cấp một bộ API khác và DOM API không phải là một phần cốt lõi của thời gian chạy Node.js.

DOM được thiết kế để độc lập với bất kỳ ngôn ngữ lập trình cụ thể nào, làm cho biểu diễn cấu trúc của tài liệu có sẵn từ một API đơn nhất, nhất quán. Thậm chí nếu hầu hết các nhà phát triển web chỉ sử dụng DOM thông qua JavaScript, các triển khai DOM có thể được xây dựng cho bất kỳ ngôn ngữ nào.

### Truy cập DOM

Bạn không cần làm bất cứ điều gì đặc biệt để bắt đầu sử dụng DOM. Bạn sử dụng API trực tiếp trong JavaScript từ bên trong những gì được gọi là _script_, một chương trình được chạy bởi trình duyệt.

Khi bạn tạo một script, dù là nội tuyến trong phần tử `<script>` hay được bao gồm trong trang web, bạn có thể ngay lập tức bắt đầu sử dụng API cho các đối tượng {{domxref("document")}} hoặc {{domxref("Window", "window")}} để thao tác chính tài liệu hoặc bất kỳ phần tử nào trong trang web (các phần tử con của tài liệu).

```html
<body onload="console.log('Welcome to my home page!');">
  …
</body>
```

## Giao diện DOM

Sau đây là tất cả các giao diện được định nghĩa bởi đặc tả DOM:

- {{DOMxRef("AbortController")}}
- {{DOMxRef("AbortSignal")}}
- {{DOMxRef("AbstractRange")}}
- {{DOMxRef("Attr")}}
- {{DOMxRef("CDATASection")}}
- {{DOMxRef("CharacterData")}}
- {{DOMxRef("Comment")}}
- {{DOMxRef("CustomEvent")}}
- {{DOMxRef("Document")}}
- {{DOMxRef("DocumentFragment")}}
- {{DOMxRef("DocumentType")}}
- {{DOMxRef("DOMError")}} {{Deprecated_Inline}}
- {{DOMxRef("DOMException")}}
- {{DOMxRef("DOMImplementation")}}
- {{DOMxRef("DOMParser")}}
- {{DOMxRef("DOMTokenList")}}
- {{DOMxRef("Element")}}
- {{DOMxRef("Event")}}
- {{DOMxRef("EventTarget")}}
- {{DOMxRef("HTMLCollection")}}
- {{DOMxRef("MutationObserver")}}
- {{DOMxRef("MutationRecord")}}
- {{DOMxRef("NamedNodeMap")}}
- {{DOMxRef("Node")}}
- {{DOMxRef("NodeIterator")}}
- {{DOMxRef("NodeList")}}
- {{DOMxRef("ProcessingInstruction")}}
- {{DOMxRef("Range")}}
- {{DOMxRef("ShadowRoot")}}
- {{DOMxRef("StaticRange")}}
- {{DOMxRef("Text")}}
- {{DOMxRef("TreeWalker")}}
- {{DOMxRef("XMLDocument")}}
- {{DOMxRef("XPathEvaluator")}}
- {{DOMxRef("XPathExpression")}}
- {{DOMxRef("XPathResult")}}
- {{DOMxRef("XSLTProcessor")}}

### Giao diện và đối tượng

Nhiều đối tượng thực hiện nhiều giao diện khác nhau. Ví dụ, đối tượng bảng thực hiện giao diện {{domxref("HTMLTableElement")}} chuyên biệt, bao gồm các phương thức như `createCaption` và `insertRow`. Nhưng vì nó cũng là phần tử HTML, `table` thực hiện giao diện `Element`. Và cuối cùng, vì phần tử HTML cũng là một nút trong cây nút tạo nên mô hình đối tượng cho trang HTML hoặc XML, đối tượng bảng cũng thực hiện giao diện `Node` cơ bản hơn, từ đó `Element` kế thừa.

### Kiểu dữ liệu cơ bản

Bảng sau mô tả ngắn gọn các kiểu dữ liệu này.

<table class="standard-table">
  <thead>
    <tr>
      <th>Kiểu dữ liệu (Giao diện)</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{domxref("Document")}}</td>
      <td>
        Khi một thành viên trả về đối tượng có kiểu <code>document</code>,
        đối tượng này là đối tượng <code>document</code> gốc.
      </td>
    </tr>
    <tr>
      <td>{{domxref("Node")}}</td>
      <td>
        Mọi đối tượng nằm trong tài liệu đều là nút thuộc loại nào đó.
        Trong tài liệu HTML, đối tượng có thể là nút phần tử nhưng cũng là nút văn bản hoặc nút thuộc tính.
      </td>
    </tr>
    <tr>
      <td>{{domxref("Element")}}</td>
      <td>
        Kiểu <code>element</code> dựa trên <code>node</code>. Nó đề cập đến phần tử hoặc nút có kiểu
        <code>element</code> được trả về bởi thành viên của DOM API.
      </td>
    </tr>
    <tr>
      <td>{{domxref("Attr")}}</td>
      <td>
        Khi <code>attribute</code> được trả về bởi một thành viên, đó là tham chiếu đối tượng
        để lộ một giao diện đặc biệt cho các thuộc tính.
      </td>
    </tr>
  </tbody>
</table>

## HTML DOM

Tài liệu chứa HTML được mô tả bằng giao diện {{DOMxRef("Document")}}, được mở rộng bởi đặc tả HTML để bao gồm các tính năng đặc thù của HTML. Đặc biệt, giao diện {{domxref("Element")}} được nâng cao để trở thành {{domxref("HTMLElement")}} và các lớp con khác nhau, mỗi cái đại diện cho một (hoặc một gia đình phần tử liên quan chặt chẽ).

HTML DOM API cung cấp quyền truy cập vào các tính năng trình duyệt khác nhau như tab và cửa sổ, kiểu CSS và stylesheet, lịch sử trình duyệt, v.v.

## SVG DOM

Tương tự, tài liệu chứa SVG cũng được mô tả bằng giao diện {{DOMxRef("Document")}}, được mở rộng bởi đặc tả SVG để bao gồm các tính năng đặc thù của SVG. Giao diện {{domxref("Element")}} được nâng cao để trở thành {{domxref("SVGElement")}} và các lớp con khác nhau.

## Ví dụ

### Đặt nội dung văn bản

Ví dụ này sử dụng phần tử {{HTMLElement("div")}} chứa {{HTMLElement("textarea")}} và hai phần tử {{HTMLElement("button")}}. Khi người dùng nhấp nút đầu tiên chúng ta đặt một số văn bản trong `<textarea>`. Khi người dùng nhấp nút thứ hai chúng ta xóa văn bản.

#### HTML

```html
<div class="container">
  <textarea class="story"></textarea>
  <button id="set-text" type="button">Set text content</button>
  <button id="clear-text" type="button">Clear text content</button>
</div>
```

#### CSS

```css
.container {
  display: flex;
  gap: 0.5rem;
  flex-direction: column;
}

button {
  width: 200px;
}
```

#### JavaScript

```js
const story = document.querySelector(".story");

const setText = document.querySelector("#set-text");
setText.addEventListener("click", () => {
  story.textContent = "It was a dark and stormy night...";
});

const clearText = document.querySelector("#clear-text");
clearText.addEventListener("click", () => {
  story.textContent = "";
});
```

#### Kết quả

{{EmbedLiveSample("Setting text content", "", "150px")}}

### Thêm phần tử con

Ví dụ này thể hiện cách tạo phần tử mới và thêm nó làm con của `<div>`.

#### HTML

```html
<div class="container">
  <div class="parent">parent</div>
  <button id="add-child" type="button">Add a child</button>
  <button id="remove-child" type="button">Remove child</button>
</div>
```

#### CSS

```css
.container {
  display: flex;
  gap: 0.5rem;
  flex-direction: column;
}

button {
  width: 100px;
}

div.parent {
  border: 1px solid black;
  padding: 5px;
  width: 100px;
  height: 100px;
}

div.child {
  border: 1px solid red;
  margin: 10px;
  padding: 5px;
  width: 80px;
  height: 60px;
  box-sizing: border-box;
}
```

#### JavaScript

```js
const parent = document.querySelector(".parent");

const addChild = document.querySelector("#add-child");
addChild.addEventListener("click", () => {
  // Only add a child if we don't already have one
  // in addition to the text node "parent"
  if (parent.childNodes.length > 1) {
    return;
  }
  const child = document.createElement("div");
  child.classList.add("child");
  child.textContent = "child";
  parent.appendChild(child);
});

const removeChild = document.querySelector("#remove-child");
removeChild.addEventListener("click", () => {
  const child = document.querySelector(".child");
  parent.removeChild(child);
});
```

#### Kết quả

{{EmbedLiveSample("Adding a child element", "", "180px")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model)
- [HTML DOM API](/en-US/docs/Web/API/HTML_DOM_API)
