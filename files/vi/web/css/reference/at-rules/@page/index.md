---
title: "@page"
slug: Web/CSS/Reference/At-rules/@page
page-type: css-at-rule
browser-compat: css.at-rules.page
sidebar: cssref
---

At-rule **`@page`** là một at-rule CSS dùng để chỉnh sửa các khía cạnh khác nhau của trang in. Nó nhắm đến và chỉnh sửa kích thước, hướng và lề của trang. At-rule `@page` có thể được dùng để nhắm đến tất cả các trang trong bản in hoặc một tập hợp con sử dụng các lớp giả khác nhau của nó.

## Cú pháp

```css
/* Nhắm đến tất cả các trang */
@page {
  size: 8.5in 9in;
  margin-top: 4in;
}

/* Nhắm đến tất cả các trang có số chẵn */
@page :left {
  margin-top: 4in;
}

/* Nhắm đến tất cả các trang có số lẻ */
@page :right {
  size: 11in;
  margin-top: 4in;
}

/* Nhắm đến tất cả các selector có thiết lập `page: wide;` */
@page wide {
  size: a4 landscape;
}

@page {
  /* hộp lề ở góc trên bên phải hiển thị số trang */
  @top-right {
    content: "Page " counter(pageNumber);
  }
}
```

### Thuộc tính trang

At-rule `@page` chỉ có thể chứa các mô tả trang và [at-rule lề](#at-rule_lề). Các mô tả sau đây đã được triển khai bởi ít nhất một trình duyệt:

- {{cssxref("margin")}}
  - : Chỉ định lề của trang. Các thuộc tính lề riêng lẻ {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}} và {{cssxref("margin-left")}} cũng có thể được sử dụng.
- [`page-orientation`](/en-US/docs/Web/CSS/Reference/At-rules/@page/page-orientation)
  - : Chỉ định hướng của trang. Điều này không ảnh hưởng đến bố cục của trang; việc xoay được áp dụng sau khi bố cục trong phương tiện đầu ra.
- [`size`](/en-US/docs/Web/CSS/Reference/At-rules/@page/size)
  - : Chỉ định kích thước mục tiêu và hướng của khối chứa hộp trang. Trong trường hợp tổng quát, nơi một hộp trang được kết xuất trên một tờ trang, nó cũng chỉ ra kích thước của tờ trang đích.

Thông số kỹ thuật đề cập đến các thuộc tính CSS sau đây có thể áp dụng cho hộp trang thông qua at-rule @page. Tuy nhiên, những thuộc tính này _chưa được hỗ trợ_ bởi bất kỳ tác nhân người dùng nào.

<details>
<summary>Các thuộc tính trang còn lại</summary>

| Tính năng             | Thuộc tính CSS        |
| --------------------- | --------------------- |
| bidi properties       | direction             |
| background properties | background-color      |
|                       | background-image      |
|                       | background-repeat     |
|                       | background-attachment |
|                       | background-position   |
|                       | background            |
| border properties     | border-top-width      |
|                       | border-right-width    |
|                       | border-bottom-width   |
|                       | border-left-width     |
|                       | border-width          |
|                       | border-top-color      |
|                       | border-right-color    |
|                       | border-bottom-color   |
|                       | border-left-color     |
|                       | border-color          |
|                       | border-top-style      |
|                       | border-right-style    |
|                       | border-bottom-style   |
|                       | border-left-style     |
|                       | border-short-style    |
|                       | border-top            |
|                       | border-right          |
|                       | border-bottom         |
|                       | border-left           |
|                       | border                |
| counter properties    | counter-reset         |
|                       | counter-increment     |
| color                 | color                 |
| font properties       | font-family           |
|                       | font-size             |
|                       | font-style            |
|                       | font-variant          |
|                       | font-weight           |
|                       | font                  |
| height properties     | height                |
|                       | min-height            |
|                       | max-height            |
| line height           | line-height           |
| margin properties     | margin-top            |
|                       | margin-right          |
|                       | margin-bottom         |
|                       | margin-left           |
|                       | margin                |
| outline properties    | outline-width         |
|                       | outline-style         |
|                       | outline-color         |
|                       | outline               |
| padding properties    | padding-top           |
|                       | padding-right         |
|                       | padding-bottom        |
|                       | padding-left          |
|                       | padding               |
| quotes                | quotes                |
| text properties       | letter-spacing        |
|                       | text-align            |
|                       | text-decoration       |
|                       | text-indent           |
|                       | text-transform        |
|                       | white-space           |
|                       | word-spacing          |
| visibility            | visibility            |
| width properties      | width                 |
|                       | min-width             |
|                       | max-width             |

