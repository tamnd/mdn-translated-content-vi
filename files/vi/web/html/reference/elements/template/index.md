---
title: "<template>: Phần tử template nội dung"
slug: Web/HTML/Reference/Elements/template
page-type: html-element
browser-compat: html.elements.template
sidebar: htmlsidebar
---

Phần tử **`<template>`** trong [HTML](/en-US/docs/Web/HTML) đóng vai trò là cơ chế để giữ các đoạn {{Glossary("HTML")}}, có thể được dùng sau qua JavaScript hoặc được tạo ngay lập tức vào shadow DOM.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `shadowrootmode`
  - : Tạo [shadow root](/en-US/docs/Glossary/Shadow_tree) cho phần tử cha.
    Đây là phiên bản khai báo của phương thức {{domxref("Element.attachShadow()")}} và chấp nhận các giá trị {{glossary("enumerated")}} giống nhau.
    - `open`
      - : Hiển thị shadow root DOM nội bộ cho JavaScript (được khuyến nghị cho hầu hết các trường hợp sử dụng).

    - `closed`
      - : Ẩn shadow root DOM nội bộ khỏi JavaScript.

    > [!NOTE]
    > Trình phân tích cú pháp HTML tạo đối tượng {{domxref("ShadowRoot")}} trong DOM cho `<template>` đầu tiên trong một node với thuộc tính này được đặt thành giá trị được phép.
    > Nếu thuộc tính không được đặt, hoặc không được đặt thành giá trị được phép — hoặc nếu `ShadowRoot` đã được tạo khai báo trong cùng một cha — thì một {{domxref("HTMLTemplateElement")}} được tạo ra.
    > Một {{domxref("HTMLTemplateElement")}} không thể được thay đổi thành shadow root sau khi phân tích cú pháp, ví dụ bằng cách đặt {{domxref("HTMLTemplateElement.shadowRootMode")}}.

    > [!NOTE]
    > Bạn có thể tìm thấy thuộc tính không chuẩn `shadowroot` trong các hướng dẫn và ví dụ cũ hơn trước đây được hỗ trợ trong Chrome 90-110. Thuộc tính này đã bị xóa và được thay thế bằng thuộc tính tiêu chuẩn `shadowrootmode`.

- `shadowrootclonable`
  - : Đặt giá trị của thuộc tính [`clonable`](/en-US/docs/Web/API/ShadowRoot/clonable) của [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot) được tạo bằng phần tử này thành `true`.
    Nếu được đặt, bản sao của shadow host (phần tử cha của `<template>` này) được tạo bằng {{domxref("Node.cloneNode()")}} hoặc {{domxref("Document.importNode()")}} sẽ bao gồm shadow root trong bản sao.

- `shadowrootcustomelementregistry`
  - : Đặt thuộc tính [`customElementRegistry`](/en-US/docs/Web/API/ShadowRoot/customElementRegistry) của [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot) được tạo bằng phần tử này thành `null`, thay vì registry custom element của tài liệu.
    Điều này cho phép {{domxref("CustomElementRegistry")}} có phạm vi được gắn sau bằng {{domxref("CustomElementRegistry.initialize()")}}.

- `shadowrootdelegatesfocus`
  - : Đặt giá trị của thuộc tính [`delegatesFocus`](/en-US/docs/Web/API/ShadowRoot/delegatesFocus) của [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot) được tạo bằng phần tử này thành `true`.
    Nếu điều này được đặt và một phần tử không thể lấy tiêu điểm trong cây shadow được chọn, thì tiêu điểm sẽ được ủy quyền cho phần tử đầu tiên có thể lấy tiêu điểm trong cây.
    Giá trị mặc định là `false`.

- `shadowrootreferencetarget` {{Experimental_Inline}} {{non-standard_inline}}
  - : Đặt giá trị của thuộc tính `referenceTarget` của [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot) được tạo bằng phần tử này. Giá trị phải là ID của một phần tử bên trong shadow DOM. Nếu được đặt, các tham chiếu mục tiêu đến phần tử host từ bên ngoài shadow DOM sẽ khiến phần tử mục tiêu được tham chiếu trở thành mục tiêu hiệu lực của tham chiếu đến phần tử host.

- `shadowrootserializable`
  - : Đặt giá trị của thuộc tính [`serializable`](/en-US/docs/Web/API/ShadowRoot/serializable) của [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot) được tạo bằng phần tử này thành `true`.
    Nếu được đặt, shadow root có thể được tuần tự hóa bằng cách gọi các phương thức {{DOMxRef('Element.getHTML()')}} hoặc {{DOMxRef('ShadowRoot.getHTML()')}} với tham số `options.serializableShadowRoots` được đặt là `true`.
    Giá trị mặc định là `false`.

