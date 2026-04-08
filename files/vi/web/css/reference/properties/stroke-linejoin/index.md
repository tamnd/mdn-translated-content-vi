---
title: stroke-linejoin
slug: Web/CSS/Reference/Properties/stroke-linejoin
page-type: css-property
browser-compat: css.properties.stroke-linejoin
sidebar: cssref
---

Thuộc tính **`stroke-linejoin`** [CSS](/en-US/docs/Web/CSS) xác định hình dạng được sử dụng tại các góc của các đường dẫn được tô của phần tử [SVG](/en-US/docs/Web/SVG). Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-linejoin")}} của phần tử.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG tạo góc hoặc phần tử nội dung văn bản nào (xem {{SVGAttr("stroke-linejoin")}} để biết danh sách đầy đủ), nhưng là thuộc tính được kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu ứng mong muốn trên các nét vẽ của phần tử con.

## Cú pháp

```css
/* Giá trị từ khóa */
stroke-linejoin: bevel;
stroke-linejoin: miter;
stroke-linejoin: round;

/* Giá trị toàn cục */
stroke-linejoin: inherit;
stroke-linejoin: initial;
stroke-linejoin: revert;
stroke-linejoin: revert-layer;
stroke-linejoin: unset;
```

### Giá trị

- `bevel`
  - : Chỉ ra rằng một góc vát được sử dụng để nối các đoạn đường dẫn. Phần vát được tạo bằng cách cắt bớt góc bằng một đường thẳng vuông góc với đường phân giác của góc giữa các đoạn đường con tại điểm nối.

- `miter`
  - : Chỉ ra rằng một góc nhọn được sử dụng để nối các đoạn đường dẫn. Góc được tạo bằng cách kéo dài các cạnh ngoài của nét vẽ theo các tiếp tuyến của các đoạn đường dẫn cho đến khi chúng giao nhau. Đây là giá trị mặc định.

- `round`
  - : Chỉ ra rằng một góc tròn được sử dụng để nối các đoạn đường dẫn. Điều này được thực hiện bằng cách cắt bớt điểm nối như theo `bevel`, sau đó thêm một cung tròn tiếp tuyến được tô đầy để làm tròn góc.

Các giá trị sau được định nghĩa, nhưng không được hỗ trợ trong bất kỳ trình duyệt nào:

- `arcs`
  - : _(Không được hỗ trợ.)_ Chỉ ra rằng một _góc cung_ được sử dụng để nối các đoạn đường dẫn. Hình dạng của cung được tạo bằng cách kéo dài các cạnh ngoài của nét vẽ tại điểm nối bằng các cung có cùng độ cong như các cạnh ngoài tại điểm nối.

- `crop`
  - : _(Không được hỗ trợ.)_ Chỉ ra rằng góc nên kéo dài ra ngoài điểm nối bằng lượng tối thiểu cần thiết để tạo ra một góc lồi. Điều này tương đương chức năng với `miter` (xem ở trên) với giá trị {{CSSxref('stroke-miterlimit')}} là `1`.

- `fallback`
  - : _(Không được hỗ trợ; có nguy cơ bị loại bỏ.)_ Hoạt động giống hệt như `crop bevel` khi giá trị {{CSSxref('stroke-miterlimit')}} bị vượt quá.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Các kiểu nối đường

Ví dụ này minh họa ba giá trị từ khóa hiện được hỗ trợ cho `stroke-linejoin`.

#### HTML

Chúng ta thiết lập bốn đường dẫn giống hệt nhau, tất cả đều có nét màu đen với chiều rộng một và không có màu tô.

```html
<svg viewBox="0 0 15 12" xmlns="http://www.w3.org/2000/svg">
  <g stroke="black" stroke-width="1" fill="none">
    <path d="M2,5  a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5" />
    <path d="M8,5  a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5" />
    <path d="M2,11 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5" />
    <path d="M8,11 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5" />
  </g>
</svg>
```

#### CSS

Đối với mỗi trong bốn đường dẫn, một giá trị nối đường được hỗ trợ được áp dụng. Đường đầu tiên có vát, đường thứ hai có tròn, đường thứ ba có miter, và đường thứ tư cũng có miter nhưng với {{CSSxref('stroke-miterlimit')}} là `2`, buộc góc phải vát thay vì miter.

```css
path:nth-child(1) {
  stroke-linejoin: bevel;
}
path:nth-child(2) {
  stroke-linejoin: round;
}
path:nth-child(3) {
  stroke-linejoin: miter;
}
path:nth-child(4) {
  stroke-linejoin: miter;
  stroke-miterlimit: 2;
}
```

#### Kết quả

{{EmbedLiveSample("Line-joining styles", "500", "600")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("stroke-dasharray")}}
- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linecap")}}
- {{cssxref("stroke-miterlimit")}}
- {{cssxref("stroke-opacity")}}
- {{cssxref("stroke-width")}}
- {{cssxref("stroke")}}
- Thuộc tính SVG {{SVGAttr("stroke-linejoin")}}
