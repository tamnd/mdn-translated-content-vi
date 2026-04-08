---
title: <display-box>
slug: Web/CSS/Reference/Values/display-box
page-type: css-type
browser-compat: css.properties.display.contents
sidebar: cssref
---

Các từ khóa này xác định liệu một phần tử có tạo ra hộp hiển thị hay không.

## Cú pháp

Các giá trị `<display-box>` hợp lệ:

- `contents`
  - : Các phần tử này không tự tạo ra hộp cụ thể. Chúng được thay thế bởi hộp giả và các hộp con của chúng. Lưu ý rằng thông số kỹ thuật CSS Display Cấp 3 định nghĩa cách giá trị `contents` ảnh hưởng đến các "phần tử bất thường" — những phần tử không được hiển thị thuần túy bằng các khái niệm hộp CSS như các phần tử thay thế. Xem [Phụ lục B: Tác động của display: contents trên các phần tử bất thường](https://drafts.csswg.org/css-display/#unbox) để biết thêm chi tiết.

    _Do một lỗi trong các trình duyệt, hiện tại điều này sẽ loại bỏ phần tử khỏi cây trợ năng — trình đọc màn hình sẽ không nhìn vào nội dung bên trong. Xem phần [Trợ năng](#accessibility) bên dưới để biết thêm chi tiết._

- `none`
  - : Tắt hiển thị của một phần tử để nó không có tác động đến bố cục (tài liệu được hiển thị như thể phần tử không tồn tại). Tất cả các phần tử con cũng bị tắt hiển thị.
    Để một phần tử chiếm không gian mà nó thường chiếm, nhưng không thực sự hiển thị bất cứ điều gì, hãy dùng thuộc tính {{CSSxRef("visibility")}} thay thế.

## Trợ năng

Các triển khai hiện tại trong hầu hết các trình duyệt sẽ loại bỏ khỏi [cây trợ năng](/vi/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis) bất kỳ phần tử nào có giá trị `display` là `contents`. Điều này sẽ khiến phần tử — và trong một số phiên bản trình duyệt, các phần tử con của nó — không còn được công nghệ đọc màn hình thông báo. Đây là hành vi không đúng theo [thông số kỹ thuật CSSWG](https://drafts.csswg.org/css-display/#the-display-properties).

- [More accessible markup with display: contents | Hidde de Vries](https://hidde.blog/more-accessible-markup-with-display-contents/)
- [Display: Contents Is Not a CSS Reset | Adrian Roselli](https://adrianroselli.com/2018/05/display-contents-is-not-a-css-reset.html)

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Trong ví dụ đầu tiên này, đoạn văn có class `secret` được đặt thành `display: none`; hộp và bất kỳ nội dung nào bây giờ không được hiển thị.

### display: none

#### HTML

```html
<p>Văn bản hiển thị</p>
<p class="secret">Văn bản ẩn</p>
```

#### CSS

```css
p.secret {
  display: none;
}
```

#### Kết quả

{{EmbedLiveSample("display_none", "100%", 60)}}

### display: contents

Trong ví dụ này, phần tử {{htmlelement("div")}} ngoài có đường viền đỏ 2 pixel và chiều rộng 300px. Tuy nhiên, nó cũng có `display: contents` được chỉ định, do đó `<div>` này sẽ không được hiển thị, đường viền và chiều rộng sẽ không còn áp dụng, và phần tử con sẽ được hiển thị như thể phần tử cha chưa bao giờ tồn tại.

#### HTML

```html
<div class="outer">
  <div>Div trong.</div>
</div>
```

#### CSS

```css
.outer {
  border: 2px solid red;
  width: 300px;
  display: contents;
}

.outer > div {
  border: 1px solid green;
}
```

#### Kết quả

{{EmbedLiveSample("display_contents", 300, 60)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("display")}}
  - {{CSSxRef("&lt;display-outside&gt;")}}
  - {{CSSxRef("&lt;display-inside&gt;")}}
  - {{CSSxRef("&lt;display-listitem&gt;")}}
  - {{CSSxRef("&lt;display-internal&gt;")}}
  - {{CSSxRef("&lt;display-legacy&gt;")}}

- [Display: Contents Is Not a CSS Reset | Adrian Roselli](https://adrianroselli.com/2018/05/display-contents-is-not-a-css-reset.html)
- [More accessible markup with display: contents](https://hidde.blog/more-accessible-markup-with-display-contents/) bởi Hidde de Vries (2018)