## Ghi chú sử dụng

Phần tử này không có nội dung được phép, vì mọi thứ được lồng bên trong nó trong nguồn HTML thực tế không trở thành con của phần tử `<template>`. Thuộc tính {{domxref("Node.childNodes")}} của phần tử `<template>` luôn trống, và bạn chỉ có thể truy cập nội dung được lồng đó qua thuộc tính đặc biệt {{domxref("HTMLTemplateElement.content", "content")}}. Tuy nhiên, nếu bạn gọi {{domxref("Node.appendChild()")}} hoặc các phương thức tương tự trên phần tử `<template>`, thì bạn sẽ chèn các con vào chính phần tử `<template>`, đây là vi phạm mô hình nội dung của nó và không thực sự cập nhật {{domxref("DocumentFragment")}} được trả về bởi thuộc tính `content`.

Do cách phần tử `<template>` được phân tích cú pháp, tất cả các thẻ mở và đóng `<html>`, `<head>`, và `<body>` bên trong template là lỗi cú pháp và bị trình phân tích cú pháp bỏ qua, vì vậy `<template><head><title>Test</title></head></template>` giống như `<template><title>Test</title></template>`.

Có hai cách chính để dùng phần tử `<template>`.

### Đoạn tài liệu template

Mặc định, nội dung của phần tử không được hiển thị.
Giao diện {{domxref("HTMLTemplateElement")}} tương ứng bao gồm thuộc tính {{domxref("HTMLTemplateElement.content", "content")}} tiêu chuẩn (không có thuộc tính nội dung/đánh dấu tương đương). Thuộc tính `content` này là chỉ đọc và giữ {{domxref("DocumentFragment")}} chứa cây con DOM được biểu diễn bởi template.

Các phương thức {{domxref("Node.cloneNode()")}} và {{domxref("Document.importNode()")}} đều tạo bản sao của một node. Sự khác biệt là `importNode()` sao chép node trong ngữ cảnh của tài liệu gọi, trong khi `cloneNode()` dùng tài liệu của node đang được sao chép. Ngữ cảnh tài liệu xác định {{domxref("CustomElementRegistry")}} để xây dựng bất kỳ custom element nào. Vì lý do này, hãy dùng `document.importNode()` để sao chép đoạn `content` để các hậu duệ custom element được xây dựng bằng các định nghĩa trong tài liệu hiện tại, thay vì tài liệu riêng biệt sở hữu nội dung template. Xem ví dụ trên trang {{domxref("Node.cloneNode()")}} để biết thêm chi tiết.

