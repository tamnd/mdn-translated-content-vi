---
title: vector-effect
slug: Web/CSS/Reference/Properties/vector-effect
page-type: css-property
browser-compat: css.properties.vector-effect
sidebar: cssref
---

Thuộc tính **`vector-effect`** của [CSS](/vi/docs/Web/CSS) loại bỏ một số [hiệu ứng biến đổi](/vi/docs/Web/SVG/Reference/Attribute/transform) trong SVG, từ đó cho phép các hiệu ứng như một con đường trên bản đồ giữ nguyên độ rộng dù bản đồ được phóng to hay thu nhỏ, hoặc cho phép chú thích sơ đồ giữ nguyên vị trí và kích thước bất kể các biến đổi khác. Thuộc tính này chỉ có thể dùng với các phần tử SVG chấp nhận thuộc tính {{SVGAttr("vector-effect")}}. Khi được sử dụng, giá trị CSS sẽ ghi đè bất kỳ giá trị nào của thuộc tính `vector-effect` của phần tử.

## Cú pháp

```css
/* Các từ khóa */
vector-effect: none;
vector-effect: non-scaling-stroke;

/* Giá trị toàn cục */
vector-effect: inherit;
vector-effect: initial;
vector-effect: revert;
vector-effect: revert-layer;
vector-effect: unset;
```

### Giá trị

- `none`
  - : Không áp dụng hiệu ứng vector nào cho phần tử, nghĩa là phần tử sẽ bị ảnh hưởng đầy đủ bởi các biến đổi như bình thường.
- `non-scaling-stroke`
  - : Độ rộng nét viền được vẽ của phần tử sẽ bằng vật lý với độ rộng nét viền đã được xác định, ngay cả khi phần tử đã được phóng to hoặc thu nhỏ do các biến đổi của chính nó hoặc hệ tọa độ của nó. Điều này đúng cho dù phần tử được thu phóng bằng biến đổi hay bằng cách thay đổi kích thước vật lý của toàn bộ ảnh.

> [!NOTE]
> Thông số kỹ thuật định nghĩa ba giá trị khác là `non-scaling-size`, `non-rotation` và `fixed-position`, nhưng chúng chưa có triển khai nào và được coi là có nguy cơ bị loại bỏ.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ngăn chặn thu phóng nét viền SVG bằng CSS

Ở đây, chúng ta bắt đầu với một ảnh SVG 200x100 chứa hai hình chữ nhật bên trong một nhóm. Nhóm được phóng to và xoay. Hình chữ nhật thứ hai có class là `thinned`.

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 100">
  <g
    transform="scale(2.3) rotate(23)"
    transform-origin="100 50"
    stroke-width="3"
    stroke="orange"
    fill="#ddeeff88">
    <rect x=" 60" y="20" width="30" height="60" />
    <rect x="110" y="20" width="30" height="60" class="thinned" />
  </g>
</svg>
```

Chúng ta áp dụng `width: 500px` cho ảnh SVG này để làm nó lớn hơn kích thước nội tại, và đặt {{SVGElement("rect")}} có class là `thinned` để có nét viền không thu phóng.

```css
svg {
  width: 500px;
}
svg rect.thinned {
  vector-effect: non-scaling-stroke;
}
```

Kết quả là hình chữ nhật đầu tiên có độ rộng nét viền rõ ràng (hiển thị) khoảng 17, trong khi hình chữ nhật thứ hai vẫn có độ rộng nét viền rõ ràng là 3 dù đã được phóng to theo cùng cách với hình chữ nhật đầu tiên.

{{EmbedLiveSample("Preventing SVG stroke scaling with CSS", "500", "250")}}

### Ghi đè giá trị thu phóng nét viền SVG bằng CSS

Trong trường hợp này, chúng ta bắt đầu với ảnh SVG tương tự như ví dụ trước. Ở đây, phần tử {{SVGElement("g")}} được xoay như trước, nhưng không áp dụng thu phóng cho nó. Các phần tử `<rect>` được cho điểm gốc chung cho các biến đổi, và thuộc tính SVG `vector-effect` của chúng được đặt thành giá trị `none`.

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 100">
  <g
    transform="rotate(23)"
    transform-origin="100 50"
    stroke-width="3"
    stroke="orange"
    fill="#ddeeff88">
    <rect
      x=" 60"
      y="20"
      width="30"
      height="60"
      transform-origin="100 50"
      vector-effect="none" />
    <rect
      x="110"
      y="20"
      width="30"
      height="60"
      transform-origin="100 50"
      vector-effect="none"
      class="thinned" />
  </g>
</svg>
```

Như trước, SVG được làm lớn hơn kích thước nội tại bằng CSS. Lần này, thu phóng được áp dụng trực tiếp cho các phần tử `<rect>`, và hình chữ nhật thứ hai được đặt để có nét viền không thu phóng.

```css
svg {
  width: 500px;
}
svg rect {
  transform: scale(2.3);
}
svg rect.thinned {
  vector-effect: non-scaling-stroke;
}
```

Kết quả về mặt hình ảnh giống hệt ví dụ trước. Điều chúng ta thấy là giá trị thuộc tính `none` bị ghi đè bởi giá trị CSS `non-scaling-stroke`, và hiệu ứng vector được áp dụng ngay cả khi việc thu phóng được thực hiện trực tiếp trên `<rect>` thay vì trên phần tử cha `<g>`.

{{EmbedLiveSample("Overriding SVG stroke scaling values with CSS", "500", "250")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("stroke")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- Thuộc tính SVG {{SVGAttr("vector-effect")}}
