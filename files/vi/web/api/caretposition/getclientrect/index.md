---
title: "CaretPosition: phương thức getClientRect()"
short-title: getClientRect()
slug: Web/API/CaretPosition/getClientRect
page-type: web-api-instance-method
browser-compat: api.CaretPosition.getClientRect
---

{{APIRef("CSSOM view API")}}

Phương thức `getClientRect()` của giao diện {{domxref("CaretPosition")}} trả về hình chữ nhật client cho phạm vi của con trỏ soạn thảo.

## Cú pháp

```js-nolint
getClientRect()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DOMRect")}}.

## Ví dụ

### Lấy vị trí trên màn hình của con trỏ soạn thảo

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

  const rect = caret.getClientRect();

  log(`Caret bounding rect: ${JSON.stringify(rect)}`);
  log(`Caret is at (${rect.x.toFixed(2)}, ${rect.y.toFixed(2)})`);
});
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

{{EmbedLiveSample("Lấy vị trí trên màn hình của con trỏ soạn thảo", "", 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMRect")}}
- {{domxref("Document.caretPositionFromPoint()")}}
- {{domxref("Element.getBoundingClientRect()")}}
