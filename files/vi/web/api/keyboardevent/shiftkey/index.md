---
title: "KeyboardEvent: thuộc tính shiftKey"
short-title: shiftKey
slug: Web/API/KeyboardEvent/shiftKey
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.shiftKey
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`KeyboardEvent.shiftKey`** là một
giá trị boolean cho biết phím <kbd>shift</kbd> có được nhấn
(`true`) hay không (`false`) khi sự kiện xảy ra.

Việc nhấn phím shift cũng có thể thay đổi {{domxref("KeyboardEvent/key", "key")} của sự kiện. Ví dụ: nhấn <kbd>B</kbd> tạo ra `key: "b"`, trong khi nhấn đồng thời <kbd>Shift</kbd> tạo ra `key: "B"`.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<p>
  Nhấn bất kỳ phím ký tự nào, có hoặc không giữ phím SHIFT.<br />
  Bạn cũng có thể sử dụng phím SHIFT cùng với phím ALT.
</p>
<pre id="output"></pre>
```

```js
const output = document.getElementById("output");

function showChar(e) {
  output.textContent = `Phím KeyDown: "${e.key}"
Phím SHIFT KeyDown: ${e.shiftKey}
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