Lưu ý rằng bản thân container `DocumentFragment` không nên có dữ liệu đính kèm vào nó. Xem ví dụ [Dữ liệu trên DocumentFragment không được sao chép](#data_on_the_documentfragment_is_not_cloned) để biết thêm chi tiết.

### Shadow DOM khai báo

Nếu phần tử `<template>` chứa thuộc tính [`shadowrootmode`](#shadowrootmode) với giá trị `open` hoặc `closed`, trình phân tích cú pháp HTML sẽ tạo ngay lập tức shadow DOM. Phần tử được thay thế trong DOM bởi nội dung của nó được bọc trong {{domxref("ShadowRoot")}}, được gắn vào phần tử cha.
Đây là tương đương khai báo của việc gọi {{domxref("Element.attachShadow()")}} để gắn shadow root vào phần tử.

Nếu phần tử có bất kỳ giá trị nào khác cho `shadowrootmode`, hoặc không có thuộc tính `shadowrootmode`, trình phân tích cú pháp tạo {{domxref("HTMLTemplateElement")}}.
Tương tự, nếu có nhiều shadow root khai báo, chỉ cái đầu tiên được thay thế bởi {{domxref("ShadowRoot")}} — các phiên bản tiếp theo được phân tích cú pháp thành các đối tượng {{domxref("HTMLTemplateElement")}}.

## Ví dụ

### Tạo hàng bảng

Đầu tiên chúng ta bắt đầu với phần HTML của ví dụ.

```html
<table id="producttable">
  <thead>
    <tr>
      <td>UPC_Code</td>
      <td>Product_Name</td>
    </tr>
  </thead>
  <tbody>
    <!-- dữ liệu hiện có có thể tùy chọn được bao gồm ở đây -->
  </tbody>
</table>

<template id="productrow">
  <tr>
    <td class="record"></td>
    <td></td>
  </tr>
</template>
```

Đầu tiên, chúng ta có bảng mà chúng ta sau đó sẽ chèn nội dung bằng mã JavaScript. Sau đó là template, mô tả cấu trúc của đoạn HTML biểu diễn một hàng bảng duy nhất.

Bây giờ bảng đã được tạo và template được xác định, chúng ta dùng JavaScript để chèn các hàng vào bảng, mỗi hàng được xây dựng bằng template làm cơ sở.

```js
// Kiểm tra xem trình duyệt có hỗ trợ phần tử HTML template bằng cách kiểm tra
// sự hiện diện của thuộc tính content của phần tử template.
if ("content" in document.createElement("template")) {
  // Khởi tạo bảng với HTML tbody hiện có
  // và hàng với template
  const tbody = document.querySelector("tbody");
  const template = document.querySelector("#productrow");

  // Sao chép hàng mới và chèn vào bảng
  const clone = document.importNode(template.content, true);
  let td = clone.querySelectorAll("td");
  td[0].textContent = "1235646565";
  td[1].textContent = "Stuff";

  tbody.appendChild(clone);

  // Sao chép hàng mới và chèn vào bảng
  const clone2 = document.importNode(template.content, true);
  td = clone2.querySelectorAll("td");
  td[0].textContent = "0384928528";
  td[1].textContent = "Acme Kidney Beans 2";

  tbody.appendChild(clone2);
} else {
  // Tìm cách khác để thêm hàng vào bảng vì
  // phần tử HTML template không được hỗ trợ.
}
```

Kết quả là bảng HTML gốc, với hai hàng mới được thêm vào qua JavaScript:

```css hidden
table {
  background: black;
}
table td {
  background: white;
}
```

{{EmbedLiveSample("Generating table rows", 500, 120)}}

### Triển khai shadow DOM khai báo

Trong ví dụ này, cảnh báo hỗ trợ ẩn được bao gồm ở đầu đánh dấu. Cảnh báo này sau được đặt để hiển thị qua JavaScript nếu trình duyệt không hỗ trợ thuộc tính `shadowrootmode`. Tiếp theo, có hai phần tử {{HTMLElement("article")}}, mỗi phần tử chứa các phần tử {{HTMLElement("style")}} lồng nhau với các hành vi khác nhau. Phần tử `<style>` đầu tiên là toàn cục cho toàn bộ tài liệu. Phần tử thứ hai được giới hạn trong shadow root được tạo ra thay cho phần tử `<template>` do sự hiện diện của thuộc tính `shadowrootmode`.

```html
<p hidden>
  ⛔ Your browser doesn't support <code>shadowrootmode</code> attribute yet.
</p>
<article>
  <style>
    p {
      padding: 8px;
      background-color: wheat;
    }
  </style>
  <p>I'm in the DOM.</p>
</article>
<article>
  <template shadowrootmode="open">
    <style>
      p {
        padding: 8px;
        background-color: plum;
      }
    </style>
    <p>I'm in the shadow DOM.</p>
  </template>
</article>
```

```js
const isShadowRootModeSupported = Object.hasOwn(
  HTMLTemplateElement.prototype,
  "shadowRootMode",
);

document
  .querySelector("p[hidden]")
  .toggleAttribute("hidden", isShadowRootModeSupported);
```

{{EmbedGHLiveSample("dom-examples/shadow-dom/shadowrootmode/scoping.html", "", "120")}}

### Shadow DOM khai báo với ủy quyền tiêu điểm

Ví dụ này minh họa cách `shadowrootdelegatesfocus` được áp dụng cho shadow root được tạo khai báo, và ảnh hưởng của nó đến tiêu điểm.

Mã đầu tiên khai báo shadow root bên trong phần tử `<div>`, bằng cách dùng phần tử `<template>` với thuộc tính `shadowrootmode`.
Điều này hiển thị cả `<div>` không thể lấy tiêu điểm chứa văn bản và phần tử `<input>` có thể lấy tiêu điểm.
Nó cũng dùng CSS để tạo kiểu các phần tử với {{cssxref(":focus")}} thành màu xanh, và đặt kiểu thông thường của phần tử host.

```html
<div>
  <template shadowrootmode="open">
    <style>
      :host {
        display: block;
        border: 1px dotted black;
        padding: 10px;
        margin: 10px;
      }
      :focus {
        outline: 2px solid blue;
      }
    </style>
    <div>Clickable Shadow DOM text</div>
    <input type="text" placeholder="Input inside Shadow DOM" />
  </template>
</div>
```

Khối mã thứ hai giống hệt ngoại trừ việc nó đặt thuộc tính `shadowrootdelegatesfocus`, ủy quyền tiêu điểm cho phần tử đầu tiên có thể lấy tiêu điểm trong cây nếu một phần tử không thể lấy tiêu điểm trong cây được chọn.

```html
<div>
  <template shadowrootmode="open" shadowrootdelegatesfocus>
    <style>
      :host {
        display: block;
        border: 1px dotted black;
        padding: 10px;
        margin: 10px;
      }
      :focus {
        outline: 2px solid blue;
      }
    </style>
    <div>Clickable Shadow DOM text</div>
    <input type="text" placeholder="Input inside Shadow DOM" />
  </template>
</div>
```

Cuối cùng chúng ta dùng CSS sau để áp dụng viền đỏ cho phần tử `<div>` cha khi nó có tiêu điểm.

```css
div:focus {
  border: 2px solid red;
}
```

Kết quả được hiển thị bên dưới.
Khi HTML lần đầu được hiển thị, các phần tử không có kiểu, như được hiển thị trong hình ảnh đầu tiên.
Đối với shadow root không có `shadowrootdelegatesfocus` được đặt, bạn có thể nhấp vào bất cứ đâu ngoại trừ `<input>` và tiêu điểm không thay đổi (nếu bạn chọn phần tử `<input>` nó sẽ trông như hình ảnh thứ hai).

![Screenshot of code with no focus set](template_with_no_focus.png)

Đối với shadow root với `shadowrootdelegatesfocus` được đặt, nhấp vào văn bản (không thể lấy tiêu điểm) sẽ chọn phần tử `<input>`, vì đây là phần tử đầu tiên có thể lấy tiêu điểm trong cây.
Điều này cũng đặt tiêu điểm cho phần tử cha như được hiển thị bên dưới.

![Screenshot of the code where the element has focus](template_with_focus.png)

## Dữ liệu trên DocumentFragment không được sao chép

Khi giá trị {{domxref("DocumentFragment")}} được truyền, {{domxref("Node.appendChild")}} và các phương thức tương tự chỉ di chuyển _các node con_ của giá trị đó vào node đích. Do đó, thường nên đính kèm trình xử lý sự kiện vào các con của `DocumentFragment`, thay vì chính `DocumentFragment`.

Hãy xem xét HTML và JavaScript sau:

### HTML

```html
<div id="container"></div>

<template id="template">
  <div>Click me</div>
</template>
```

### JavaScript

```js
const container = document.getElementById("container");
const template = document.getElementById("template");

function clickHandler(event) {
  event.target.append(" — Clicked this div");
}

const firstClone = document.importNode(template.content, true);
firstClone.addEventListener("click", clickHandler);
container.appendChild(firstClone);

const secondClone = document.importNode(template.content, true);
secondClone.children[0].addEventListener("click", clickHandler);
container.appendChild(secondClone);
```

### Kết quả

Vì `firstClone` là `DocumentFragment`, chỉ có các con của nó được thêm vào `container` khi `appendChild` được gọi; trình xử lý sự kiện của `firstClone` không được sao chép. Ngược lại, vì trình xử lý sự kiện được thêm vào _node con_ đầu tiên của `secondClone`, trình xử lý sự kiện được sao chép khi `appendChild` được gọi, và nhấp vào nó hoạt động như mong đợi.

{{EmbedLiveSample(' Data on the DocumentFragment is not cloned')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
          >Nội dung metadata</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung diễn đạt</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#script-supporting_elements"
          >phần tử hỗ trợ script</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có (xem <a href="#usage_notes">Ghi chú sử dụng</a>)</td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
          >nội dung metadata</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung diễn đạt</a
        >, hoặc
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#script-supporting_elements"
          >phần tử hỗ trợ script</a
        >. Cũng được phép là con của phần tử {{HTMLElement("colgroup")}}
        mà <em>không</em> có thuộc tính
        <a href="/en-US/docs/Web/HTML/Reference/Elements/colgroup#span"><code>span</code></a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTemplateElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) và [`exportparts`](/en-US/docs/Web/HTML/Reference/Global_attributes/exportparts)
- Phần tử HTML {{HTMLElement("slot")}}
- Lớp giả CSS {{CSSXref(":has-slotted")}}, {{CSSXref(":host")}}, {{CSSXref(":host_function", ":host()")}}, và {{CSSXref(":host-context", ":host-context()")}}
- Phần tử giả CSS {{CSSXref("::part")}} và {{CSSXref("::slotted")}}
- Giao diện [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot)
- [Using templates and slots](/en-US/docs/Web/API/Web_components/Using_templates_and_slots)
- Mô-đun [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping)
- [Declarative Shadow DOM (with html)](/en-US/docs/Web/API/Web_components/Using_shadow_DOM#declaratively_with_html) trong _Using Shadow DOM_
- [Declarative shadow DOM](https://web.dev/articles/declarative-shadow-dom) trên web.dev (2023)
