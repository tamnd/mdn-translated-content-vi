---
title: "CaretPosition: thuộc tính offset"
short-title: offset
slug: Web/API/CaretPosition/offset
page-type: web-api-instance-property
browser-compat: api.CaretPosition.offset
---

{{APIRef("CSSOM view API")}}

Thuộc tính **`offset`** của giao diện {{domxref("CaretPosition")}} trả về một số nguyên biểu thị độ lệch của vùng chọn trong nút tại vị trí con trỏ soạn thảo.

Đây sẽ là độ lệch ký tự trong nút văn bản hoặc chỉ mục của nút con được chọn trong nút phần tử.

## Giá trị

Một số nguyên.

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
