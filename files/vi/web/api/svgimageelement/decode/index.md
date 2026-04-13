---
title: "SVGImageElement: decode() method"
short-title: decode()
slug: Web/API/SVGImageElement/decode
page-type: web-api-instance-method
browser-compat: api.SVGImageElement.decode
---

{{APIRef("SVG")}}

Phương thức **`decode()`** của giao diện {{domxref("SVGImageElement")}} khởi tạo quá trình giải mã hình ảnh bất đồng bộ, trả về một {{jsxref('Promise')}} được giải quyết khi hình ảnh đã được giải mã và có thể an toàn thêm vào DOM.

## Cú pháp

```js-nolint
decode()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} được hoàn thành với `undefined` khi dữ liệu hình ảnh sẵn sàng để sử dụng, chẳng hạn như thêm vào DOM, thay thế hình ảnh hiện có, v.v.

### Ngoại lệ

Không có.

## Ví dụ

Trong ví dụ dưới đây, bạn có thể thấy hình ảnh trống trên trang trong khi hình ảnh đang được tải xuống:

```js
const SVG_NS = "http://www.w3.org/2000/svg";
const svg = document.querySelector("svg");

const img = document.createElementNS(SVG_NS, "image");
img.src = "img/logo.svg";
svg.appendChild(img);
```

Sử dụng `decode()` sẽ trì hoãn việc chèn hình ảnh vào DOM cho đến khi nó được tải xuống và giải mã hoàn toàn, tránh vấn đề hình ảnh trống:

```js
const SVG_NS = "http://www.w3.org/2000/svg";
const svg = document.querySelector("svg");

async function getImage() {
  const img = document.createElementNS(SVG_NS, "image");
  img.src = "img/logo.svg";
  await img.decode();
  svg.appendChild(img);
  const text = document.createElementNS(SVG_NS, "text");
  text.textContent = "Image is fully loaded!";
  svg.appendChild(text);
}
```

Điều này đặc biệt hữu ích nếu bạn đang hoán đổi động một hình ảnh hiện có với một hình ảnh mới, và cũng ngăn các lần vẽ không liên quan bên ngoài code này bị giữ lại trong khi hình ảnh đang giải mã.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.decode()")}}: Tương tự, nhưng dành cho các phần tử HTML `<img>`
- [What does the image decoding attribute actually do?](https://www.tunetheweb.com/blog/what-does-the-image-decoding-attribute-actually-do/) trên tunetheweb.com (2023)
