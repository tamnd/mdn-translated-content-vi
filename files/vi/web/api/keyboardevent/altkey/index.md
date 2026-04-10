---
title: "KeyboardEvent: thuộc tính altKey"
short-title: altKey
slug: Web/API/KeyboardEvent/altKey
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.altKey
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`KeyboardEvent.altKey`** là một
giá trị boolean cho biết phím <kbd>alt</kbd> (<kbd>Option</kbd> hoặc <kbd>⌥</kbd> trên macOS) có được nhấn (`true`) hay không (`false`) khi
sự kiện xảy ra.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<p>
  Nhấn bất kỳ phím ký tự nào, có hoặc không giữ phím ALT.<br />
  Bạn cũng có thể sử dụng phím SHIFT cùng với phím ALT.
</p>
<pre id="output"></pre>
```

```js
const output = document.getElementById("output");

function showChar(e) {
  output.textContent = `Phím KeyDown: "${e.key}"
Phím ALT KeyDown: ${e.altKey}
`;
}

document.addEventListener("keydown", showChar);
```

{{EmbedLiveSample("examples", "", "400")}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("KeyboardEvent") }}
