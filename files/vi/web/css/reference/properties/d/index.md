---
title: d
slug: Web/CSS/Reference/Properties/d
page-type: css-property
browser-compat: css.properties.d
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`d`** xác định đường dẫn sẽ được vẽ bởi phần tử SVG {{SVGElement("path")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("d")}} của phần tử.

> [!NOTE]
> Thuộc tính `d` chỉ áp dụng cho các phần tử {{SVGElement("path")}} được lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG khác, cũng không áp dụng cho các phần tử HTML hoặc pseudo-elements.

## Cú pháp

```css
/* Mặc định */
d: none;

/* Sử dụng cơ bản */
d: path("m 5,5 h 35 L 20,30 z");
d: path("M 0,25 l 50,150 l 200,50 z");
d: path("M 10,5 l 90,0 -80,80 0,-60 80,80 -90,0 z");

/* Giá trị toàn cục */
d: inherit;
d: initial;
d: revert;
d: revert-layer;
d: unset;
```

### Giá trị

Giá trị là hàm {{cssxref("basic-shape/path", "path()")}} với một tham số {{cssxref("&lt;string&gt;")}} duy nhất hoặc từ khóa `none`.

- `none`
  - : Không vẽ đường dẫn nào.
- `path(<string>)`
  - : Hàm `path()` với tham số [chuỗi dữ liệu](/en-US/docs/Web/SVG/Reference/Attribute/d) được đặt trong dấu ngoặc kép. Chuỗi dữ liệu xác định một [đường dẫn SVG](/en-US/docs/Web/SVG/Reference/Element/path). Chuỗi dữ liệu đường dẫn SVG chứa [lệnh đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands) sử dụng đơn vị pixel một cách ngầm định. Đường dẫn rỗng được coi là không hợp lệ.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định dữ liệu đường dẫn

Ví dụ này minh họa cách sử dụng cơ bản của `d`, và cách thuộc tính CSS `d` ưu tiên hơn thuộc tính `d`.

#### HTML

Chúng ta bao gồm hai phần tử `<path>` giống nhau trong một SVG; giá trị thuộc tính `d` của chúng là `"m 5,5 h 90 v 90 h -90 v -90 z"`, tạo ra hình vuông `90px`.

```html
<svg>
  <path d="m 5,5 h 90 v 90 h -90 v -90 z" />
  <path d="m 5,5 h 90 v 90 h -90 v -90 z" />
</svg>
```

#### CSS

Với CSS, chúng ta tạo kiểu cho cả hai đường dẫn, cung cấp {{cssxref("stroke")}} màu đen và {{cssxref("fill")}} màu đỏ bán trong suốt. Sau đó, chúng ta sử dụng thuộc tính `d` để ghi đè giá trị của thuộc tính SVG {{SVGAttr("d")}} chỉ cho đường dẫn cuối cùng. Trình duyệt hiển thị ảnh SVG với chiều rộng `300px` và chiều cao `150px` theo mặc định.

```css
svg {
  border: 1px solid;
}

path {
  fill: #ff333388;
  stroke: black;
}

path:last-of-type {
  d: path(
    "M10,30 A20,20 0,0,1 50,30 A20,20 0,0,1 90,30 Q90,60 50,90 Q10,60 10,30 z"
  );
}
```

#### Kết quả

{{EmbedLiveSample("Specifying path data", "300", "180")}}

`<path>` thứ hai là hình trái tim, như được xác định trong giá trị hàm `path()` của thuộc tính CSS `d`. Đường dẫn của `<path>` không được tạo kiểu vẫn là hình vuông, như được xác định trong giá trị thuộc tính SVG `d` của nó.

### Hoạt họa đường dẫn dữ liệu

Ví dụ này minh họa cách hoạt họa giá trị thuộc tính `d`.

#### HTML

Chúng ta tạo một `<svg>` chứa một phần tử `<path>` duy nhất.

```html
<svg>
  <path />
</svg>
```

#### CSS

Chúng ta sử dụng thuộc tính `d` để xác định hình trái tim có đường kẻ qua. Chúng ta sử dụng CSS để xác định {{cssxref("fill")}}, {{cssxref("stroke")}}, và {{cssxref("stroke-width")}} của đường dẫn đó, và thêm {{cssxref("transition")}} hai giây. Chúng ta thêm kiểu {{cssxref(":hover")}} chứa hàm {{cssxref("basic-shape/path", "path()")}} hơi khác; đường dẫn có cùng số điểm dữ liệu với trạng thái mặc định, giúp đường dẫn có thể được hoạt họa.

```css
svg {
  border: 1px solid;
}

path {
  d: path(
    "M10,30 A20,20 0,0,1 50,30 A20,20 0,0,1 90,30 Q90,60 50,90 Q10,60 10,30 z M90,5 L5,90"
  );
  transition: all 2s;
  fill: none;
  stroke: red;
  stroke-width: 3px;
}

svg:hover path {
  d: path(
    "M10,30 A20,20 0,0,1 50,30 A20,20 0,0,1 90,30 Q90,60 50,90 Q10,60 10,30 z M5,5 L90,90"
  );
  stroke: black;
}
```

#### Kết quả

{{EmbedLiveSample("Animating data paths", "300", "180")}}

Để xem hoạt họa, di chuột lên SVG.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("d")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- Hàm {{cssxref("basic-shape/path", "path()")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- [Tổng quan về CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes/Overview)
- Mô-đun [CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes)
