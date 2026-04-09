---
title: Thuộc tính toàn cục HTML contenteditable
short-title: contenteditable
slug: Web/HTML/Reference/Global_attributes/contenteditable
page-type: html-attribute
browser-compat: html.global_attributes.contenteditable
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`contenteditable`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) là thuộc tính enumerated cho biết nếu phần tử có thể được chỉnh sửa bởi người dùng. Nếu có, trình duyệt sẽ sửa đổi widget của nó để cho phép chỉnh sửa.

{{InteractiveExample("HTML Demo: contenteditable", "tabbed-shorter")}}

```html interactive-example
<blockquote contenteditable="true">
  <p>Edit this content to add your own quote</p>
</blockquote>

<cite contenteditable="true">-- Write your own name here</cite>
```

```css interactive-example
blockquote {
  background: #eeeeee;
  border-radius: 5px;
  margin: 16px 0;
}

blockquote p {
  padding: 15px;
}

cite {
  margin: 16px 32px;
  font-weight: bold;
}

blockquote p::before {
  content: "\201C";
}

blockquote p::after {
  content: "\201D";
}

[contenteditable="true"] {
  caret-color: red;
}
```

## Giá trị

Thuộc tính phải nhận một trong các giá trị sau:

- `true` hoặc _chuỗi rỗng_, cho biết rằng phần tử có thể chỉnh sửa.
- `false`, cho biết rằng phần tử không thể chỉnh sửa.
- `plaintext-only`, cho biết văn bản thô của phần tử có thể chỉnh sửa, nhưng định dạng văn bản phong phú bị tắt.

Nếu thuộc tính được đặt mà không có giá trị, như `<label contenteditable>Example Label</label>`, giá trị của nó được coi là chuỗi rỗng.

Nếu thuộc tính này thiếu hoặc giá trị của nó không hợp lệ, giá trị của nó được _kế thừa_ từ phần tử cha của nó: vì vậy phần tử có thể chỉnh sửa nếu cha của nó có thể chỉnh sửa.

Lưu ý rằng mặc dù các giá trị được phép bao gồm `true` và `false`, thuộc tính này là thuộc tính _[enumerated](/en-US/docs/Glossary/Enumerated)_ chứ không phải thuộc tính _Boolean_.

Bạn có thể đặt màu được dùng để vẽ {{Glossary("caret")}} chèn văn bản bằng thuộc tính CSS {{cssxref("caret-color")}}.

Các phần tử được làm có thể chỉnh sửa, và do đó tương tác, bằng cách dùng thuộc tính `contenteditable` có thể được lấy tiêu điểm. Chúng tham gia điều hướng bàn phím tuần tự. Tuy nhiên, các phần tử có thuộc tính `contenteditable` được lồng trong các phần tử `contenteditable` khác không được thêm vào chuỗi tab theo mặc định. Bạn có thể thêm các phần tử `contenteditable` lồng nhau vào chuỗi điều hướng bàn phím bằng cách chỉ định giá trị `tabindex` ([`tabindex="0"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)).

Nếu nội dung được dán vào phần tử có `contenteditable="true"`, tất cả định dạng được giữ lại. Nếu nội dung được dán vào phần tử có `contenteditable="plaintext-only"`, tất cả định dạng bị xóa.

## Ví dụ

### Dán nội dung vào contenteditable

Ví dụ này có hai phần tử {{HTMLElement("div")}} với `contenteditable`, phần tử đầu tiên có giá trị `true` và phần tử thứ hai có giá trị `plaintext-only`. Sao chép nội dung bên dưới và dán vào mỗi `div` để xem hiệu lực của chúng.

#### HTML

```html hidden
<h2>Content to copy</h2>
<p class="instructions">
  Copy all the text in the block below and paste it into each of the
  contenteditable blocks to compare the results.
</p>
<section class="copying">
  <div class="copy">
    <p>
      This is a paragraph containing <strong>Bold</strong>, <em>Italic</em>, and
      <span class="red">red</span> text, followed by an ordered list:
    </p>
    <ol>
      <li>Step one</li>
      <li>Step two</li>
      <li>Step three</li>
    </ol>
  </div>
</section>
```

```html
<h2>Pasting areas</h2>
<section class="pasting">
  <div class="wrapper">
    <h3>contenteditable="true"</h3>
    <div contenteditable="true"></div>
  </div>
  <div class="wrapper">
    <h3>contenteditable="plaintext-only"</h3>
    <div contenteditable="plaintext-only"></div>
  </div>
</section>
```

```css hidden
h2 {
  margin-bottom: 0;
}
.copying {
  font-family: "Georgia", serif;
  margin: 1rem;
  padding: 1rem;
  border: solid black 1px;
}
.red {
  color: red;
}
.pasting {
  display: flex;
  flex-direction: row;
  gap: 1rem;
  width: 100%;
  .wrapper {
    flex: 1 1;
    margin: 0;
    padding: 0;
  }
  h3 {
    font-family: monospace;
  }
  [contenteditable] {
    min-height: 3rem;
    border: solid 1px;
    padding: 0.5rem;
    background-color: whitesmoke;
  }
  [contenteditable="true"] {
    caret-color: blue;
  }
  [contenteditable="plaintext-only"] {
    caret-color: red;
  }
}
```

{{EmbedLiveSample("Pasting_Content_into_contenteditable", 400, 620)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
- {{domxref("HTMLElement.contentEditable")}} và {{domxref("HTMLElement.isContentEditable")}}
- Thuộc tính CSS {{cssxref("caret-color")}}
- [HTMLElement sự kiện `input`](/en-US/docs/Web/API/Element/input_event)