</details>

## Mô tả

Quy tắc @page định nghĩa các thuộc tính của hộp trang. At-rule `@page` có thể được truy cập thông qua giao diện mô hình đối tượng CSS {{domxref("CSSPageRule")}}.

> [!NOTE]
> W3C đang thảo luận về cách xử lý các đơn vị {{cssxref("&lt;length&gt;")}} liên quan đến viewport, `vh`, `vw`, `vmin` và `vmax`. Trong thời gian đó, không nên sử dụng chúng trong at-rule `@page`.

### Thuộc tính liên quan

At-rule `@page` cho phép người dùng gán tên cho quy tắc, sau đó được gọi trong một khai báo sử dụng thuộc tính `page`.

- {{Cssxref("page")}}
  - : Cho phép một selector sử dụng **trang được đặt tên** do người dùng định nghĩa

## Cú pháp chính thức

{{csssyntax}}

Trong đó `<page-body>` bao gồm:

- thuộc tính trang
- thuộc tính lề trang

và `<pseudo-page>` đại diện cho các lớp giả sau:

- {{Cssxref(":blank")}}
- {{Cssxref(":first")}}
- {{Cssxref(":left")}}
- {{Cssxref(":right")}}

## At-rule lề

Các at-rule lề được sử dụng bên trong at-rule `@page`. Mỗi cái nhắm đến một phần khác nhau của trang tài liệu được in, tạo kiểu cho khu vực của trang in dựa trên các giá trị thuộc tính được đặt trong khối kiểu:

```css
@page {
  @top-left {
    /* thuộc tính lề trang */
  }
}
```

**`@top-left`** nhắm đến phía trên bên trái của tài liệu và áp dụng các thay đổi dựa trên các thuộc tính lề trang được đặt.

Các at-rule lề khác bao gồm:

```css-nolint
@top-left-corner
@top-left
@top-center
@top-right
@top-right-corner
@bottom-left-corner
@bottom-left
@bottom-center
@bottom-right
@bottom-right-corner
@left-top
@left-middle
@left-bottom
@right-top
@right-middle
@right-bottom
```

### Thuộc tính lề trang

Các thuộc tính lề trang là tập hợp các thuộc tính CSS có thể được đặt trong bất kỳ at-rule lề riêng lẻ nào. Chúng bao gồm:

<details>
<summary>Thuộc tính lề trang</summary>

