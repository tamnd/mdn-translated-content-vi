---
title: text-decoration-inset
slug: Web/CSS/Reference/Properties/text-decoration-inset
page-type: css-property
status:
  - experimental
browser-compat: css.properties.text-decoration-inset
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-inset`** cho phép điều chỉnh điểm bắt đầu và điểm kết thúc của trang trí văn bản của một phần tử, để có thể rút ngắn, kéo dài hoặc thay đổi vị trí của trang trí đó so với văn bản được hiển thị.

{{InteractiveExample("CSS Demo: text-decoration-inset")}}

```css interactive-example-choice
text-decoration-inset: 20px;
```

```css interactive-example-choice
text-decoration-inset: -0.5em;
```

```css interactive-example-choice
text-decoration-inset: 20px 1em;
```

```css interactive-example-choice
text-decoration-inset: -0.5rem -1.5rem;
```

```css interactive-example-choice
text-decoration-inset: -2ex 10vw;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">Karmadrome</p>
</section>
```

```css interactive-example
#example-element {
  font: 2.5em sans-serif;
  text-decoration: underline 0.3em limegreen;
}
```

## Cú pháp

```css
/* Từ khóa auto */
text-decoration-inset: auto;

/* Một giá trị <length> */
text-decoration-inset: 20px;
text-decoration-inset: -2rem;

/* Hai giá trị <length> */
text-decoration-inset: 20px 1em;
text-decoration-inset: -0.5rem -1.5rem;
text-decoration-inset: -2ex 1vw;

/* Giá trị toàn cục */
text-decoration-inset: inherit;
text-decoration-inset: initial;
text-decoration-inset: revert;
text-decoration-inset: revert-layer;
text-decoration-inset: unset;
```

### Giá trị

Một hoặc hai giá trị {{cssxref("&lt;length>")}} hoặc từ khóa `auto`.

- {{cssxref("&lt;length>")}}
  - : Chỉ định lượng điều chỉnh vị trí trang trí văn bản. Giá trị dương thu ngắn trang trí văn bản (inset) trong khi giá trị âm kéo dài trang trí văn bản (outset). Nếu chỉ định một giá trị, nó áp dụng cho cả điểm bắt đầu và kết thúc của trang trí văn bản. Nếu chỉ định hai giá trị, giá trị đầu tiên áp dụng cho điểm bắt đầu và giá trị thứ hai áp dụng cho điểm kết thúc của trang trí văn bản.
- `auto`
  - : Trình duyệt chọn lượng inset bắt đầu và kết thúc để đảm bảo rằng, nếu hai hộp văn bản được trang trí xuất hiện cạnh nhau, một khoảng cách sẽ được tạo ra giữa các trang trí văn bản của chúng để chúng không có vẻ như là một trang trí văn bản duy nhất.

## Mô tả

Mặc định, trang trí văn bản của một phần tử, được đặt bởi thuộc tính viết tắt {{cssxref("text-decoration")}} và các thuộc tính longhand liên quan, có cùng kích thước với văn bản được hiển thị.

Thuộc tính `text-decoration-inset` cho phép bạn điều chỉnh điểm bắt đầu và/hoặc điểm kết thúc của trang trí văn bản trong một vùng chứa văn bản. Điều này hữu ích để tạo ra các hiệu ứng mà bạn muốn trang trí văn bản được thu vào hoặc kéo ra từ chính văn bản, hoặc thay đổi vị trí. Xem [Các trường hợp sử dụng cơ bản](#các_trường_hợp_sử_dụng_cơ_bản) để xem ví dụ cho mỗi trường hợp.

Một giá trị `<length>` đơn sẽ đặt inset (nếu dương) hoặc outset (nếu âm) ở cả vị trí bắt đầu và kết thúc của trang trí văn bản. Để đặt vị trí bắt đầu và kết thúc riêng biệt, bạn có thể dùng hai giá trị `<length>` — giá trị đầu tiên áp dụng cho vị trí bắt đầu và giá trị thứ hai áp dụng cho vị trí kết thúc.

Thuộc tính `text-decoration-inset` cũng có thể nhận từ khóa `auto`. Điều này khiến trình duyệt thu nhỏ điểm bắt đầu và kết thúc của trang trí văn bản để đảm bảo rằng, nếu hai hộp văn bản được trang trí xuất hiện cạnh nhau, chúng không có vẻ như có một trang trí văn bản duy nhất. Giá trị `auto` đặc biệt quan trọng khi hiển thị văn bản tiếng Trung, nơi gạch chân được dùng để [dấu câu danh từ riêng](https://www.w3.org/International/clreq/#id88), và các danh từ riêng liền kề phải có các gạch chân riêng biệt. Xem [Tác dụng của giá trị `auto`](#tác_dụng_của_giá_trị_auto) để xem ví dụ.

Giá trị `auto` không có tác dụng giống như giá trị ban đầu `0`. Đặt `text-decoration-inset` là `0` sẽ không tạo ra khoảng cách giữa các trang trí.

Thuộc tính `text-decoration-inset` không được kế thừa và không phải là thuộc tính thành phần của thuộc tính viết tắt {{cssxref("text-decoration")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Các trường hợp sử dụng cơ bản

Trong ví dụ này, chúng ta minh họa các trường hợp sử dụng outset, inset và "dịch chuyển".

#### HTML

Chúng ta định nghĩa một danh sách không có thứ tự với ba mục danh sách, mỗi mục có một `id` riêng.

```html live-sample___use-case-examples
<ul>
  <li id="one">Outset decoration</li>
  <li id="two">Inset decoration</li>
  <li id="three">Shifted decoration</li>
