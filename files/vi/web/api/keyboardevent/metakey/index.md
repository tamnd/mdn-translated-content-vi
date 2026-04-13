---
title: "KeyboardEvent: thuộc tính metaKey"
short-title: metaKey
slug: Web/API/KeyboardEvent/metaKey
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.metaKey
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`KeyboardEvent.metaKey`** trả về một
giá trị boolean cho biết phím <kbd>Meta</kbd> có được nhấn
(`true`) hay không (`false`) khi sự kiện xảy ra. Một số hệ điều
hành có thể chặn phím nên nó không bao giờ được phát hiện.

> [!NOTE]
> Trên bàn phím Macintosh, đây là phím <kbd>⌘ Command</kbd>.

> [!NOTE]
> Trước Firefox 118, phím <kbd>⊞ Windows</kbd> được xử lý
> như một phím "OS" thay vì phím "Meta". `KeyboardEvent.metaKey` là
> `false` khi phím <kbd>⊞ Windows</kbd> được nhấn.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<button>Nhấp vào tôi với phím meta</button>

<p id="output"></p>
```

```js
document.querySelector("button").addEventListener("click", (e) => {
  document.querySelector("#output").textContent =
    `phím meta được nhấn? ${e.metaKey}`;
});
```

### Kết quả

{{ EmbedLiveSample('Examples', 400, 90) }}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("KeyboardEvent") }}
