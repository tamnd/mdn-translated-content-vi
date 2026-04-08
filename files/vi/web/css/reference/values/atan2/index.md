---
title: atan2()
slug: Web/CSS/Reference/Values/atan2
page-type: css-function
browser-compat: css.types.atan2
sidebar: cssref
---

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) [CSS](/vi/docs/Web/CSS) **`atan2()`** là một hàm lượng giác trả về arctan của hai giá trị trong khoảng `-infinity` đến `infinity`. Hàm chấp nhận hai đối số và trả về {{cssxref("angle")}} trong khoảng `-180deg` đến `180deg`, không kèm theo bất kỳ đơn vị cụ thể nào như radian.

## Cú pháp

```css
/* Two <number> values */
transform: rotate(atan2(3, 2));

/* Two <dimension> values */
transform: rotate(atan2(1rem, -0.5rem));

/* Two <percentage> values */
transform: rotate(atan2(20%, -30%));

/* Other values */
transform: rotate(atan2(pi, 45));
transform: rotate(atan2(e, 30));
```

### Tham số

Hàm `atan2(y, x)` chấp nhận hai giá trị được phân cách bằng dấu phẩy làm tham số. Mỗi giá trị có thể là {{cssxref("&lt;number&gt;")}}, {{cssxref("&lt;dimension&gt;")}}, hoặc {{cssxref("&lt;percentage&gt;")}}. Cả hai giá trị phải cùng kiểu, mặc dù nếu chúng là {{cssxref("&lt;dimension&gt;")}} thì có thể có các đơn vị khác nhau (ví dụ: `atan2(100px, 5vw)` hợp lệ).

- `y`
  - : Tọa độ y của điểm. Một phép tính được phân giải thành {{cssxref("&lt;number&gt;")}}, {{cssxref("&lt;dimension&gt;")}}, hoặc {{cssxref("&lt;percentage&gt;")}}.
- `x`
  - : Tọa độ x của điểm. Một phép tính được phân giải thành {{cssxref("&lt;number&gt;")}}, {{cssxref("&lt;dimension&gt;")}}, hoặc {{cssxref("&lt;percentage&gt;")}}.

### Giá trị trả về

Cho hai giá trị `x` và `y`, hàm `atan2(y, x)` tính toán và trả về {{cssxref("angle")}} giữa trục x dương và tia từ gốc tọa độ đến điểm `(x, y)`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Xoay các phần tử

Hàm `atan2()` có thể được dùng để {{cssxref("transform-function/rotate", "xoay")}} các phần tử vì nó trả về {{cssxref("angle")}}.

#### HTML

```html
<div class="box box-1"></div>
<div class="box box-2"></div>
<div class="box box-3"></div>
<div class="box box-4"></div>
<div class="box box-5"></div>
```

#### CSS

```css hidden
body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 50px;
}
```

```css
div.box {
  width: 100px;
  height: 100px;
  background: linear-gradient(orange, red);
}
div.box-1 {
  transform: rotate(atan2(3, 2));
}
div.box-2 {
  transform: rotate(atan2(3%, -2%));
}
div.box-3 {
  transform: rotate(atan2(-1, 0.5));
}
div.box-4 {
  transform: rotate(atan2(1, 0.5));
}
div.box-5 {
  transform: rotate(atan2(1rem, -0.5rem));
}
```

#### Kết quả

{{EmbedLiveSample('Rotate elements', '100%', '200px')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sin")}}
- {{CSSxRef("cos")}}
- {{CSSxRef("tan")}}
- {{CSSxRef("asin")}}
- {{CSSxRef("acos")}}
- {{CSSxRef("atan")}}
- [Sử dụng CSS typed arithmetic](/vi/docs/Web/CSS/Guides/Values_and_units/Using_typed_arithmetic)
