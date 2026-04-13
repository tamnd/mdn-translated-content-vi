---
title: "MouseEvent: ctrlKey property"
short-title: ctrlKey
slug: Web/API/MouseEvent/ctrlKey
page-type: web-api-instance-property
browser-compat: api.MouseEvent.ctrlKey
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`MouseEvent.ctrlKey`** là một giá trị boolean cho biết liệu phím <kbd>ctrl</kbd> có được nhấn hay không khi một sự kiện chuột nhất định xảy ra.

Trên bàn phím Macintosh, phím này được gắn nhãn là phím <kbd>control</kbd>. Ngoài ra, hãy lưu ý rằng trên máy Mac, một cú nhấp chuột kết hợp với phím <kbd>control</kbd> sẽ bị hệ điều hành chặn và được sử dụng để mở menu ngữ cảnh, vì vậy `ctrlKey` không thể phát hiện được trong các sự kiện nhấp chuột.

Tính năng thu phóng bằng cách sử dụng bàn di chuột cũng gửi một sự kiện {{domxref("Element/wheel_event", "wheel")}} mô phỏng với `ctrlKey` được đặt thành true.

## Giá trị

Một giá trị boolean, trong đó `true` chỉ ra rằng phím được nhấn và `false` chỉ ra rằng phím đó được _not_ nhấn.

## Ví dụ

Ví dụ này ghi lại thuộc tính `ctrlKey` khi bạn kích hoạt sự kiện {{domxref("Element/mousemove_event", "mousemove")}}.

### HTML

```html
<p id="log">The ctrl key was pressed while the cursor was moving: false</p>
```

### JavaScript

```js
const log = document.querySelector("#log");
window.addEventListener("mousemove", logKey);

function logKey(e) {
  log.textContent = `The ctrl key was pressed while the cursor was moving: ${e.ctrlKey}`;
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
