---
title: "SVGAnimationElement: sự kiện endEvent"
short-title: endEvent
slug: Web/API/SVGAnimationElement/endEvent_event
page-type: web-api-event
browser-compat: api.SVGAnimationElement.endEvent_event
---

{{APIRef("SVG")}}

Sự kiện **`endEvent`** của giao diện {{domxref("SVGAnimationElement")}} được kích hoạt khi đạt đến phần cuối hoạt động của hoạt hình.

> [!NOTE]
> Sự kiện này không được kích hoạt ở cuối đơn giản của mỗi lần lặp lại hoạt hình. Sự kiện này có thể được kích hoạt cả trong quá trình phát dòng thời gian bình thường (tức là theo lịch hoặc tương tác) cũng như trong trường hợp phần tử được kết thúc bằng phương thức DOM.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("endEvent", (event) => { })

onend = (event) => { }
```

## Loại sự kiện

Một {{domxref("TimeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("TimeEvent")}}

## Thuộc tính sự kiện

- {{domxref("TimeEvent.detail")}} {{ReadOnlyInline}}
  - : Một `long` chỉ định một số thông tin chi tiết về Sự kiện, tùy thuộc vào loại sự kiện. Đối với loại sự kiện này, cho biết số lần lặp lại của hoạt hình.
- {{domxref("TimeEvent.view")}} {{ReadOnlyInline}}
  - : Một {{glossary("WindowProxy")}} xác định cửa sổ mà sự kiện được tạo ra.

## Ví dụ

### Vòng tròn hoạt hình

```html
<svg xmlns="http://www.w3.org/2000/svg" width="300px" height="100px">
  <title>SVG SMIL Animate with Path</title>
  <circle cx="0" cy="50" r="50" fill="blue" stroke="black" stroke-width="1">
    <animateMotion path="M 0 0 H 300 Z" dur="5s" repeatCount="indefinite" />
  </circle>
</svg>

<hr />

<button>Stop animation</button>

<ul></ul>
```

```css
ul {
  height: 100px;
  border: 1px solid #dddddd;
  overflow-y: scroll;
  padding: 10px 30px;
}
```

```js
let svgElem = document.querySelector("svg");
let animateElem = document.querySelector("animateMotion");
let list = document.querySelector("ul");
let btn = document.querySelector("button");

animateElem.addEventListener("beginEvent", () => {
  let listItem = document.createElement("li");
  listItem.textContent = "beginEvent fired";
  list.appendChild(listItem);
});

animateElem.addEventListener("endEvent", () => {
  let listItem = document.createElement("li");
  listItem.textContent = "endEvent fired";
  list.appendChild(listItem);
});

animateElem.addEventListener("repeatEvent", (e) => {
  let listItem = document.createElement("li");
  let msg = "repeatEvent fired";
  if (e.detail) {
    msg += `; repeat number: ${e.detail}`;
  }
  listItem.textContent = msg;
  list.appendChild(listItem);
});

btn.addEventListener("click", () => {
  btn.disabled = true;
  animateElem.setAttribute("repeatCount", "1");
});
```

{{EmbedLiveSample('Animated_circle', '100%', '300')}}

### Tương đương với thuộc tính trình xử lý sự kiện

Lưu ý rằng bạn cũng có thể tạo trình xử lý sự kiện cho sự kiện `end` bằng thuộc tính trình xử lý `onend`:

```js
animateElem.onend = () => {
  console.log("endEvent fired");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hoạt hình SVG với SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
- Sự kiện {{domxref("SVGAnimationElement.beginEvent_event", "beginEvent")}}
- Sự kiện {{domxref("SVGAnimationElement.repeatEvent_event", "repeatEvent")}}
