---
title: stroke-linecap
slug: Web/CSS/Reference/Properties/stroke-linecap
page-type: css-property
browser-compat: css.properties.stroke-linecap
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`stroke-linecap`** xác định hình dạng được dùng ở cuối các đường con hở của nét vẽ chưa đóng của các phần tử [SVG](/en-US/docs/Web/SVG). Nếu có, nó ghi đè thuộc tính {{SVGAttr("stroke-linecap")}} của phần tử.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG nào có thể có các nét vẽ chưa đóng và phần tử nội dung văn bản (xem {{SVGAttr("stroke-linecap")}} để biết danh sách đầy đủ), nhưng là thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu lực mong muốn trên các nét vẽ của phần tử con.

## Cú pháp

```css
/* keyword values */
stroke-linecap: butt;
stroke-linecap: round;
stroke-linecap: square;

/* Giá trị toàn cục */
stroke-linecap: inherit;
stroke-linecap: initial;
stroke-linecap: revert;
stroke-linecap: revert-layer;
stroke-linecap: unset;
```

### Các giá trị

- `butt`
  - : Chỉ ra rằng nét vẽ cho mỗi đường con không kéo dài ra ngoài hai điểm đầu cuối của nó. Trên đường con có độ dài bằng không, đường sẽ không được vẽ. Đây là giá trị mặc định.

- `round`
  - : Chỉ ra rằng ở cuối mỗi đường con, nét vẽ sẽ được kéo dài bởi một nửa vòng tròn với đường kính bằng chiều rộng nét vẽ. Trên đường con có độ dài bằng không, nét vẽ bao gồm một vòng tròn đầy đủ được căn giữa tại điểm của đường con.

- `square`
  - : Chỉ ra rằng ở cuối mỗi đường con, nét vẽ sẽ được kéo dài bởi một hình chữ nhật với chiều rộng bằng một nửa chiều rộng nét vẽ và chiều cao bằng chiều rộng nét vẽ. Trên đường con có độ dài bằng không, nét vẽ bao gồm một hình vuông với chiều rộng bằng chiều rộng nét vẽ, được căn giữa tại điểm của đường con.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Các kiểu đầu đường (linecap)

Ví dụ này minh họa ba giá trị từ khóa của thuộc tính.

#### HTML

Trước tiên chúng ta thiết lập một hình chữ nhật màu xám nhạt. Sau đó, trong một nhóm, ba đường dẫn được xác định có độ dài chính xác bằng chiều rộng của hình chữ nhật, và tất cả đều bắt đầu từ cạnh trái của hình chữ nhật. Tất cả đều được đặt nét vẽ màu `dodgerblue` với chiều rộng bảy.

```html
<svg viewBox="0 0 100 50" width="500" height="250">
  <rect x="10" y="5" width="80" height="30" fill="#dddddd" />
  <g stroke="dodgerblue" stroke-width="7">
    <path d="M 10,10 h 80" />
    <path d="M 10,20 h 80" />
    <path d="M 10,30 h 80" />
  </g>
</svg>
```

#### CSS

Sau đó chúng ta áp dụng kiểu linecap khác nhau cho mỗi đường dẫn thông qua CSS.

```css
path:nth-of-type(1) {
  stroke-linecap: butt;
}
path:nth-of-type(2) {
  stroke-linecap: square;
}
path:nth-of-type(3) {
  stroke-linecap: round;
}
```

#### Kết quả

{{EmbedLiveSample("Linecaps", "500", "250")}}

Đường dẫn đầu tiên có linecap `butt`, nghĩa là nét vẽ chạy chính xác đến các điểm cuối (cả điểm bắt đầu và điểm kết thúc) của đường dẫn, và không xa hơn. Đường dẫn thứ hai có linecap `square`, vì vậy đường dẫn hiển thị kéo dài ra ngoài các điểm cuối của đường dẫn, khiến tổng chiều dài của đường dẫn có vẻ là 87, vì độ dài đường dẫn là 80 và mỗi trong hai mũ hình vuông rộng 3,5. Đường dẫn thứ ba có mũ `circle`, vì vậy trong khi nó cũng có vẻ dài 87 đơn vị, hai mũ là nửa vòng tròn thay vì hình vuông.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("stroke-dasharray")}}
- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linejoin")}}
- {{cssxref("stroke-miterlimit")}}
- {{cssxref("stroke-opacity")}}
- {{cssxref("stroke-width")}}
- {{cssxref("stroke")}}
- Thuộc tính SVG {{SVGAttr("stroke-linecap")}}
