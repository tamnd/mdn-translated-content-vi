---
title: font-variant-position
slug: Web/CSS/Reference/Properties/font-variant-position
page-type: css-property
browser-compat: css.properties.font-variant-position
sidebar: cssref
---

Thuộc tính **`font-variant-position`** [CSS](/en-US/docs/Web/CSS) kiểm soát việc sử dụng các ký tự thay thế nhỏ hơn được định vị dạng chỉ số trên (superscript) hoặc chỉ số dưới (subscript).

Các ký tự được định vị so với đường cơ sở của phông chữ, đường này không thay đổi. Các ký tự này thường được sử dụng trong các phần tử {{HTMLElement("sub")}} và {{HTMLElement("sup")}}.

Khi việc sử dụng các ký tự thay thế này được kích hoạt, nếu một ký tự trong chuỗi không có ký tự được cải tiến về mặt ký pháp tương ứng, toàn bộ tập ký tự của chuỗi đó sẽ được hiển thị bằng phương pháp dự phòng, tổng hợp các ký tự đó.

Các ký tự thay thế này chia sẻ cùng hộp em và cùng đường cơ sở với phần còn lại của phông chữ. Chúng chỉ được cải thiện về mặt đồ họa và không ảnh hưởng đến chiều cao dòng hay các đặc điểm hộp khác.

## Cú pháp

```css
/* Giá trị từ khóa */
font-variant-position: normal;
font-variant-position: sub;
font-variant-position: super;

/* Giá trị toàn cục */
font-variant-position: inherit;
font-variant-position: initial;
font-variant-position: revert;
font-variant-position: revert-layer;
font-variant-position: unset;
```

Thuộc tính `font-variant-position` được chỉ định bằng một trong các giá trị từ khóa dưới đây.

### Giá trị

- `normal`
  - : Tắt các ký tự thay thế dạng chỉ số trên và chỉ số dưới.
- `sub`
  - : Kích hoạt các ký tự thay thế dạng chỉ số dưới. Nếu trong một chuỗi, một ký tự như vậy không có sẵn cho một ký tự cụ thể, tất cả các ký tự trong chuỗi sẽ được hiển thị bằng ký tự tổng hợp.
- `super`
  - : Kích hoạt các ký tự thay thế dạng chỉ số trên. Nếu trong một chuỗi, một ký tự như vậy không có sẵn cho một ký tự cụ thể, tất cả các ký tự trong chuỗi sẽ được hiển thị bằng ký tự tổng hợp.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thiết lập dạng chỉ số trên và chỉ số dưới

#### HTML

```html
<p class="normal">Normal!</p>
<p class="super">Super!</p>
<p class="sub">Sub!</p>
```

#### CSS

```css
p {
  display: inline;
}

.normal {
  font-variant-position: normal;
}

.super {
  font-variant-position: super;
}

.sub {
  font-variant-position: sub;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_superscript_and_subscript_forms') }}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
- {{cssxref("font-variant-alternates")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-numeric")}}
