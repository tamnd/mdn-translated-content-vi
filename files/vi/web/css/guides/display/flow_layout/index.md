---
title: CSS flow layout
short-title: Flow layout
slug: Web/CSS/Guides/Display/Flow_layout
page-type: guide
sidebar: cssref
---

_Normal Flow_, hay Flow Layout, là cách các phần tử block và inline được hiển thị trên trang trước khi bất kỳ thay đổi nào được thực hiện đối với layout của chúng. Flow về cơ bản là một tập hợp những thứ đang cùng làm việc với nhau và biết về nhau trong layout của bạn. Một khi một thứ gì đó bị đưa _ra khỏi flow_, nó hoạt động độc lập.

Trong normal flow, các phần tử **{{Glossary("Inline-level_content", "inline")}}** hiển thị theo hướng inline, tức là theo hướng các từ được hiển thị trong một câu theo [Writing Mode](/en-US/docs/Web/CSS/Guides/Writing_modes) của tài liệu. Các phần tử **{{Glossary("Block/CSS", "block")}}** hiển thị lần lượt, như các đoạn văn trong Writing Mode của tài liệu đó. Trong tiếng Anh do đó, các phần tử inline hiển thị lần lượt, bắt đầu từ bên trái, và các phần tử block bắt đầu từ trên cùng và di chuyển xuống trang.

## Ví dụ cơ bản

Ví dụ sau đây minh họa các hộp Block và Inline Level. Hai phần tử đoạn văn với border màu xanh lá là Block Level, hiển thị bên dưới nhau.

Câu đầu tiên cũng bao gồm một phần tử span với nền màu xanh dương. Đây là inline level và do đó hiển thị tại chỗ trong câu.

```html hidden live-sample___normal-flow
<div class="box">
  <p>
    One <span>November</span> night in the year 1782, so the story runs, two
    brothers sat over their winter fire in the little French town of Annonay,
    watching the grey smoke-wreaths from the hearth curl up the wide chimney.
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css hidden live-sample___normal-flow
body {
  font: 1.2em sans-serif;
}

p {
  border: 2px solid green;
}
span {
  background-color: lightblue;
}
```

{{EmbedLiveSample("normal-flow", "", "250px")}}

## Xem thêm

- [Block and inline layout in normal flow](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout)
- [In flow and out of flow](/en-US/docs/Web/CSS/Guides/Display/In_flow_and_out_of_flow)
- [Formatting contexts explained](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts)
- [Flow layout and writing modes](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes)
- [Flow layout and overflow](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_overflow)
