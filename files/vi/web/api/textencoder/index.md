---
title: TextEncoder
slug: Web/API/TextEncoder
page-type: web-api-interface
browser-compat: api.TextEncoder
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Giao diện **`TextEncoder`** cho phép bạn {{glossary("character encoding", "mã hóa")}} một chuỗi JavaScript bằng {{glossary("UTF-8")}}.

## Hàm tạo

- {{DOMxRef("TextEncoder.TextEncoder", "TextEncoder()")}}
  - : Tạo và trả về một `TextEncoder` mới.

## Thuộc tính thể hiện

_Giao diện `TextEncoder` không kế thừa thuộc tính nào._

- {{DOMxRef("TextEncoder.encoding")}} {{ReadOnlyInline}}
  - : Luôn trả về `utf-8`.

## Phương thức thể hiện

_Giao diện `TextEncoder` không kế thừa phương thức nào_.

- {{DOMxRef("TextEncoder.encode()")}}
  - : Nhận một chuỗi làm đầu vào và trả về một {{jsxref("Uint8Array")}} chứa chuỗi đã được mã hóa bằng UTF-8.
- {{DOMxRef("TextEncoder.encodeInto()")}}
  - : Nhận một chuỗi cần mã hóa và một {{jsxref("Uint8Array")}} đích để ghi văn bản UTF-8 kết quả vào đó, rồi trả về một đối tượng cho biết tiến trình mã hóa.
    Phương thức này có thể hiệu năng tốt hơn phương thức `encode()` cũ.

## Ví dụ

### Mã hóa sang UTF-8

Ví dụ này cho thấy cách mã hóa ký tự "€" sang UTF-8.

```html
<button id="encode">Encode</button>
<button id="reset">Reset</button>
<div id="output"></div>
```

```css hidden
div {
  margin: 1rem 0;
}
```

```js
const utf8encoder = new TextEncoder();
const text = "€";

const output = document.querySelector("#output");
const encodeButton = document.querySelector("#encode");
encodeButton.addEventListener("click", () => {
  output.textContent = utf8encoder.encode(text);
});

const resetButton = document.querySelector("#reset");
resetButton.addEventListener("click", () => {
  window.location.reload();
});
```

{{embedlivesample("Mã hóa sang UTF-8")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextDecoder")}} mô tả thao tác ngược lại.
