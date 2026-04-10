---
title: "Event: thuộc tính composed"
short-title: composed
slug: Web/API/Event/composed
page-type: web-api-instance-property
browser-compat: api.Event.composed
---

{{APIRef("Shadow DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`composed`** của giao diện {{domxref("Event")}} trả về một giá trị boolean cho biết sự kiện có lan truyền qua ranh giới shadow DOM vào DOM tiêu chuẩn hay không.

Tất cả các sự kiện UI do UA gửi đi đều là composed (click/touch/mouseover/copy/paste, v.v.). Phần lớn các loại sự kiện khác không phải composed, nên sẽ trả về `false`. Ví dụ, điều này bao gồm các sự kiện tổng hợp được tạo ra mà không đặt tùy chọn `composed` thành `true`.

Việc lan truyền chỉ xảy ra nếu thuộc tính {{domxref("Event.bubbles", "bubbles")}} cũng là `true`. Tuy nhiên, các sự kiện chỉ composed khi đang ở pha capture cũng được xử lý tại host như thể chúng đang ở pha `AT_TARGET`. Bạn có thể xác định đường đi mà sự kiện sẽ theo qua shadow root đến DOM gốc bằng cách gọi {{domxref("Event.composedPath", "composedPath()")}}.

## Giá trị

Một giá trị boolean, là `true` nếu sự kiện sẽ đi từ shadow DOM sang DOM tiêu chuẩn sau khi chạm tới shadow root. (Tức là nút đầu tiên trong shadow DOM tại đó sự kiện bắt đầu lan truyền.)

Nếu giá trị này là `false`, shadow root sẽ là nút cuối cùng được đưa sự kiện tới.

## Ví dụ

Trong [ví dụ này](https://mdn.github.io/web-components-examples/composed-composed-path/), chúng ta định nghĩa hai custom element đơn giản, `<open-shadow>` và `<closed-shadow>`, cả hai đều lấy nội dung của thuộc tính văn bản của chúng rồi chèn vào shadow DOM của phần tử dưới dạng nội dung văn bản của một phần tử `<p>`. Điểm khác biệt duy nhất giữa hai phần tử là shadow root của chúng được gắn với chế độ `open` và `closed` tương ứng.

Hai định nghĩa trông như sau:

```js
customElements.define(
  "open-shadow",
  class extends HTMLElement {
    constructor() {
      super();

      const pElem = document.createElement("p");
      pElem.textContent = this.getAttribute("text");

      const shadowRoot = this.attachShadow({
        mode: "open",
      });

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

      const shadowRoot = this.attachShadow({
        mode: "closed",
      });

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

Khi bạn nhấp vào phần tử `<open-shadow>` rồi sau đó là phần tử `<closed-shadow>`, bạn sẽ nhận thấy hai điều.

1. Thuộc tính `composed` trả về `true` vì sự kiện `click` luôn có thể lan truyền qua ranh giới shadow.
2. Giá trị của `composedPath` khác nhau giữa hai phần tử.

Đường đi composed của phần tử `<open-shadow>` là:

```plain
Array [ p, ShadowRoot, open-shadow, body, html, HTMLDocument https://mdn.github.io/web-components-examples/composed-composed-path/, Window ]
```

Trong khi đó, đường đi composed của phần tử `<closed-shadow>` như sau:

```plain
Array [ closed-shadow, body, html, HTMLDocument https://mdn.github.io/web-components-examples/composed-composed-path/, Window ]
```

Trong trường hợp thứ hai, các bộ lắng nghe sự kiện chỉ lan truyền đến chính phần tử `<closed-shadow>`, chứ không tới các nút bên trong ranh giới shadow.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
