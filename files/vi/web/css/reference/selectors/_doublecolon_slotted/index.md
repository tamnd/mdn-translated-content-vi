---
title: ::slotted()
slug: Web/CSS/Reference/Selectors/::slotted
page-type: css-pseudo-element
browser-compat: css.selectors.slotted
sidebar: cssref
---

Phần tử giả **`::slotted()`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử nào đã được đặt vào một slot bên trong HTML template (xem [Sử dụng template và slot](/en-US/docs/Web/API/Web_components/Using_templates_and_slots) để biết thêm thông tin).

Phần tử giả này chỉ hoạt động khi được dùng bên trong CSS đặt trong [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM). Lưu ý rằng bộ chọn này sẽ không chọn một node văn bản được đặt vào slot; nó chỉ nhắm mục tiêu vào các phần tử thực sự.

{{InteractiveExample("CSS Demo: ::slotted()", "tabbed-shorter")}}

```css interactive-example
/* This CSS is being applied inside the shadow DOM. */

::slotted(.content) {
  background-color: aqua;
}

h2 ::slotted(span) {
  background: silver;
}
```

```html interactive-example
<template id="card-template">
  <div>
    <h2><slot name="caption">title goes here</slot></h2>
    <slot name="content">content goes here</slot>
  </div>
</template>

<my-card>
  <span slot="caption">Error</span>
  <p class="content" slot="content">Build failed!</p>
</my-card>
```

```js interactive-example
customElements.define(
  "my-card",
  class extends HTMLElement {
    constructor() {
      super();

      const template = document.getElementById("card-template");
      const shadow = this.attachShadow({ mode: "open" });
      shadow.appendChild(document.importNode(template.content, true));

      const elementStyle = document.createElement("style");
      elementStyle.textContent = `
        div {
          width: 200px;
          border: 2px dotted red;
          border-radius: 4px;
        }`;
      shadow.appendChild(elementStyle);

      const cssTab = document.querySelector("#css-output");
      const editorStyle = document.createElement("style");
      editorStyle.textContent = cssTab.textContent;
      shadow.appendChild(editorStyle);
      cssTab.addEventListener("change", () => {
        editorStyle.textContent = cssTab.textContent;
      });
    }
  },
);
```

```css
/* Selects any element placed inside a slot */
::slotted(*) {
  font-weight: bold;
}

/* Selects any <span> placed inside a slot */
::slotted(span) {
  font-weight: bold;
}
```

## Cú pháp

```css-nolint
::slotted(<compound-selector>) {
  /* ... */
}
```

## Ví dụ

### Làm nổi bật các phần tử được slot

Trong ví dụ này, chúng ta sử dụng một template với ba slot:

```html
<template id="person-template">
  <div>
    <h2>Personal ID Card</h2>
    <slot name="person-name">NAME MISSING</slot>
    <ul>
      <li><slot name="person-age">AGE MISSING</slot></li>
      <li><slot name="person-occupation">OCCUPATION MISSING</slot></li>
    </ul>
  </div>
</template>
```

Chúng ta định nghĩa phần tử tùy chỉnh `<person-details>`. Trong trường hợp này, chúng ta thêm kiểu bằng JavaScript, mặc dù chúng ta có thể đã thêm chúng trong một block {{HTMLElement("style")}} bên trong {{HTMLElement("template")}} với hiệu quả tương tự:

```js
customElements.define(
  "person-details",
  class extends HTMLElement {
    constructor() {
      super();
      const template = document.getElementById("person-template");

      const shadowRoot = this.attachShadow({ mode: "open" });

      const style = document.createElement("style");
      style.textContent =
        "div { padding: 10px; border: 1px solid gray; width: 200px; margin: 10px; }" +
        "h2 { margin: 0 0 10px; }" +
        "ul { margin: 0; }" +
        "p { margin: 10px 0; }" +
        "::slotted(*) { color: gray; font-family: sans-serif; } " +
        "::slotted(span) {text-decoration: underline;} ";

      shadowRoot.appendChild(style);
      shadowRoot.appendChild(document.importNode(template.content, true));
    }
  },
);
```

Khi điền nội dung vào phần tử `style`, bạn sẽ thấy rằng chúng ta chọn tất cả các phần tử được slot (`::slotted(*)`) và đặt cho chúng font chữ và màu khác. Điều này phân biệt chúng với các slot chưa được điền. Chúng ta đã tạo kiểu cho tất cả các {{HTMLElement("span")}} được slot (`::slotted(span)`) để phân biệt `<span>` với {{HTMLElement("p")}}.

Đánh dấu của chúng ta bao gồm ba phần tử tùy chỉnh, trong đó có một phần tử tùy chỉnh với tên slot không hợp lệ theo thứ tự nguồn khác với `<template>`:

```html
<person-details>
  <p slot="person-name">Wonder Woman</p>
  <span slot="person-age">Immortal</span>
  <span slot="person-occupation">Superhero</span>
</person-details>

<person-details>
  <p slot="person-name">Malala Yousafzai</p>
  <span slot="person-age">17</span>
  <span slot="person-occupation">Activist</span>
</person-details>

<person-details>
  <span slot="person-age">44</span>
  <span slot="not-a-slot-name">Time traveler</span>
  <p slot="person-name">Dr. Who</p>
</person-details>
```

#### Kết quả

{{EmbedLiveSample('Highlighting_slotted_elements', 500, 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":host")}}
- {{cssxref(":host()")}}
- {{cssxref(":host-context()")}}
- {{cssxref(":has-slotted")}}
- Module [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping)
- Thuộc tính HTML [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot)
- Phần tử HTML {{HTMLElement("slot")}}
- Phần tử HTML {{HTMLElement("template")}}
- [Web components](/en-US/docs/Web/API/Web_components)
