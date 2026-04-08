---
title: <length-percentage>
slug: Web/CSS/Reference/Values/length-percentage
page-type: css-type
browser-compat: css.types.length-percentage
sidebar: cssref
---

Kiểu dữ liệu **`<length-percentage>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho một giá trị có thể là {{Cssxref("length")}} hoặc {{Cssxref("percentage")}}.

## Cú pháp

Tham khảo tài liệu cho {{Cssxref("length")}} và {{Cssxref("percentage")}} để biết chi tiết về các cú pháp riêng lẻ được phép trong kiểu này.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ về length-percentage

Ví dụ này minh họa một số thuộc tính sử dụng giá trị `<length-percentage>`.

#### HTML

```html
<p>You can use percentages and lengths in so many places.</p>
```

#### CSS

```css
p {
  /* length-percentage examples */
  width: 75%;
  height: 200px;
  margin: 3rem;
  padding: 1%;
  border-radius: 10px 10%;
  font-size: 250%;
  line-height: 1.5em;

  /* length examples */
  text-shadow: 1px 1px 1px red;
  border: 5px solid red;
  letter-spacing: 3px;

  /* percentage example */
  text-size-adjust: 20%;
}
```

#### Kết quả

{{EmbedLiveSample('length-percentage_examples', '100%', 320)}}

### Sử dụng trong calc()

Khi `<length-percentage>` được chỉ định là kiểu cho phép, điều này có nghĩa là phần trăm được giải thành một độ dài và do đó có thể được dùng trong biểu thức {{cssxref("calc()")}}. Do đó, tất cả các giá trị sau đây đều được chấp nhận cho {{cssxref("width")}}:

```css example-good
width: 200px;
width: 20%;
width: calc(100% - 200px);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;percentage&gt;")}}
- {{cssxref("&lt;length&gt;")}}
- [Mô-đun giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
