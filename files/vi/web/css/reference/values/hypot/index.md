---
title: hypot()
slug: Web/CSS/Reference/Values/hypot
page-type: css-function
browser-compat: css.types.hypot
sidebar: cssref
---

Hàm **`hypot()`** của [CSS](/vi/docs/Web/CSS) là một hàm mũ trả về [căn bậc hai](https://en.wikipedia.org/wiki/Square_root) của tổng bình phương các tham số của nó.

Trong khi {{CSSxRef("pow")}} và {{CSSxRef("sqrt")}} chỉ hoạt động với các số không có đơn vị, `hypot()` chấp nhận các giá trị có đơn vị, nhưng tất cả chúng phải có cùng [kiểu](/vi/docs/Web/CSS/Reference/Values/Data_types).

## Cú pháp

```css
/* Giá trị <number> */
width: hypot(2em); /* 2em */
width: hypot(3em, 4em); /* 5em */
width: hypot(30px, 40px); /* 50px */
width: hypot(48px, 64px); /* 80px */
width: hypot(3px, 4px, 5px); /* 7.0710678118654755px */
```

### Tham số

Hàm `hypot(x [, ...]#)` nhận một hoặc nhiều phép tính được phân tách bằng dấu phẩy làm tham số.

- `x`, `x2`, ..., `xN`
  - : Một phép tính phân giải thành {{CSSxRef("&lt;number&gt;")}}, {{CSSxRef("&lt;dimension&gt;")}}, hoặc {{CSSxRef("&lt;percentage&gt;")}}.

### Giá trị trả về

Trả về {{CSSxRef("&lt;number&gt;")}}, {{CSSxRef("&lt;dimension&gt;")}}, hoặc {{CSSxRef("&lt;percentage&gt;")}} (dựa trên đầu vào), là căn bậc hai của tổng bình phương các tham số của nó.

- Nếu bất kỳ đầu vào nào là `infinite`, kết quả là `+∞`.
- Nếu chỉ có một tham số được cung cấp, kết quả là giá trị tuyệt đối của đầu vào. `hypot(2em)` và `hypot(-2em)` đều phân giải thành `2em`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Kích thước dựa trên hàm hypot

Ví dụ này cho thấy cách sử dụng hàm `hypot()` để tính kích thước.

#### HTML

```html
<div class="boxes">
  <div class="box">100px</div>
  <div class="box one">100px</div>
  <div class="box two">141.42px</div>
  <div class="box three">250px</div>
</div>
```

#### CSS

Ở đây chúng ta sử dụng [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) để xác định các kích thước cần sử dụng. Đầu tiên chúng ta khai báo kích thước đầu tiên (`--size-0`) sau đó được dùng để tính các kích thước khác.

- `--size-1` được tính với cạnh huyền của `--size-0` (100px). Điều này lấy giá trị bình phương và, vì không có giá trị nào khác, trả về căn bậc hai của giá trị, kết quả là 100px.
- `--size-2` được tính với cạnh huyền của `--size-0` (100px), hai lần. Điều này lấy bình phương của giá trị (100px \* 100px = 10000px<sup>2</sup>) và cộng nó với bình phương của `--size-0` lần nữa (10000px<sup>2</sup> + 10000px<sup>2</sup> = 20000px<sup>2</sup>) và trả về căn bậc hai của tổng (√(20000px<sup>2</sup>)), kết quả là 141.42px.
- `--size-3` được tính với cạnh huyền `--size-0` \* 1.5 (150px) và `--size-0` \* 2 (200px). Kết quả là căn bậc hai của tổng bình phương của chúng: Các giá trị được bình phương (22500px<sup>2</sup> và 40000px<sup>2</sup>) và cộng lại (62500px<sup>2</sup>), với tổng được khai căn (√(62500px<sup>2</sup>)) là 250px.

```css
:root {
  --size-0: 100px;
  --size-1: hypot(var(--size-0)); /*  100px */
  --size-2: hypot(var(--size-0), var(--size-0)); /*  141.42px */
  --size-3: hypot(
    calc(var(--size-0) * 1.5),
    calc(var(--size-0) * 2)
  ); /*  250px */
}
```

```css hidden
.boxes {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}

.box {
  width: var(--size-0);
  height: var(--size-0);
  background-color: tomato;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

Các kích thước sau đó được áp dụng làm giá trị `width` và `height` của các selector.

```css
.one {
  width: var(--size-1);
  height: var(--size-1);
}
.two {
  width: var(--size-2);
  height: var(--size-2);
}
.three {
  width: var(--size-3);
  height: var(--size-3);
}
```

#### Kết quả

{{EmbedLiveSample('Sizes based on hypot function', '100%', '270px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("pow")}}
- {{CSSxRef("sqrt")}}
- {{CSSxRef("log")}}
- {{CSSxRef("exp")}}
