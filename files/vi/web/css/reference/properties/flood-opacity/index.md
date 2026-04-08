---
title: flood-opacity
slug: Web/CSS/Reference/Properties/flood-opacity
page-type: css-property
browser-compat: css.properties.flood-opacity
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`flood-opacity`** xác định độ mờ đục của vùng phụ bộ lọc hiện tại trong các phần tử {{SVGElement("feFlood")}} và {{SVGElement("feDropShadow")}} bên trong {{SVGElement("filter")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("flood-opacity")}} của phần tử.

Giá trị thuộc tính ảnh hưởng đến kênh alpha của {{cssxref("flood-color")}}; nó có thể tăng tính trong suốt của `flood-color` nhưng không thể làm cho màu được xác định bởi thuộc tính `flood-color` đục hơn.

> [!NOTE]
> Thuộc tính `flood-opacity` chỉ áp dụng cho các phần tử {{SVGElement("feFlood")}} và {{SVGElement("feDropShadow")}} lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hay pseudo-element khác.

## Cú pháp

```css
/* Giá trị số và phần trăm */
flood-opacity: 0.2;
flood-opacity: 20%;

/* Giá trị toàn cục */
flood-opacity: inherit;
flood-opacity: initial;
flood-opacity: revert;
flood-opacity: revert-layer;
flood-opacity: unset;
```

### Giá trị

`<opacity-value>` là {{cssxref("number")}} hoặc {{cssxref("percentage")}} biểu thị độ mờ đục của phần tử SVG gradient `<flood>`.

- {{cssxref("number")}}
  - : Giá trị số trong khoảng từ `0` đến `1`, bao gồm cả hai đầu.

- {{cssxref("percentage")}}
  - : Giá trị phần trăm trong khoảng từ `0%` đến `100%`, bao gồm cả hai đầu.

Với `0` hoặc `0%`, flood hoàn toàn trong suốt. Với `1` hoặc `100%`, phần tử có độ mờ đục đầy đủ của giá trị `flood-color`, có thể hoặc không hoàn toàn đục.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định độ mờ đục flood của bộ lọc

Ví dụ này minh họa trường hợp sử dụng cơ bản của `flood-opacity`, và cách thuộc tính CSS `flood-opacity` có mức ưu tiên cao hơn thuộc tính `flood-opacity`.

#### HTML

Chúng ta có một SVG với một vài phần tử {{SVGElement("filter")}}, mỗi phần tử có một phần tử con {{SVGElement("feFlood")}}. Các `<feFlood>` xác định các bộ lọc là `seagreen`, với phần tử đầu tiên được khai báo bởi thuộc tính `flood-opacity` của nó là hoàn toàn đục và phần tử thứ hai hoàn toàn trong suốt. Chúng ta đã thêm hai phần tử {{SVGElement("rect")}}, mỗi phần tử có một thuộc tính filter.

```html
<svg viewBox="0 0 420 120" xmlns="http://www.w3.org/2000/svg">
  <filter id="flood1">
    <feFlood flood-color="seagreen" flood-opacity="1" />
  </filter>
  <filter id="flood2">
    <feFlood flood-color="seagreen" flood-opacity="0" />
  </filter>

  <rect id="r1" filter="url(#flood1)" />
  <rect id="r2" filter="url(#flood2)" />
</svg>
```

#### CSS

Chúng ta xác định {{cssxref("height")}}, {{cssxref("width")}}, {{cssxref("x")}} và {{cssxref("y")}}, vị trí của các hình chữ nhật bằng CSS, và thêm gradient tuyến tính lặp lại làm {{cssxref("background-image")}} trên SVG để độ mờ đục của flood-color rõ ràng hơn:

```css
svg {
  background-image: repeating-linear-gradient(
    45deg,
    transparent 0 9px,
    #cccccc 0px 10px
  );
}
rect {
  width: 100px;
  height: 100px;
  x: 10px;
  y: 10px;
}
#r2 {
  x: 150px;
}
```

Sau đó chúng ta áp dụng các giá trị độ mờ đục flood khác nhau cho các phần tử `<feFlood>` bằng thuộc tính CSS `flood-opacity`:

```css
#flood1 feFlood {
  flood-opacity: 0.5;
}
#flood2 feFlood {
  flood-opacity: 90%;
}
```

#### Kết quả

{{EmbedLiveSample(" Defining the flood opacity of a filter", "300", "220")}}

Các thuộc tính đã xác định hình vuông đầu tiên là hoàn toàn đục và hình vuông thứ hai là hoàn toàn trong suốt, nhưng các giá trị này đã bị ghi đè bởi các giá trị CSS `flood-opacity`. Các bộ lọc seagreen lần lượt có độ mờ đục 50% và 90%.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("flood-color")}}
- {{cssxref("fill")}}
- {{cssxref("stop-opacity")}}
- {{cssxref("stroke-opacity")}}
- {{cssxref("opacity")}}
- {{cssxref("box-shadow")}}
- {{cssxref("text-shadow")}}
- {{cssxref("filter-function")}}, bao gồm {{cssxref("filter-function/opacity", "opacity()")}}
- Thuộc tính SVG {{SVGAttr("flood-opacity")}}
