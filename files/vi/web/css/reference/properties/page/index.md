---
title: page
slug: Web/CSS/Reference/Properties/page
page-type: css-property
browser-compat: css.properties.page
sidebar: cssref
---

Thuộc tính **`page`** [CSS](/en-US/docs/Web/CSS) được dùng để chỉ định trang có tên, một loại trang cụ thể được xác định bởi quy tắc at {{cssxref("@page")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).

Nếu có nhiều bộ chọn sử dụng một trang có tên liên tiếp nhau thì có thể cần ngắt trang cưỡng bức bằng {{cssxref("break-after")}}.

## Cú pháp

```css
/* đặt trang có tên */
page: exampleName;
page: chapterIntro;

/* Dùng trang có tên của tổ tiên */
page: auto; /* giá trị mặc định */

/* Giá trị toàn cục */
page: inherit;
page: initial;
page: revert;
page: revert-layer;
page: unset;
```

### Giá trị

- `auto`
  - : Giá trị mặc định. Sử dụng giá trị của tổ tiên gần nhất có giá trị khác `auto`. Nếu không có tổ tiên nào đặt giá trị trang có tên, giá trị được dùng cho auto là chuỗi rỗng.
- {{cssxref("custom-ident")}}
  - : Tên phân biệt chữ hoa chữ thường được xác định trong một quy tắc at {{cssxref("@page")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ về trang có tên

Trong ví dụ này, có hai phần trong HTML; điều khiển in và nội dung cần in.
Các điều khiển in cho phép người dùng chọn cách các `section` trong `article` sẽ được in.

```html live-sample___page-property
<!-- print options in a fieldset -->
<fieldset id="printStyle">
  <legend>How would you like to print</legend>
  <label for="single">
    <input type="radio" id="single" name="type" value="single" checked />
    No Pages
  </label>
  <label for="grouped">
    <input type="radio" id="grouped" name="type" value="grouped" />Pages with
    Grouped Chapters
  </label>
  <label for="paged">
    <input type="radio" id="paged" name="type" value="paged" />
    Chapters Paged
  </label>
  <button id="print">Print</button>
</fieldset>

<!-- Content to be printed -->
<article id="print-area" data-print="single">
  <section id="toc">
    <h2>Table of contents</h2>
    <ul>
      <li>Foreword</li>
      <li>Introduction</li>
      <li>Chapter One - named pages</li>
      <li>Chapter Two - page orientation</li>
      <li>Chapter Three - page margins</li>
      <li>Conclusion</li>
    </ul>
  </section>
  <section id="foreword">
    <h2>Foreword</h2>
    <p>
      This book is all about how the CSS <code>@page</code> at-rule can help
      with printing HTML books.
    </p>
  </section>
  <section id="introduction">
    <h2>Introduction</h2>
    <p>
      This book is a concept to show how an <em>HTML</em> document can easily be
      printed out in pages.
    </p>
  </section>
  <section id="chapter1" class="chapter">
    <h2>Named pages</h2>
    <p>Lorem ipsum</p>
  </section>
  <section id="chapter2" class="chapter">
    <h2>Page Orientation</h2>
    <p>Lorem ipsum</p>
  </section>
  <section id="chapter3" class="chapter">
    <h2>Page Margins</h2>
    <p>There are 16 page margins that can be set:</p>
    <ul>
      <li>@top-left-corner</li>
      <li>@top-left</li>
      <li>@top-center</li>
      <li>@top-right</li>
      <li>@top-right-corner</li>
      <li>@left-top</li>
      <li>@left-middle</li>
      <li>@left-bottom</li>
      <li>@right-top</li>
      <li>@right-middle</li>
      <li>@right-bottom</li>
      <li>@bottom-left-corner</li>
      <li>@bottom-left</li>
      <li>@bottom-center</li>
      <li>@bottom-right</li>
      <li>@bottom-right-corner</li>
    </ul>
    <p>They can be used to show what appears in these parts of the margin</p>
  </section>
  <section id="conclusion">
    <h2>Conclusion</h2>
    <p>Now go ahead and write books.</p>
  </section>
</article>
```

Phần đầu tiên của CSS thiết lập các trang **có tên**, bao gồm kích thước và hướng cũng như một số nội dung để đưa vào [lề `@top-center`](/en-US/docs/Web/CSS/Reference/At-rules/@page#margin_at-rules) của các trang được in.

```css live-sample___page-property
@page toc {
  size: a4 portrait;
  @top-center {
    content: "Table of contents";
  }
}

@page foreword {
  size: a4 portrait;
  @top-center {
    content: "Foreword";
  }
}

@page introduction {
  size: a4 portrait;
  @top-center {
    content: "Introduction";
  }
}

@page conclusion {
  size: a4 portrait;
  @top-center {
    content: "Conclusion";
  }
}

@page chapter {
  size: a4 landscape;
  @top-center {
    content: "Chapter";
  }
}
```

```css hidden live-sample___page-property
fieldset {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  gap: 1rem;
  width: fit-content;
}
body {
  font: 1.1em sans-serif;
}
```

Phần tiếp theo của CSS sử dụng [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) để áp dụng kích thước in, hướng và lề được xác định trong các quy tắc `@page` có tên ở phần CSS trước lên các phần tử sử dụng thuộc tính `page`.
Các section có `class="chapter"` liên tiếp nhau và xuất hiện như một trang.
`break-after: page;` được dùng để tách chúng ra, chia mỗi chương thành một trang in riêng.

```css live-sample___page-property
@media print {
  fieldset {
    display: none;
  }
  section {
    font-size: 2rem;
    font-family: "Roboto", sans-serif;
  }
  .chapter {
    border: tomato 2px solid;
  }
  [data-print="grouped"] > #toc,
  [data-print="paged"] > #toc {
    page: toc;
    font-family: "Courier New";
  }
  [data-print="grouped"] > #foreword,
  [data-print="paged"] > #foreword {
    page: foreword;
    font-family: "Courier New";
  }
  [data-print="grouped"] > #introduction,
  [data-print="paged"] > #introduction {
    page: introduction;
    font-family: "Courier New";
  }
  [data-print="grouped"] > #conclusion,
  [data-print="paged"] > #conclusion {
    page: conclusion;
    font-family: "Courier New";
  }
  [data-print="grouped"] > .chapter,
  [data-print="paged"] > .chapter {
    page: chapter;
  }
  [data-print="paged"] > .chapter {
    border: none;
    break-after: page;
  }
  .chapter > ul {
    columns: 2;
  }
}
```

JavaScript cập nhật giá trị của thuộc tính `data-print`, là thuộc tính mà trang có tên được áp dụng, khi bạn chọn một tùy chọn in khác:

```js live-sample___page-property
const printArea = document.querySelector("#print-area");
const printButton = document.querySelector("#print");
const printOption = document.querySelector("#printStyle");

printOption.addEventListener("change", (event) => {
  if (event.target.value === "single") {
    printArea.dataset.print = "single";
  } else if (event.target.value === "grouped") {
    printArea.dataset.print = "grouped";
  } else {
    printArea.dataset.print = "paged";
  }
});

printButton.addEventListener("click", () => {
  window.print();
});
```

Nội dung được in và nội dung hiển thị trong hộp thoại xem trước in sẽ thay đổi tùy thuộc vào tùy chọn in radio button được chọn:

{{EmbedLiveSample('page-property', '100%', '540', , , , , "allow-modals")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
