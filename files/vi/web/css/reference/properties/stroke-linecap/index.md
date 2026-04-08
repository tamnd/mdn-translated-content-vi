---
title: stroke-linecap
slug: Web/CSS/Reference/Properties/stroke-linecap
page-type: css-property
browser-compat: css.properties.stroke-linecap
sidebar: cssref
---

Thuộc tính **`stroke-linecap`** [CSS](/en-US/docs/Web/CSS) xác định hình dạng được sử dụng ở cuối các đường con mở của nét vẽ chưa đóng của các phần tử [SVG](/en-US/docs/Web/SVG). Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-linecap")}} của phần tử.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG nào có thể có các nét vẽ chưa đóng và phần tử nội dung văn bản (xem {{SVGAttr("stroke-linecap")}} để biết danh sách đầy đủ), nhưng là thuộc tính được kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu ứng mong muốn trên các nét vẽ của phần tử con.

## Cú pháp

```css
/* Giá trị từ khóa */
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

### Giá trị

- `butt`
  - : Chỉ ra rằng nét vẽ cho mỗi đường con không kéo dài ra ngoài hai điểm cuối của nó. Trên một đường con có độ dài bằng không, đường dẫn sẽ không được vẽ. Đây là giá trị mặc định.

- `round`
  - : Chỉ ra rằng ở cuối mỗi đường con, nét vẽ sẽ được kéo dài bằng một nửa hình tròn có đường kính bằng chiều rộng nét vẽ. Trên một đường con có độ dài bằng không, nét vẽ bao gồm một hình tròn đầy đủ có tâm tại điểm của đường con.

- `square`
  - : Chỉ ra rằng ở cuối mỗi đường con, nét vẽ sẽ được kéo dài bằng một hình chữ nhật có chiều rộng bằng một nửa chiều rộng nét vẽ và chiều cao bằng chiều rộng nét vẽ. Trên một đường con có độ dài bằng không, nét vẽ bao gồm một hình vuông có chiều rộng bằng chiều rộng nét vẽ, có tâm tại điểm của đường con.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Các kiểu linecap

Ví dụ này minh họa ba giá trị từ khóa của thuộc tính.

#### HTML

Trước tiên chúng ta thiết lập một hình chữ nhật màu xám nhạt. Sau đó, trong một nhóm, ba đường dẫn được định nghĩa có độ dài chính xác bằng chiều rộng của hình chữ nhật, và tất cả đều bắt đầu từ cạnh trái của hình chữ nhật. Tất cả chúng được đặt để có nét `dodgerblue` với chiều rộng bảy.

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

Đường dẫn đầu tiên có linecap `butt`, có nghĩa là nét vẽ chạy chính xác đến các điểm cuối (cả điểm bắt đầu và điểm kết thúc) của đường dẫn, và không xa hơn. Đường dẫn thứ hai có linecap `square`, vì vậy đường dẫn có thể nhìn thấy kéo dài ra ngoài các điểm cuối của đường dẫn, làm cho chiều dài tổng thể của đường dẫn có vẻ là 87, vì độ dài đường dẫn là 80 và mỗi trong hai đầu hình vuông có chiều rộng 3,5. Đường dẫn thứ ba có các đầu `circle`, vì vậy mặc dù nó cũng có vẻ dài 87 đơn vị, hai đầu là hình bán nguyệt thay vì hình vuông.

## Đặc tả

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
