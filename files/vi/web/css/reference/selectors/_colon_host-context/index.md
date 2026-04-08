---
title: :host-context()
slug: Web/CSS/Reference/Selectors/:host-context
page-type: css-pseudo-class
status:
  - deprecated
browser-compat: css.selectors.host-context
sidebar: cssref
---

{{deprecated_header}}

**`:host-context()`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) cho phép bạn tạo kiểu khác nhau cho các phần tử bên trong [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) dựa trên bộ chọn của shadow host (phần tử có shadow root) và các phần tử tổ tiên trong DOM.

Thông thường, các phần tử bên trong shadow DOM bị cô lập khỏi DOM bên ngoài. `:host-context()` cho phép bạn "nhìn ra ngoài" shadow DOM và kiểm tra xem có phần tử tổ tiên nào của phần tử khớp với một bộ chọn CSS nhất định hay không. Ví dụ, áp dụng màu văn bản khác nhau cho các phần tử trong shadow root khi lớp `.dark-theme` được áp dụng cho `<body>`.

Hãy nghĩ như thế này: Hãy tưởng tượng bạn có một phần tử tùy chỉnh `<greenhouse>` với một `<chameleon>` sống bên trong. Ở đây, `<greenhouse>` là shadow DOM host và phần tử `<chameleon>` nằm trong shadow DOM. `:host-context()` cho phép `<chameleon>` thay đổi ngoại hình dựa trên môi trường của `<greenhouse>`. Nếu `<greenhouse>` ở nơi nắng (có lớp "sunny-theme"), `<chameleon>` sẽ chuyển sang màu vàng. Nếu `<greenhouse>` ở nơi râm (lớp "shady-theme" được áp dụng thay thế), `<chameleon>` sẽ chuyển sang màu xanh.

Bộ chọn này xuyên qua tất cả ranh giới shadow. Nó sẽ tìm kiếm chủ đề nắng hoặc râm được áp dụng trực tiếp cho `<greenhouse>` hoặc trên bất kỳ tổ tiên nào của host và các DOM tổ tiên cho đến khi đến gốc tài liệu.

Để giới hạn bộ chọn chỉ cho `<greenhouse>` host trực tiếp hoặc giới hạn việc chọn DOM của host, hãy sử dụng lớp giả {{cssxref(":host")}} hoặc {{cssxref(":host()")}} thay thế.

> [!NOTE]
> Lớp giả này không có tác dụng khi dùng bên ngoài shadow DOM.

[Độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của `:host-context()` là độ đặc hiệu của một [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes), cộng với độ đặc hiệu của bộ chọn được truyền vào làm tham số của hàm.

{{InteractiveExample("CSS Demo: :host-context()", "tabbed-shorter")}}

```css interactive-example
/* Following CSS is being applied inside the shadow DOM. */

:host-context(.container) {
  border: 5px dashed green;
}

:host-context(h1) {
  color: red;
}
```

```html interactive-example
<!-- elements outside shadow dom -->
<div class="container">
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
   a descendant of the selector argument given */
:host-context(h1) {
  font-weight: bold;
}

/* Changes paragraph text color from black to white when
   a .dark-theme class is applied to the document body */
p {
  color: black;
}

:host-context(body.dark-theme) p {
  color: white;
}
```

## Cú pháp

```css-nolint
:host-context(<compound-selector>) {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu chọn lọc cho shadow host

Các đoạn mã sau được lấy từ [ví dụ host-selectors](https://github.com/mdn/web-components-examples/tree/main/host-selectors) ([xem trực tiếp](https://mdn.github.io/web-components-examples/host-selectors/)).

Trong ví dụ này chúng ta có một phần tử tùy chỉnh cơ bản — `<context-span>` — mà bạn có thể bao quanh văn bản:

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
  ":host(.footer) { color : red; }" +
  ":host { background: rgb(0 0 0 / 10%); padding: 2px 5px; }";
```

Quy tắc `:host-context(h1) { font-style: italic; }` và `:host-context(h1)::after { content: " - no links in headers!" }` tạo kiểu cho phiên bản của phần tử `<context-span>` (shadow host trong trường hợp này) bên trong `<h1>`. Chúng tôi đã dùng nó để làm rõ rằng phần tử tùy chỉnh không nên xuất hiện bên trong `<h1>` trong thiết kế của chúng tôi.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web components](/en-US/docs/Web/API/Web_components)
- CSS {{cssxref(":host")}} pseudo-class
- CSS {{cssxref(":host()")}} pseudo-class
- CSS {{cssxref(":state",":state()")}} pseudo-class
- CSS {{CSSXref("::slotted")}} pseudo-element
- HTML {{HTMLElement("template")}} element
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
