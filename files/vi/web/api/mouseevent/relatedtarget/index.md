---
title: "MouseEvent: relatedTarget property"
short-title: relatedTarget
slug: Web/API/MouseEvent/relatedTarget
page-type: web-api-instance-property
browser-compat: api.MouseEvent.relatedTarget
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`MouseEvent.relatedTarget`** là mục tiêu phụ cho sự kiện chuột, nếu có.

Đó là:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Tên sự kiện</th>
      <th><code>target</code></th>
      <th><code>relatedTarget</code></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{domxref("Element/mouseenter_event", "mouseenter")}}</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã đi vào</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã rời khỏi</td>
    </tr>
    <tr>
      <td>{{domxref("Element/mouseleave_event", "mouseleave")}}</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã rời khỏi</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã đi vào</td>
    </tr>
    <tr>
      <td>{{domxref("Element/mouseout_event", "mouseout")}}</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã rời khỏi</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã đi vào</td>
    </tr>
    <tr>
      <td>{{domxref("Element/mouseover_event", "mouseover")}}</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã đi vào</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã rời khỏi</td>
    </tr>
    <tr>
      <td>{{domxref("HTMLElement/dragenter_event", "dragenter")}}</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã đi vào</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã rời khỏi</td>
    </tr>
    <tr>
      <td>{{domxref("HTMLElement/dragleave_event", "dragleave")}}</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã rời khỏi</td>
      <td>{{domxref("EventTarget")}} mà thiết bị trỏ đã đi vào</td>
    </tr>
  </tbody>
</table>

Đối với các sự kiện không có mục tiêu phụ, `relatedTarget` trả về `null`.

{{domxref("FocusEvent.relatedTarget")}} là một thuộc tính tương tự cho các sự kiện focus.

## Giá trị

Một đối tượng {{domxref("EventTarget")}} hoặc `null`.

## Ví dụ

Hãy thử di chuyển con trỏ chuột vào và ra khỏi hộp màu đỏ và xanh lam.

### HTML

```html
<body id="body">
  <div id="outer">
    <div id="red"></div>
    <div id="blue"></div>
  </div>
  <p id="log"></p>
</body>
```

### CSS

```css
#outer {
  width: 250px;
  height: 125px;
  display: flex;
}

#red {
  flex-grow: 1;
  background: red;
}

#blue {
  flex-grow: 1;
  background: blue;
}

#log {
  max-height: 120px;
  overflow-y: scroll;
}
```

### JavaScript

```js
const mouseoutLog = document.getElementById("log"),
  red = document.getElementById("red"),
  blue = document.getElementById("blue");

red.addEventListener("mouseover", overListener);
red.addEventListener("mouseout", outListener);
blue.addEventListener("mouseover", overListener);
blue.addEventListener("mouseout", outListener);

function outListener(event) {
  let related = event.relatedTarget ? event.relatedTarget.id : "unknown";

  mouseoutLog.innerText = `\nfrom ${event.target.id} into ${related} ${mouseoutLog.innerText}`;
}

function overListener(event) {
  let related = event.relatedTarget ? event.relatedTarget.id : "unknown";

  mouseoutLog.innerText = `\ninto ${event.target.id} from ${related} ${mouseoutLog.innerText}`;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 700, 280)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("MouseEvent") }}
