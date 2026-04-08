---
title: :host
slug: Web/CSS/Reference/Selectors/:host
page-type: css-pseudo-class
browser-compat: css.selectors.host
sidebar: cssref
---

**`:host`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) chọn shadow host của [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) chứa CSS đang được dùng bên trong — nói cách khác, điều này cho phép bạn chọn một phần tử tùy chỉnh từ bên trong shadow DOM của nó.

> [!NOTE]
> Lớp giả này không có tác dụng khi dùng bên ngoài shadow DOM.

{{InteractiveExample("CSS Demo: :host", "tabbed-shorter")}}

```css interactive-example
/* This CSS is being applied inside the shadow DOM. */

:host {
  background-color: aqua;
}
```

```html interactive-example
<h1 id="shadow-dom-host"></h1>
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
/* Selects a shadow root host */
:host {
  font-weight: bold;
}
```

## Cú pháp

```css
:host {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho shadow host

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
  ":host-context(article, aside) { color: gray; }" +
  ":host(.footer) { color : red; }" +
  ":host { background: rgb(0 0 0 / 10%); padding: 2px 5px; }";
```

Quy tắc `:host { background: rgb(0 0 0 / 10%); padding: 2px 5px; }` tạo kiểu cho tất cả các phiên bản của phần tử `<context-span>` (shadow host trong trường hợp này) trong tài liệu.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web components](/en-US/docs/Web/API/Web_components)
- {{cssxref(":host()")}}
- {{cssxref(":host-context()")}}
- {{CSSxref("::slotted")}}
- {{CSSxRef(":state",":state()")}}
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
