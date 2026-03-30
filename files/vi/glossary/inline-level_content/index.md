---
title: Inline-level content
slug: Glossary/Inline-level_content
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, nội dung tham gia vào bố cục inline được gọi là **nội dung inline** (inline-level content). Hầu hết các chuỗi văn bản, phần tử thay thế (replaced elements), và nội dung được tạo ra đều là inline theo mặc định.

Trong bố cục inline, một luồng hỗn hợp gồm văn bản, {{ glossary("replaced elements")}}, và các hộp inline khác được sắp xếp bằng cách phân mảnh chúng thành một chồng các hộp dòng (line boxes). Trong mỗi hộp dòng, các hộp inline được căn chỉnh theo chiều dọc hoặc chiều ngang với nhau, tùy thuộc vào chế độ viết. Thông thường, chúng được căn chỉnh theo đường cơ sở (baseline) của văn bản. Điều này có thể thay đổi bằng CSS.

![inline layout](inline_layout.png)

> [!NOTE]
> Các phần tử HTML (_HyperText Markup Language_) trước đây được phân loại là phần tử "block-level" hoặc phần tử "inline". Đây là đặc tính trình bày và hiện tại được xác định bởi CSS.

## Ví dụ

```html
<p>
  This span is an <span class="highlight">inline-level element</span>; its
  background has been colored to display both the beginning and end of the
  element's influence. Input elements, like <input type="radio" /> and
  <input type="checkbox" />, are also inline-level content.
</p>
```

Trong ví dụ này, phần tử {{HTMLElement("p")}} chứa một số văn bản. Trong văn bản đó có một phần tử {{HTMLElement("span")}} và hai phần tử {{HTMLElement("input")}}, đây đều là các phần tử inline. Nếu `<span>` trải dài qua hai dòng, hai hộp dòng sẽ được tạo ra. Vì các phần tử này là inline, đoạn văn sẽ được hiển thị đúng như một đoạn văn bản liên tục không bị ngắt:

```css hidden
body {
  margin: 0;
  padding: 4px;
  border: 1px solid #333333;
}

.highlight {
  background-color: #eeee33;
}
```

{{EmbedLiveSample("Examples")}}

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Block-level content")}}
- [Ngữ cảnh định dạng inline](/en-US/docs/Web/CSS/Guides/Inline_layout/Inline_formatting_context)
- {{cssxref("display")}}
