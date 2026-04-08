---
title: text-anchor
slug: Web/CSS/Reference/Properties/text-anchor
page-type: css-property
browser-compat: css.properties.text-anchor
sidebar: cssref
---

Thuộc tính **`text-anchor`** của [CSS](/vi/docs/Web/CSS) căn chỉnh hộp chứa một chuỗi văn bản mà vùng bao quanh được xác định từ thuộc tính {{cssxref("inline-size")}}, và văn bản sau đó được đặt tương đối so với điểm neo của phần tử, điểm này được xác định bằng các thuộc tính {{SVGAttr('x')}} và {{SVGAttr('y')}} (hoặc {{SVGAttr('dx')}} và {{SVGAttr('dy')}}). Nếu có, giá trị của thuộc tính CSS sẽ ghi đè bất kỳ giá trị nào của thuộc tính {{SVGAttr("text-anchor")}} của phần tử.

Mỗi đoạn văn bản riêng lẻ trong một phần tử được căn chỉnh độc lập; do đó, phần tử {{SVGElement("text")}} nhiều dòng sẽ có mỗi dòng văn bản được căn chỉnh theo giá trị của `text-anchor`. Các giá trị `text-anchor` chỉ có hiệu lực trên các phần tử SVG {{SVGElement("text")}}, {{SVGElement("textPath")}} và {{SVGElement("tspan")}}. `text-anchor` không áp dụng cho văn bản tự động xuống dòng; để làm điều đó, hãy xem {{cssxref('text-align')}}.

## Cú pháp

```css
text-anchor: start;
text-anchor: middle;
text-anchor: end;

/* Giá trị toàn cục */
text-anchor: inherit;
text-anchor: initial;
text-anchor: revert;
text-anchor: revert-layer;
text-anchor: unset;
```

### Giá trị

- `start`
  - : Căn chỉnh văn bản sao cho đầu nội tuyến của chuỗi văn bản được căn chỉnh với điểm neo. Căn chỉnh này tương đối với hướng viết của văn bản; do đó, ví dụ, trong văn bản viết từ phải sang trái từ trên xuống dưới, văn bản sẽ được đặt ở bên trái điểm neo. Nếu chiều nội tuyến của văn bản là dọc, như với nhiều ngôn ngữ châu Á, cạnh trên của văn bản sẽ được căn chỉnh với điểm neo.

- `middle`
  - : Căn chỉnh văn bản sao cho tâm (giữa) của hộp nội tuyến của chuỗi văn bản được căn chỉnh với điểm neo.

- `end`
  - : Căn chỉnh văn bản sao cho cuối nội tuyến của chuỗi văn bản được căn chỉnh với điểm neo. Căn chỉnh này tương đối với hướng viết của văn bản; do đó, ví dụ, trong văn bản viết từ phải sang trái từ trên xuống dưới, văn bản sẽ được đặt ở bên phải điểm neo. Nếu chiều nội tuyến của văn bản là dọc, như với nhiều ngôn ngữ châu Á, cạnh dưới của văn bản sẽ được căn chỉnh với điểm neo.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Ba phần tử `<text>` được cho cùng vị trí `x`, nhưng có các giá trị khác nhau cho `text-anchor`. Một đường đỏ đứt nét được bao gồm để đánh dấu vị trí trục x của cả ba điểm neo.

```html
<svg
  viewBox="0 0 200 150"
  height="150"
  width="200"
  xmlns="http://www.w3.org/2000/svg">
  <line
    x1="100"
    y1="0"
    x2="100"
    y2="150"
    stroke="red"
    stroke-dasharray="10,5" />
  <text x="100" y="40">Anchored</text>
  <text x="100" y="80">Anchored</text>
  <text x="100" y="120">Anchored</text>
</svg>
```

```css hidden
text {
  font-size: 24px;
}
```

```css
text:nth-of-type(1) {
  text-anchor: start;
}
text:nth-of-type(2) {
  text-anchor: middle;
}
text:nth-of-type(3) {
  text-anchor: end;
}
```

{{EmbedLiveSample("Example", 200, 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('dominant-baseline')}}
- Phần tử SVG {{SVGElement("text")}}
- Thuộc tính SVG {{SVGAttr("text-anchor")}}
