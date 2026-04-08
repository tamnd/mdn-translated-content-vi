---
title: :host()
slug: Web/CSS/Reference/Selectors/:host_function
page-type: css-pseudo-class
browser-compat: css.selectors.hostfunction
sidebar: cssref
---

Hàm **`:host()`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) chọn shadow host của [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) chứa CSS đang được dùng bên trong (vì vậy bạn có thể chọn một phần tử tùy chỉnh từ bên trong shadow DOM của nó) — nhưng chỉ khi bộ chọn được truyền vào làm tham số của hàm khớp với shadow host. **`:host()`** không có tác dụng khi dùng bên ngoài shadow DOM.

Ứng dụng rõ ràng nhất của lớp giả này là đặt tên lớp chỉ trên một số phiên bản phần tử tùy chỉnh nhất định, rồi đưa bộ chọn lớp liên quan vào làm tham số của hàm. Bạn không thể dùng nó với biểu thức bộ chọn con cháu để chỉ chọn các phiên bản của phần tử tùy chỉnh nằm bên trong một phần tử tổ tiên cụ thể. Đó là công việc của {{cssxref(":host-context()")}}.

> [!NOTE]
> Trong khi các lớp giả hàm khác như {{cssxref(":is()")}} và {{cssxref(":not()")}} chấp nhận danh sách bộ chọn làm tham số, `:host()` nhận một bộ chọn ghép đơn lẻ làm tham số. Ngoài ra, trong khi `:is()` và `:not()` chỉ tính đến độ đặc hiệu của tham số, độ đặc hiệu của `:host()` là cả độ đặc hiệu của lớp giả **lẫn** độ đặc hiệu của tham số.

{{InteractiveExample("CSS Demo: :host()", "tabbed-shorter")}}

```css interactive-example
/* Following CSS is being applied inside the shadow DOM. */

:host(h1) {
  color: red;
}

:host(#shadow-dom-host) {
  border: 2px dashed blue;
}
```

```html interactive-example
<!-- elements outside shadow dom -->
<div id="container">
  <h1 id="shadow-dom-host"></h1>
</div>
```

```js interactive-example
const shadowDom = init();

// add a <span> element in the shadow DOM
const span = document.createElement("span");
span.textContent = "Inside shadow DOM";
shadowDom.appendChild(span);

// attach shadow DOM to the #shadow-dom-host element
function init() {
  const host = document.getElementById("shadow-dom-host");
  const shadowDom = host.attachShadow({ mode: "open" });

  const cssTab = document.querySelector("#css-output");
  const shadowStyle = document.createElement("style");
  shadowStyle.textContent = cssTab.textContent;
  shadowDom.appendChild(shadowStyle);

  cssTab.addEventListener("change", () => {
    shadowStyle.textContent = cssTab.textContent;
  });
  return shadowDom;
}
```

```css
/* Selects a shadow root host, only if it is
   matched by the selector argument */
:host(.special-custom-element) {
  font-weight: bold;
}
```

## Cú pháp

```css-nolint
:host(<compound-selector>) {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu chọn lọc cho shadow host

Các đoạn mã sau được lấy từ [ví dụ host-selectors](https://github.com/mdn/web-components-examples/tree/main/host-selectors) ([xem trực tiếp](https://mdn.github.io/web-components-examples/host-selectors/)).

Trong ví dụ này chúng ta có một phần tử tùy chỉnh — `<context-span>` — mà bạn có thể bao quanh văn bản:

```html
<h1>
  Host selectors <a href="#"><context-span>example</context-span></a>
</h1>
```

Bên trong constructor của phần tử, chúng ta tạo các phần tử `style` và `span`, điền nội dung của phần tử tùy chỉnh vào `span`, và điền một số quy tắc CSS vào phần tử `style`:

```js
const style = document.createElement("style");
const span = document.createElement("span");
span.textContent = this.textContent;

const shadowRoot = this.attachShadow({ mode: "open" });
shadowRoot.appendChild(style);
shadowRoot.appendChild(span);

style.textContent =
  "span:hover { text-decoration: underline; }" +
  ":host-context(h1) { font-style: italic; }" +
  ':host-context(h1)::after { content: " - no links in headers!" }' +
  ":host-context(article, aside) { color: gray; }" +
  ":host(.footer) { color : red; }" +
  ":host { background: rgb(0 0 0 / 10%); padding: 2px 5px; }";
```

Quy tắc `:host(.footer) { color : red; }` tạo kiểu cho tất cả các phiên bản của phần tử `<context-span>` (shadow host trong trường hợp này) trong tài liệu có lớp `footer` được đặt trên chúng — chúng tôi đã dùng nó để tạo màu đặc biệt cho các phiên bản của phần tử nằm bên trong {{htmlelement("footer")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web components](/en-US/docs/Web/API/Web_components)
- {{CSSxRef(":host")}}
- {{cssxref(":host-context()")}}
- {{CSSxRef(":state",":state()")}}
