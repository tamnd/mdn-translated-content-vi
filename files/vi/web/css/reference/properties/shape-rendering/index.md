---
title: shape-rendering
slug: Web/CSS/Reference/Properties/shape-rendering
page-type: css-property
browser-compat: css.properties.shape-rendering
sidebar: cssref
---

Thuộc tính **`shape-rendering`** của [CSS](/vi/docs/Web/CSS) cung cấp gợi ý cho trình kết xuất về những đánh đổi cần thực hiện khi kết xuất các hình dạng như đường dẫn, hình tròn, hoặc hình chữ nhật.
Nó chỉ có hiệu lực trên các phần tử {{SVGElement("circle")}}, {{SVGElement("ellipse")}}, {{SVGElement("line")}}, {{SVGElement("path")}}, {{SVGElement("polygon")}}, {{SVGElement("polyline")}}, và {{SVGElement("rect")}}. Nếu được khai báo rõ ràng, giá trị của thuộc tính CSS sẽ ghi đè bất kỳ giá trị nào của thuộc tính {{SVGAttr("shape-rendering")}} của phần tử.

## Cú pháp

```css
shape-rendering: auto;
shape-rendering: crispEdges;
shape-rendering: geometricPrecision;
shape-rendering: optimizeSpeed;

/* Giá trị toàn cục */
shape-rendering: inherit;
shape-rendering: initial;
shape-rendering: revert;
shape-rendering: revert-layer;
shape-rendering: unset;
```

### Giá trị

Các giá trị {{cssxref("length")}} và {{cssxref("percentage")}} biểu thị tâm ngang của hình tròn hoặc hình elip.

- `auto`
  - : Giá trị này hướng dẫn các tác nhân người dùng thực hiện các đánh đổi để cân bằng tốc độ, độ sắc nét của cạnh và độ chính xác hình học, với độ chính xác hình học được ưu tiên hơn tốc độ và độ sắc nét của cạnh.
- `crispEdges`
  - : Giá trị này hướng dẫn tác nhân người dùng nhấn mạnh độ tương phản của cạnh hơn độ chính xác hình học hoặc tốc độ kết xuất. Kết xuất cuối cùng có thể bỏ qua các kỹ thuật như khử răng cưa. Nó cũng có thể điều chỉnh vị trí đường thẳng và độ rộng đường thẳng để căn chỉnh các cạnh với các pixel thiết bị.
- `geometricPrecision`
  - : Giá trị này hướng dẫn tác nhân người dùng nhấn mạnh độ chính xác hình học hơn tốc độ hoặc cạnh sắc nét. Kết xuất cuối cùng có thể liên quan đến các kỹ thuật như khử răng cưa.
- `optimizeSpeed`
  - : Giá trị này hướng dẫn tác nhân người dùng nhấn mạnh tốc độ kết xuất hơn độ chính xác hình học hoặc độ sắc nét của cạnh. Kết xuất cuối cùng có thể bỏ qua các kỹ thuật như khử răng cưa.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Để hiển thị các kết xuất khác nhau, chúng ta tạo một tập hợp bốn hình elip có kích thước và hình dạng bằng nhau.

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 120">
  <ellipse cx="50" cy="60" rx="40" ry="60" />
  <ellipse cx="150" cy="60" rx="40" ry="60" />
  <ellipse cx="250" cy="60" rx="40" ry="60" />
  <ellipse cx="350" cy="60" rx="40" ry="60" />
</svg>
```

Sau đó chúng ta áp dụng bốn giá trị của `shape-rendering`, mỗi giá trị cho một hình elip.

```css
ellipse:nth-of-type(1) {
  shape-rendering: crispEdges;
}
ellipse:nth-of-type(2) {
  shape-rendering: geometricPrecision;
}
ellipse:nth-of-type(3) {
  shape-rendering: optimizeSpeed;
}
ellipse:nth-of-type(4) {
  shape-rendering: auto;
}
```

SVG kết quả được hiển thị ở đây. Hình elip thứ nhất và thứ ba (tính từ trái sang phải) có nhiều khả năng hiển thị cạnh răng cưa hơn, trong khi hình thứ hai sẽ có ngoại hình mượt mà hơn. Ngoại hình của hình elip thứ tư và cuối cùng sẽ được quyết định bởi các đánh đổi cụ thể mà tác nhân người dùng bạn sử dụng để xem ví dụ thực hiện.

{{EmbedLiveSample("Example", "400", "240")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("shape-rendering")}}
