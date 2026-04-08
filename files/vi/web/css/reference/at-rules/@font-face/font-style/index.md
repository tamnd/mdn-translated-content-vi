---
title: font-style
slug: Web/CSS/Reference/At-rules/@font-face/font-style
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-style
sidebar: cssref
---

Descriptor **`font-style`** trong [CSS](/en-US/docs/Web/CSS) cho phép tác giả chỉ định kiểu dáng phông chữ cho các phông chữ được khai báo trong quy tắc at-rule {{cssxref("@font-face")}}.

Với một họ phông chữ cụ thể, tác giả có thể tải về các font face tương ứng với các kiểu dáng khác nhau của cùng họ phông chữ, rồi sử dụng descriptor `font-style` để chỉ định rõ ràng kiểu dáng của font face đó. Các giá trị cho descriptor CSS này giống với các giá trị của thuộc tính {{cssxref("font-style")}} tương ứng.

## Cú pháp

```css
font-style: normal;
font-style: italic;
font-style: oblique;
font-style: oblique 30deg;
font-style: oblique 30deg 50deg;
```

### Giá trị

- `normal`
  - : Chọn phiên bản bình thường của họ phông chữ.
- `italic`
  - : Chỉ định rằng font face là phiên bản in nghiêng (italic) của phông chữ bình thường.
- `oblique`
  - : Chỉ định rằng font face là phiên bản nghiêng nhân tạo của phông chữ bình thường.
- `oblique` với góc
  - : Chọn phông chữ được phân loại là `oblique`, đồng thời chỉ định thêm góc nghiêng cho văn bản.
- `oblique` với dải góc
  - : Chọn phông chữ được phân loại là `oblique`, đồng thời chỉ định dải góc nghiêng được phép cho văn bản. Lưu ý rằng dải góc chỉ được hỗ trợ khi `font-style` là `oblique`; với `font-style: normal` hoặc `italic`, không cho phép giá trị thứ hai.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định kiểu dáng phông chữ in nghiêng

Ví dụ, xét họ phông chữ garamond ở dạng bình thường, ta có kết quả sau:

```css
@font-face {
  font-family: "garamond";
  src: url("garamond.ttf");
}
```

![garamond chưa định kiểu](garamondunstyled.jpg)

Phiên bản in nghiêng của văn bản này sử dụng các glyph có trong phiên bản chưa định kiểu, nhưng chúng được nghiêng nhân tạo đi vài độ.

![garamond nghiêng nhân tạo](garamondartificialstyle.jpg)

Mặt khác, nếu tồn tại phiên bản in nghiêng thực sự của họ phông chữ, chúng ta có thể đưa nó vào descriptor `src` và chỉ định kiểu dáng phông chữ là italic, để rõ ràng phông chữ đó là in nghiêng. Chữ in nghiêng thực sự sử dụng các glyph khác nhau và có sự khác biệt so với chữ đứng, có các đặc điểm riêng và thường có chất lượng tròn trịa, viết tay hơn. Các phông chữ này được các nhà thiết kế phông chữ tạo ra đặc biệt và **không** phải là nghiêng nhân tạo.

```css
@font-face {
  font-family: "garamond";
  src: url("garamond-italic.ttf");
  font-style: italic;
}
```

![garamond in nghiêng](garamonditalic.jpg)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}}
