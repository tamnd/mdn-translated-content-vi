---
title: "FontFace: hàm khởi tạo FontFace()"
short-title: FontFace()
slug: Web/API/FontFace/FontFace
page-type: web-api-constructor
browser-compat: api.FontFace.FontFace
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`FontFace()`** tạo một đối tượng {{domxref("FontFace")}} mới.

## Cú pháp

```js-nolint
new FontFace(family, source)
new FontFace(family, source, descriptors)
```

### Tham số

- `family`
  - : Chỉ định tên họ font có thể dùng để khớp với font face này khi áp dụng kiểu cho phần tử.

    Nhận cùng loại giá trị với descriptor {{cssxref("@font-face/font-family", "font-family")}} của {{cssxref("@font-face")}}. Giá trị này cũng có thể đọc và đặt qua thuộc tính [`FontFace.family`](/en-US/docs/Web/API/FontFace/family).

- `source`
  - : Nguồn font. Có thể là:
    - URL trỏ đến file font face.
    - Dữ liệu font nhị phân trong [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) hoặc [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray).

- `descriptors` {{optional_inline}}
  - : Tập các descriptor tùy chọn truyền dưới dạng đối tượng. Có thể chứa bất kỳ descriptor nào có trong `@font-face`:
    - `ascentOverride`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/ascent-override")}}.
    - `descentOverride`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/descent-override")}}.
    - `display`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/font-display")}}.
    - `featureSettings`
      - : Giá trị hợp lệ cho {{cssxref("font-feature-settings")}}.
    - `lineGapOverride`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/line-gap-override")}}.
    - `stretch`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/font-stretch")}}.
    - `style`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/font-style")}}.
    - `unicodeRange`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/unicode-range")}}.
    - `variationSettings`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/font-variation-settings")}}.
    - `weight`
      - : Giá trị hợp lệ cho {{cssxref("@font-face/font-weight")}}.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Xảy ra khi chuỗi descriptor không khớp với ngữ pháp của descriptor {{cssxref("@font-face")}} tương ứng, hoặc nguồn nhị phân không thể tải được. Lỗi này dẫn đến {{domxref("FontFace.status")}} được đặt thành `error`.

## Ví dụ

```js
async function loadFonts() {
  const font = new FontFace("my-font", 'url("my-font.woff")', {
    style: "normal",
    weight: "400",
    stretch: "condensed",
  });
  // chờ font tải xong
  await font.load();
  // thêm font vào tài liệu
  document.fonts.add(font);
  // bật font bằng class CSS
  document.body.classList.add("fonts-loaded");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face")}}
