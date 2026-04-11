---
title: "MouseEvent: altKey property"
short-title: altKey
slug: Web/API/MouseEvent/altKey
page-type: web-api-instance-property
browser-compat: api.MouseEvent.altKey
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`MouseEvent.altKey`** là giá trị boolean cho biết liệu phím <kbd>alt</kbd> có được nhấn hay không khi xảy ra sự kiện chuột nhất định.

Xin lưu ý rằng trình duyệt không phải lúc nào cũng phát hiện được khóa <kbd>alt</kbd> trên một số hệ điều hành.
Ví dụ: trên một số biến thể Linux, nhấp chuột trái kết hợp với phím <kbd>alt</kbd> được sử dụng để di chuyển hoặc thay đổi kích thước cửa sổ.

> [!NOTE]
> Trên bàn phím Macintosh, phím này còn được gọi là phím <kbd>option</kbd>.

## Giá trị

Một giá trị boolean, trong đó `true` chỉ ra rằng phím được nhấn và `false` chỉ ra rằng phím đó được _not_ nhấn.

## Ví dụ

Ví dụ này ghi lại thuộc tính `altKey` khi bạn kích hoạt sự kiện {{domxref("Element/click_event", "click")}}.

### HTML

```html
<p>Click anywhere to test the <code>altKey</code> property.</p>
<p id="log"></p>
```

### JavaScript

```js
let log = document.querySelector("#log");
document.addEventListener("click", logKey);

function logKey(e) {
  log.textContent = `The alt key is pressed: ${e.altKey}`;
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
