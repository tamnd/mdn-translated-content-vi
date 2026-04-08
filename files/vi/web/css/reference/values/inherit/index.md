---
title: inherit
slug: Web/CSS/Reference/Values/inherit
page-type: css-keyword
browser-compat: css.types.global_keywords.inherit
sidebar: cssref
---

Từ khóa **`inherit`** trong [CSS](/vi/docs/Web/CSS) khiến phần tử lấy [giá trị tính toán](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của thuộc tính từ phần tử cha. Nó có thể được áp dụng cho bất kỳ thuộc tính CSS nào, kể cả thuộc tính viết tắt {{cssxref("all")}}.

Đối với [các thuộc tính kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance#inherited_properties), từ khóa này củng cố hành vi mặc định và chỉ cần thiết khi cần ghi đè một quy tắc khác.

> [!NOTE]
> Kế thừa luôn xảy ra từ phần tử cha trong cây tài liệu, ngay cả khi phần tử cha không phải là khối chứa.

## Ví dụ

### Sử dụng cơ bản

Trong ví dụ này, chúng ta minh họa hiệu ứng của từ khóa `inherit` bằng cách so sánh hai đoạn văn có các phần tử lồng nhau: các phần tử nội tuyến trong đoạn thứ nhất sử dụng kiểu mặc định của trình duyệt, trong khi những phần tử ở đoạn thứ hai kế thừa từng giá trị thuộc tính từ phần tử cha.

#### HTML

Chúng ta đưa vào hai đoạn văn giống hệt nhau với một số phần tử nội tuyến.

```html
<p>
  This paragraph has <em>emphasized text</em>, <strong>strong text</strong>, and
  <a href="#">a link to top</a>.
</p>
<p>
  This paragraph has <em>emphasized text</em>, <strong>strong text</strong>, and
  <a href="#">a link to top</a>.
</p>
```

#### CSS

Chúng ta không tạo kiểu cho các phần tử nội tuyến trong đoạn văn đầu tiên, vì vậy chúng sử dụng kiểu mặc định của trình duyệt.
Trong đoạn văn thứ hai, chúng ta đặt thuộc tính của mỗi phần tử nội tuyến thành `inherit`, để chúng nhận kiểu tính toán từ phần tử cha {{htmlelement("p")}}.

```css
p:nth-of-type(2) {
  a {
    text-decoration: inherit;
    color: inherit;
  }
  em {
    font-style: inherit;
  }
  strong {
    font-weight: inherit;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Basic usage", "100%", 100)}}

### Kế thừa tất cả giá trị thuộc tính

Trong ví dụ này, chúng ta sử dụng cùng một HTML như ví dụ trước để minh họa các vấn đề có thể xảy ra khi từ khóa `inherit` được áp dụng cho tất cả các thuộc tính.

```html hidden
<p>
  This paragraph has <em>emphasized text</em>, <strong>strong text</strong>, and
  <a href="#">a link to top</a>.
</p>
<p>
  This paragraph has <em>emphasized text</em>, <strong>strong text</strong>, and
  <a href="#">a link to top</a>.
</p>
```

#### CSS

Trong đoạn văn thứ hai, thay vì đặt từng thuộc tính thành `inherit`, chúng ta đặt thuộc tính {{cssxref("all")}} trên tất cả các phần tử nội tuyến thành `inherit`, để chúng đều nhận kiểu tính toán từ phần tử cha {{htmlelement("p")}}.

```css
p:nth-of-type(2) > * {
  all: inherit;
}
```

#### Kết quả

{{EmbedLiveSample("Inheriting all property values", "100%", 270)}}

Lưu ý rằng phần tử nội tuyến kế thừa tất cả các thuộc tính từ phần tử `<p>` cha, bao gồm cả giá trị {{cssxref("display")}} ở cấp khối của đoạn văn. Đây có thể không phải là hiệu ứng bạn mong muốn.

### Loại trừ các phần tử đã chọn khỏi một quy tắc

Ví dụ này minh họa cách từ khóa `inherit` có thể được dùng để loại trừ các phần tử đã chọn khỏi một quy tắc màu, cho phép chúng sử dụng màu của phần tử cha thay thế.

#### HTML

Chúng ta đưa vào một số nội dung được cấu trúc theo ngữ nghĩa.

```html
<header>
  <h1>This is my blog</h1>
  <h2>This is the subtitle of my blog in the HEADER</h2>
  <p>My blog is not very interesting</p>
</header>
<main>
  <h2>This first blog post in MAIN</h2>
  <p>I really have nothing to say.</p>
  <section>
    <h2>This second blog post is in a SECTION within MAIN</h2>
    <p>
      It is in a section because it is important even though it isn't the least
      bit interesting.
    </p>
  </section>
</main>
<footer>
  <h2>Contact in FOOTER</h2>
  <p>Find me on Mastodon</p>
  <section>
    <h2>Copyright in SECTION within FOOTER</h2>
    <p>1996</p>
  </section>
</footer>
```

#### CSS

Chúng ta đặt màu chữ của phần tử `<main>` thành `blue` và tất cả phần tử `<h2>` thành `green` với phông chữ `monospace`. Các phần tử `<h2>` bên trong `<section>` được đặt thành `inherit` màu chữ từ phần tử cha.

```css
main {
  color: blue;
}

h2 {
  color: green;
  font-family: monospace;
}

section h2 {
  color: inherit;
}
```

#### Kết quả

{{EmbedLiveSample("Exclude selected elements from a rule", "100%", 470)}}

Tất cả phần tử `<h2>` đều có màu `green`. Tuy nhiên, nếu chúng được lồng trong phần tử {{htmlelement("section")}}, chúng kế thừa màu từ phần tử cha, là `blue` bên trong {{htmlelement("main")}}. Màu chữ mặc định là đen trong các trường hợp còn lại.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các từ khóa {{cssxref("initial")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}} và {{cssxref("unset")}}
- [Kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance)
