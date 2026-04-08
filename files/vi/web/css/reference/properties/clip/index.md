---
title: clip
slug: Web/CSS/Reference/Properties/clip
page-type: css-property
status:
  - deprecated
browser-compat: css.properties.clip
sidebar: cssref
---

{{Deprecated_Header}}

> [!WARNING]
> Khuyến khích tác giả sử dụng thuộc tính {{cssxref("clip-path")}} thay thế.

Thuộc tính **`clip`** [CSS](/en-US/docs/Web/CSS) xác định phần hiển thị của một phần tử. Thuộc tính `clip` chỉ áp dụng cho các phần tử được định vị tuyệt đối — tức là các phần tử có {{cssxref("position","position:absolute")}} hoặc {{cssxref("position","position:fixed")}}.

## Cú pháp

```css
/* Giá trị từ khóa */
clip: auto;

/* Giá trị <shape> */
clip: rect(1px, 10em, 3rem, 2ch);

/* Giá trị toàn cục */
clip: inherit;
clip: initial;
clip: revert;
clip: revert-layer;
clip: unset;
```

### Giá trị

- `rect()`
  - : Một hình chữ nhật được xác định bằng hàm `rect()` có dạng `rect(<top>, <right>, <bottom>, <left>)`. Các giá trị `<top>` và `<bottom>` là độ lệch tính từ _cạnh viền bên trong phía trên_ của hộp, trong khi `<right>` và `<left>` là độ lệch tính từ _cạnh viền bên trong phía trái_ của hộp — tức là phạm vi của hộp padding.

    Các giá trị `<top>`, `<right>`, `<bottom>` và `<left>` có thể là {{cssxref("&lt;length&gt;")}} hoặc `auto`. Nếu giá trị của bất kỳ cạnh nào là `auto`, phần tử sẽ bị cắt theo _cạnh viền bên trong_ của cạnh đó.

> [!NOTE]
> Hàm `rect()` {{cssxref("shape")}} được dùng trong thuộc tính `clip` đã lỗi thời khác với hàm CSS {{cssxref("basic-shape/rect","rect()")}} dùng để định nghĩa {{cssxref("basic-shape")}}.

- `auto`
  - : Phần tử không bị cắt (mặc định). Điều này khác với `rect(auto, auto, auto, auto)`, vốn cắt theo các cạnh viền bên trong của phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cắt một hình ảnh

```html
<p class="dotted-border">
  <img src="macarons.png" alt="Original graphic" />
  <img id="top-left" src="macarons.png" alt="Graphic clipped to upper left" />
  <img id="middle" src="macarons.png" alt="Graphic clipped towards middle" />
  <img
    id="bottom-right"
    src="macarons.png"
    alt="Graphic clipped to bottom right" />
</p>
```

```css
.dotted-border {
  border: dotted;
  position: relative;
  width: 390px;
  height: 400px;
}

#top-left,
#middle,
#bottom-right {
  position: absolute;
  top: 0;
}

#top-left {
  left: 400px;
  clip: rect(0, 130px, 90px, 0);
}

#middle {
  left: 270px;
  clip: rect(100px, 260px, 190px, 130px);
}

#bottom-right {
  left: 140px;
  clip: rect(200px, 390px, 290px, 260px);
}
```

{{EmbedLiveSample('clipping_an_image', '', '450px')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("clip-path")}}
- {{cssxref("position")}}
- {{cssxref("mask")}}
- {{cssxref("shape-image-threshold")}}
- {{cssxref("shape-outside")}}
