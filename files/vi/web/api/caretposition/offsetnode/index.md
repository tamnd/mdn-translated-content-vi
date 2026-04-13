---
title: "CaretPosition: thuộc tính offsetNode"
short-title: offsetNode
slug: Web/API/CaretPosition/offsetNode
page-type: web-api-instance-property
browser-compat: api.CaretPosition.offsetNode
---

{{APIRef("CSSOM view API")}}

Thuộc tính **`offsetNode`** của giao diện {{domxref("CaretPosition")}} trả về một {{domxref("Node")}} chứa nút được tìm thấy tại vị trí của con trỏ soạn thảo.

## Giá trị

Một {{domxref("Node")}}.

## Ví dụ

Ví dụ này ghi lại `offsetNode` và `offset` của vị trí con trỏ soạn thảo khi nhấp bên trong trường nhập liệu.

```html
<input aria-label="text field" value="Click inside this input field" />
```

```html hidden
<pre id="log"></pre>
```

```css hidden
input {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  box-sizing: border-box;
}

#log {
  height: 200px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js
document.querySelector("input").addEventListener("click", (event) => {
  const x = event.clientX;
  const y = event.clientY;

  const caret = document.caretPositionFromPoint?.(x, y);
  if (!caret) {
    log("Not supported");
    return;
  }

  const node = caret.offsetNode;
  const offset = caret.offset;

  log(`offsetNode: ${node}`);
  log(`offset: ${offset}`);
});
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

{{EmbedLiveSample("Ví dụ", "", 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node")}}
- {{domxref("Document.caretPositionFromPoint()")}}
