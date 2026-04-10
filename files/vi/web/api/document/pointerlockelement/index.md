---
title: "Document: thuộc tính pointerLockElement"
short-title: pointerLockElement
slug: Web/API/Document/pointerLockElement
page-type: web-api-instance-property
browser-compat: api.Document.pointerLockElement
---

{{APIRef("Pointer Lock API")}}

Thuộc tính chỉ đọc **`pointerLockElement`** của giao diện {{domxref("Document")}} cung cấp phần tử được đặt làm mục tiêu cho các sự kiện chuột trong khi con trỏ bị khóa.
Nó là `null` nếu khóa đang chờ xử lý, con trỏ được mở khóa, hoặc mục tiêu nằm trong tài liệu khác.

## Giá trị

Một {{domxref("Element")}} hoặc `null`.

## Ví dụ

### Kiểm tra trạng thái khóa con trỏ

Ví dụ này chứa một phần tử {{htmlelement("div")}} chứa một {{htmlelement("button")}}. Nhấp vào nút sẽ yêu cầu khóa con trỏ cho `<div>`.

Ví dụ cũng lắng nghe sự kiện {{domxref("Document/pointerlockchange_event", "pointerlockchange")}}: khi sự kiện này được kích hoạt, trình xử lý sự kiện sẽ vô hiệu hóa nút "Lock" nếu một phần tử trong tài liệu có khóa con trỏ, và kích hoạt nút nếu không.

Hiệu ứng của điều này là nếu bạn nhấp vào nút "Lock", con trỏ bị khóa và nút bị vô hiệu hóa: nếu bạn sau đó thoát khỏi khóa con trỏ (ví dụ: bằng cách nhấn phím <kbd>Escape</kbd>), nút được kích hoạt lại.

#### HTML

```html
<div id="container">
  <button id="lock">Lock</button>
</div>
```

#### CSS

```css
div {
  height: 100px;
  width: 200px;
  border: 2px solid blue;
}
```

#### JavaScript

```js
const lock = document.querySelector("#lock");
const container = document.querySelector("#container");

lock.addEventListener("click", () => {
  container.requestPointerLock();
});

document.addEventListener("pointerlockchange", () => {
  const locked = document.pointerLockElement;
  lock.disabled = Boolean(locked);
});
```

#### Kết quả

{{EmbedLiveSample("Checking pointer lock status")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Document.exitPointerLock()") }}
- {{ domxref("Element.requestPointerLock()") }}
- [Pointer Lock](/en-US/docs/Web/API/Pointer_Lock_API)