| Tính năng             | Thuộc tính CSS        |
| --------------------- | --------------------- |
| bidi properties       | direction             |
| background properties | background-color      |
|                       | background-image      |
|                       | background-repeat     |
|                       | background-attachment |
|                       | background-position   |
|                       | background            |
| border properties     | border-top-width      |
|                       | border-right-width    |
|                       | border-bottom-width   |
|                       | border-left-width     |
|                       | border-width          |
|                       | border-top-color      |
|                       | border-right-color    |
|                       | border-bottom-color   |
|                       | border-left-color     |
|                       | border-color          |
|                       | border-top-style      |
|                       | border-right-style    |
|                       | border-bottom-style   |
|                       | border-left-style     |
|                       | border-short-style    |
|                       | border-top            |
|                       | border-right          |
|                       | border-bottom         |
|                       | border-left           |
|                       | border                |
| counter properties    | counter-reset         |
|                       | counter-increment     |
| content               | content               |
| color                 | color                 |
| font properties       | font-family           |
|                       | font-size             |
|                       | font-style            |
|                       | font-variant          |
|                       | font-weight           |
|                       | font                  |
| height properties     | height                |
|                       | min-height            |
|                       | max-height            |
| line height           | line-height           |
| margin properties     | margin-top            |
|                       | margin-right          |
|                       | margin-bottom         |
|                       | margin-left           |
|                       | margin                |
| outline properties    | outline-width         |
|                       | outline-style         |
|                       | outline-color         |
|                       | outline               |
| padding properties    | padding-top           |
|                       | padding-right         |
|                       | padding-bottom        |
|                       | padding-left          |
|                       | padding               |
| quotes                | quotes                |
| text properties       | letter-spacing        |
|                       | text-align            |
|                       | text-decoration       |
|                       | text-indent           |
|                       | text-transform        |
|                       | white-space           |
|                       | word-spacing          |
| vertical alignment    | vertical-align        |
| visibility            | visibility            |
| width properties      | width                 |
|                       | min-width             |
|                       | max-width             |
| z-index               | z-index               |

</details>

## Trang được đặt tên

Các trang được đặt tên cho phép thực hiện bố cục từng trang và thêm [ngắt trang](/en-US/docs/Web/CSS/Guides/Fragmentation) theo cách khai báo khi in.

Các trang được đặt tên có thể được áp dụng bằng thuộc tính {{Cssxref("page")}}. Điều này cho phép người dùng tạo các cấu hình trang khác nhau để sử dụng trong bố cục in.

Một ví dụ về điều này có thể được tìm thấy trong các ví dụ của [`page`](/en-US/docs/Web/CSS/Reference/Properties/page#examples).

## Ví dụ

### Sử dụng thuộc tính size để thay đổi hướng trang

Ví dụ này cho thấy cách chia các phần tử `<section>` thành các trang riêng lẻ theo định dạng `landscape` với mỗi trang có lề 20% khi in.
Nhấp vào nút in sẽ mở hộp thoại in với các phần HTML được chia thành các trang riêng lẻ.

```html live-sample___page-size
<button>Print page</button>
<article>
  <section>
    <h2>Header one</h2>
    <p>Paragraph one.</p>
  </section>
  <section>
    <h2>Header two</h2>
    <p>Paragraph two.</p>
  </section>
  <section>
    <h2>Header three</h2>
    <p>Paragraph three.</p>
  </section>
</article>
```

```js live-sample___page-size
const button = document.querySelector("button");

button.addEventListener("click", () => {
  window.print();
});
```

```css live-sample___page-size
@page {
  size: landscape;
  margin: 2cm;
}

section {
  page-break-after: always;
  break-after: page;
}

@media print {
  button {
    display: none;
  }
}
```

```css hidden live-sample___page-size
body {
  font-family: "Helvetica", sans-serif;
  background-color: silver;
}

article {
  width: 100%;
}

section {
  display: grid;
  background-color: white;
  border-radius: 0.6rem;
  justify-items: center;
  padding: 1rem;
  width: 50%;
  print-color-adjust: exact;
  -webkit-print-color-adjust: exact;
  margin: 0 auto;
  margin-block-end: 1rem;
  border: 1px dashed;
}
```

{{EmbedLiveSample('page-size', '100%', '540', , , , , "allow-modals")}}

### Ví dụ lớp giả @page

Xem các [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) khác nhau của `@page` để biết ví dụ.

- {{Cssxref(":blank")}}
- {{Cssxref(":first")}}
- {{Cssxref(":left")}}
- {{Cssxref(":right")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("page")}}
- Mô tả `@page` [`size`](/en-US/docs/Web/CSS/Reference/At-rules/@page/size)
- Module [phương tiện phân trang CSS](/en-US/docs/Web/CSS/Guides/Paged_media)
- [\[META\] CSS Paged Media Module Level 3](https://bugzil.la/286443) Bugzilla để theo dõi tiến trình về chủ đề này (bộ đếm dựa trên trang, v.v.)
