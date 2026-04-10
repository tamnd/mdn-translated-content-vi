---
title: "Event: phương thức composedPath()"
short-title: composedPath()
slug: Web/API/Event/composedPath
page-type: web-api-instance-method
browser-compat: api.Event.composedPath
---

{{APIRef("Shadow DOM")}}{{AvailableInWorkers}}

Phương thức **`composedPath()`** của giao diện {{domxref("Event")}} trả về đường đi của sự kiện, là một mảng các đối tượng mà trên đó các bộ lắng nghe sẽ được gọi. Điều này không bao gồm các nút trong shadow tree nếu shadow root được tạo với chế độ {{domxref("ShadowRoot.mode")}} là `closed`.

## Cú pháp

```js-nolint
composedPath()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("EventTarget")}} đại diện cho các đối tượng mà một bộ lắng nghe sự kiện sẽ được gọi trên đó.

## Ví dụ

Trong ví dụ sau, mà bạn có thể thử tại [https://mdn.github.io/web-components-examples/composed-composed-path/](https://mdn.github.io/web-components-examples/composed-composed-path/), chúng ta định nghĩa hai custom element đơn giản, `<open-shadow>` và `<closed-shadow>`, cả hai đều lấy nội dung của thuộc tính văn bản của chúng rồi chèn vào shadow DOM của phần tử dưới dạng nội dung văn bản của một phần tử `<p>`. Điểm khác biệt duy nhất giữa hai phần tử là shadow root của chúng được gắn với chế độ `open` và `closed` tương ứng.

```js
customElements.define(
  "open-shadow",
  class extends HTMLElement {
    constructor() {
      super();

      const pElem = document.createElement("p");
      pElem.textContent = this.getAttribute("text");

      const shadowRoot = this.attachShadow({ mode: "open" });
      shadowRoot.appendChild(pElem);
    }
  },
);

customElements.define(
  "closed-shadow",
  class extends HTMLElement {
    constructor() {
      super();

      const pElem = document.createElement("p");
      pElem.textContent = this.getAttribute("text");

      const shadowRoot = this.attachShadow({ mode: "closed" });
      shadowRoot.appendChild(pElem);
    }
  },
);
```

Sau đó chúng ta chèn một phần tử của mỗi loại vào trang:

```html
<open-shadow text="I have an open shadow root"></open-shadow>
<closed-shadow text="I have a closed shadow root"></closed-shadow>
```

Tiếp theo, thêm một bộ lắng nghe sự kiện click vào phần tử `<html>`:

```js
document.querySelector("html").addEventListener("click", (e) => {
  console.log(e.composed);
  console.log(e.composedPath());
});
```

Khi bạn nhấp vào phần tử `<open-shadow>` rồi sau đó là phần tử `<closed-shadow>`, bạn sẽ nhận thấy hai điều. Thứ nhất, thuộc tính `composed` trả về `true` vì sự kiện `click` luôn có thể lan truyền qua ranh giới shadow. Thứ hai, bạn sẽ thấy giá trị của `composedPath` khác nhau giữa hai phần tử. Đường đi composed của phần tử `<open-shadow>` là:

```plain
Array [ p, ShadowRoot, open-shadow, body, html, HTMLDocument https://mdn.github.io/web-components-examples/composed-composed-path/, Window ]
```

Còn đường đi composed của phần tử `<closed-shadow>` như sau:

```plain
Array [ closed-shadow, body, html, HTMLDocument https://mdn.github.io/web-components-examples/composed-composed-path/, Window ]
```

Trong trường hợp thứ hai, các bộ lắng nghe sự kiện chỉ lan truyền đến chính phần tử `<closed-shadow>`, chứ không tới các nút bên trong ranh giới shadow.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
