---
title: math-depth
slug: Web/CSS/Reference/Properties/math-depth
page-type: css-property
browser-compat: css.properties.math-depth
sidebar: cssref
---

Thuộc tính **`math-depth`** mô tả khái niệm _độ sâu_ cho mỗi phần tử trong một công thức toán học, so với hộp chứa cấp cao nhất của công thức đó. Thuộc tính này được sử dụng để thay đổi tỷ lệ giá trị được tính toán của [font-size](/en-US/docs/Web/CSS/Reference/Properties/font-size) của các phần tử khi áp dụng `font-size: math`.

> [!NOTE]
> `font-size: math` là giá trị mặc định cho các phần tử `<math>` trong bảng kiểu [User Agent](https://w3c.github.io/mathml-core/#user-agent-stylesheet) của MathML Core, vì vậy không cần chỉ định rõ ràng.

## Cú pháp

```css
/* Giá trị từ khóa */
math-depth: auto-add;

/* Giá trị tương đối */
math-depth: add(2);
math-depth: add(-2);

/* Giá trị tuyệt đối */
math-depth: 4;

/* Giá trị toàn cục */
math-depth: inherit;
math-depth: initial;
math-depth: revert;
math-depth: revert-layer;
math-depth: unset;
```

### Giá trị

- `auto-add`
  - : Đặt thành `math-depth` kế thừa cộng thêm 1 khi [math-style](/en-US/docs/Web/CSS/Reference/Properties/math-style) kế thừa là `compact`.
- `add({{cssxref("&lt;integer&gt;")}})`
  - : Đặt thành `math-depth` kế thừa cộng thêm số nguyên được chỉ định.
- {{cssxref("&lt;integer&gt;")}}
  - : Đặt thành số nguyên được chỉ định.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Chỉ định độ sâu toán học

Ví dụ sau đây cho thấy hiệu lực của việc thay đổi thuộc tính `math-depth` đối với kích thước phông chữ của các công thức con.
Các con số trong mỗi công thức con chỉ ra `math-depth` và hệ số tỷ lệ được áp dụng.

Phần tử `<mtext>` đầu tiên được dùng làm tham chiếu cho các công thức con khác và không có kiểu cụ thể nào được áp dụng.
Công thức con thứ hai và thứ ba có `math-depth` được đặt thành `auto-add` và hiển thị hiệu lực của việc thay đổi tỷ lệ tùy thuộc vào `math-style`.

Hai công thức con cuối cùng hiển thị hiệu lực của việc đặt `math-depth` thành một giá trị cụ thể.

#### HTML

```html
<p>
  <math>
    <mtext>0</mtext>

    <!-- auto-add value has no effect when math-style is normal -->
    <mrow style="math-style: normal">
      <mrow style="math-depth: auto-add">
        <mtext>0</mtext>
      </mrow>
    </mrow>

    <!-- the inherited math-style is compact, so math-depth is set to 1 -->
    <mrow style="math-depth: auto-add">
      <mtext>1</mtext>
    </mrow>

    <mrow style="math-depth: add(2)">
      <mtext>2</mtext>
      <mrow style="math-depth: add(-1)">
        <mtext>1</mtext>
      </mrow>
      <mrow style="math-depth: 0">
        <mtext>0</mtext>
      </mrow>
    </mrow>
  </math>
</p>
```

```css hidden
p {
  font-size: 3rem;
  margin: 1rem 0;
}
```

#### Kết quả

{{embedlivesample('Specifying_a_math_depth', 600, 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-size")}}
- {{cssxref("math-style")}}