</ul>
```

#### CSS

Chúng ta đặt {{cssxref("text-decoration")}} và `text-decoration-inset` khác nhau cho mỗi mục danh sách:

- Mục đầu tiên có gạch chân màu xanh lá cây dày, được kéo ra đều `10px` trên cả hai phía.
- Mục thứ hai có gạch ngang trắng dày vừa, được thu vào đều `0.5em` trên cả hai phía.
- Mục thứ ba có gạch chân lượn sóng màu xanh mỏng, được dịch chuyển sang phải `1em`.

```css hidden live-sample___use-case-examples
li {
  font-family: sans-serif;
  font-size: 2em;
  margin-bottom: 20px;
}

@supports not (text-decoration-inset: auto) {
  body::before {
    content: "Your browser doesn't support the text-decoration-inset property.";
    background-color: wheat;
    display: block;
    padding: 10px 0;
    width: 100%;
    text-align: center;
  }
}
```

```css live-sample___use-case-examples
#one {
  text-decoration: underline 0.3em limegreen;
  text-decoration-inset: -10px;
}

#two {
  text-decoration: line-through 5px white;
  text-decoration-inset: 0.5em;
}

#three {
  text-decoration: underline wavy 2px blue;
  text-decoration-inset: 1em -1em;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("use-case-examples", "100%", "230")}}

### Tác dụng của giá trị `auto`

Ví dụ này minh họa tác dụng của giá trị `text-decoration-inset: auto`.

#### HTML

Chúng ta định nghĩa hai nhóm các phần tử {{htmlelement("u")}} cạnh nhau:

```html live-sample___auto-example
<p lang="zh" id="one"><u>石井</u><u>艾俐俐</u></p>

<p lang="zh" id="two"><u>石井</u><u>艾俐俐</u></p>
```

#### CSS

Mỗi phần tử `<u>` có màu `red` và độ dày `3px` được đặt trên gạch chân của nó. Nhóm `<u>` đầu tiên có giá trị `text-decoration-inset` là `auto`, trong khi nhóm thứ hai có giá trị `text-decoration-inset` ban đầu là `0` được đặt rõ ràng, để so sánh:

```css hidden live-sample___auto-example
u {
  font-family: sans-serif;
  font-size: 2em;
}

@supports not (text-decoration-inset: auto) {
  body::before {
    content: "Your browser doesn't support the text-decoration-inset property.";
    background-color: wheat;
    display: block;
    padding: 10px 0;
    width: 100%;
    text-align: center;
  }
}
```

```css live-sample___auto-example
u {
  text-decoration-color: red;
  text-decoration-thickness: 3px;
}

#one u {
  text-decoration-inset: auto;
}

#two u {
  text-decoration-inset: 0;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("auto-example", "100%", "200")}}

Lưu ý cách giá trị `auto` thu nhỏ trang trí văn bản một cách tinh tế trên cả hai phía, tạo ra khoảng cách giữa các gạch chân của hai phần tử (không có khoảng cách nào được thêm giữa hai phần tử). Giá trị `0` dẫn đến không có khoảng cách.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-decoration")}}
- Mô-đun [CSS text decoration](/en-US/docs/Web/CSS/Guides/Text_decoration)
