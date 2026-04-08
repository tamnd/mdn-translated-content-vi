---
title: color-interpolation-filters
slug: Web/CSS/Reference/Properties/color-interpolation-filters
page-type: css-property
browser-compat: css.properties.color-interpolation-filters
sidebar: cssref
---

Thuộc tính **`color-interpolation-filters`** [CSS](/en-US/docs/Web/CSS) chỉ định không gian màu cho các phép toán hình ảnh được thực hiện thông qua hiệu ứng bộ lọc SVG. Nếu được khai báo rõ ràng, giá trị của thuộc tính CSS ghi đè bất kỳ giá trị nào được đặt trong thuộc tính {{SVGAttr("color-interpolation-filters")}} của phần tử.

> [!NOTE]
> Thuộc tính {{SVGAttr("color-interpolation-filters")}} chỉ liên quan đến các phép toán bộ lọc SVG. Nó _không_ có hiệu ứng trên các nguyên thủy bộ lọc như {{SVGElement("feOffset")}}, {{SVGElement("feImage")}}, {{SVGElement("feTile")}} và {{SVGElement("feFlood")}}, mà thay vào đó áp dụng cho các phần tử hiệu ứng bộ lọc khác nhau (ví dụ: {{SVGElement('feBlend')}}); xem trang SVG {{SVGAttr('color-interpolation-filters')}} để biết danh sách đầy đủ.

> [!NOTE]
> Cần nhớ rằng thuộc tính SVG {{SVGAttr('color-interpolation')}} có giá trị ban đầu là `sRGB`, trong khi `color-interpolation-filters` có giá trị ban đầu là `linearRGB`. Điều này có nghĩa là, trong trường hợp mặc định, các phép nội suy hiệu ứng bộ lọc xảy ra trong không gian màu khác với tất cả các phép nội suy màu khác.

## Cú pháp

```css
color-interpolation-filters: auto;
color-interpolation-filters: linearRGB;
color-interpolation-filters: sRGB;

/* Giá trị toàn cục */
color-interpolation-filters: inherit;
color-interpolation-filters: initial;
color-interpolation-filters: revert;
color-interpolation-filters: revert-layer;
color-interpolation-filters: unset;
```

### Giá trị

- `linearRGB`
  - : Chỉ ra rằng phép nội suy màu phải xảy ra trong không gian RGB được tuyến tính hóa như được mô tả trong [đặc tả sRGB](https://webstore.iec.ch/en/publication/6169). Đây là giá trị thuộc tính mặc định.
- `sRGB`
  - : Chỉ ra rằng phép nội suy màu phải xảy ra trong không gian màu sRGB được mã hóa gamma.
- `auto`
  - : Chỉ ra rằng tác nhân người dùng có thể chọn không gian `sRGB` hoặc `linearRGB` cho phép nội suy màu. Tùy chọn này chỉ ra rằng tác giả không yêu cầu phép nội suy màu phải xảy ra trong một không gian màu cụ thể.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("color-interpolation")}}
- Thuộc tính SVG {{SVGAttr("color-interpolation-filters")}}
- [Đặc tả sRGB](https://webstore.iec.ch/en/publication/6169)
