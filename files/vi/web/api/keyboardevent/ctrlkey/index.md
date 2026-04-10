---
title: "KeyboardEvent: thuộc tính ctrlKey"
short-title: ctrlKey
slug: Web/API/KeyboardEvent/ctrlKey
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.ctrlKey
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`KeyboardEvent.ctrlKey`** trả về một
giá trị boolean cho biết phím <kbd>control</kbd> có được nhấn
(`true`) hay không (`false`) khi sự kiện xảy ra.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<p>
  Nhấn bất kỳ phím ký tự nào, có hoặc không giữ phím CTRL.<br />
  Bạn cũng có thể sử dụng phím SHIFT cùng với phím CTRL.
</p>
<pre id="output"></pre>
```

```js
const output = document.getElementById("output");

function showChar(e) {
  output.textContent = `Phím KeyDown: "${e.key}"
Phím CTRL KeyDown: ${e.ctrlKey}
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
