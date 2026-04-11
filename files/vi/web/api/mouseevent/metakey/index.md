---
title: "MouseEvent: metaKey property"
short-title: metaKey
slug: Web/API/MouseEvent/metaKey
page-type: web-api-instance-property
browser-compat: api.MouseEvent.metaKey
---

{{APIRef("Pointer Events")}}

Thuộc tính **`MouseEvent.metaKey`** chỉ đọc là một giá trị boolean cho biết liệu phím <kbd>meta</kbd> có được nhấn hay không khi một sự kiện chuột nhất định xảy ra.

Xin lưu ý rằng nhiều hệ điều hành liên kết chức năng đặc biệt với phím <kbd>meta</kbd>, vì vậy thuộc tính này có thể là `false` ngay cả khi phím này thực sự được nhấn.
Ví dụ trên Windows, phím này có thể mở menu Start.

> [!NOTE]
> Trên bàn phím Macintosh, phím này là phím <kbd>command</kbd> (<kbd>⌘</kbd>).
> Trên bàn phím Windows, phím này là phím Windows (<kbd>⊞</kbd>).

## Giá trị

Một giá trị boolean, trong đó `true` chỉ ra rằng phím được nhấn và `false` chỉ ra rằng phím đó được _not_ nhấn.

## Ví dụ

Ví dụ này ghi lại thuộc tính `metaKey` khi bạn kích hoạt sự kiện {{domxref("Element/click_event", "click")}}.

### HTML

```html
<p>Click anywhere to test the <code>metaKey</code> property.</p>
<p id="log"></p>
```

### JavaScript

```js
let log = document.querySelector("#log");
document.addEventListener("click", logKey);

function logKey(e) {
  log.textContent = `The meta key is pressed: ${e.metaKey}`;
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
