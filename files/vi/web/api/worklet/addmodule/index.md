---
title: "Worklet: phương thức addModule()"
short-title: addModule()
slug: Web/API/Worklet/addModule
page-type: web-api-instance-method
browser-compat: api.Worklet.addModule
---

{{APIRef("Worklets")}}{{SecureContext_Header}}

Phương thức **`addModule()`** của giao diện {{domxref("Worklet")}} tải mô-đun trong tệp JavaScript đã cho và thêm nó vào `Worklet` hiện tại.

## Cú pháp

```js-nolint
addModule(moduleURL)
addModule(moduleURL, options)
```

### Tham số

- `moduleURL`
  - : Một {{jsxref("String")}} chứa URL của tệp JavaScript có mô-đun cần thêm.
- `options` {{optional_inline}}
  - : Một đối tượng với bất kỳ tùy chọn nào sau đây:
    - `credentials`
      - : Một giá trị {{domxref("Request.credentials")}} cho biết có gửi thông tin xác thực (ví dụ: cookie và xác thực HTTP) khi tải mô-đun hay không. Có thể là `"omit"`, `"same-origin"`, hoặc `"include"`. Mặc định là `"same-origin"`. Xem thêm {{domxref("Request.credentials")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết khi mô-đun từ URL đã cho được thêm vào. Promise không trả về giá trị nào.

### Ngoại lệ

Nếu `addModule()` thất bại, nó từ chối promise và gửi một trong các lỗi sau đến trình xử lý từ chối.

- `AbortError` {{domxref("DOMException")}}
  - : Script được chỉ định không hợp lệ hoặc không thể tải.
- `SyntaxError` {{domxref("DOMException")}}
  - : `moduleURL` được chỉ định không hợp lệ.

## Ví dụ

### Ví dụ AudioWorklet

```js
const audioCtx = new AudioContext();
const audioWorklet = audioCtx.audioWorklet;
audioWorklet.addModule("modules/bypassFilter.js", {
  credentials: "omit",
});
```

### Ví dụ PaintWorklet

```js
CSS.paintWorklet.addModule(
  "https://mdn.github.io/houdini-examples/cssPaint/intro/worklets/hilite.js",
);
```

Sau khi script đã được thêm vào [paint worklet](/en-US/docs/Web/API/CSS/paintWorklet_static), hàm {{cssxref("image/paint", "paint()")}} của CSS có thể được dùng để bao gồm hình ảnh được tạo bởi worklet:

```css
@supports (background-image: paint(id)) {
  h1 {
    background-image: paint(hollow-highlights, filled, 3px);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
