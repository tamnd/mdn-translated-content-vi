---
title: "MouseEvent: shiftKey property"
short-title: shiftKey
slug: Web/API/MouseEvent/shiftKey
page-type: web-api-instance-property
browser-compat: api.MouseEvent.shiftKey
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`MouseEvent.shiftKey`** là giá trị boolean cho biết liệu phím <kbd>shift</kbd> có được nhấn hay không khi xảy ra sự kiện chuột nhất định.

## Giá trị

Một giá trị boolean, trong đó `true` chỉ ra rằng phím được nhấn và `false` chỉ ra rằng phím đó được _not_ nhấn.

## Ví dụ

Ví dụ này ghi lại thuộc tính `shiftKey` khi bạn kích hoạt sự kiện {{domxref("Element/click_event", "click")}}.

### HTML

```html
<p>Click anywhere to test the <code>shiftKey</code> property.</p>
<p id="log"></p>
```

### JavaScript

```js
let log = document.querySelector("#log");
document.addEventListener("click", logKey);

function logKey(e) {
  log.textContent = `The shift key is pressed: ${e.shiftKey}`;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("MouseEvent") }}
