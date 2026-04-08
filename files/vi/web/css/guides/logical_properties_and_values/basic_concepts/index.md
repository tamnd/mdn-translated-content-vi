---
title: Basic concepts of logical properties and values
short-title: Basic concepts
slug: Web/CSS/Guides/Logical_properties_and_values/Basic_concepts
page-type: guide
sidebar: cssref
---

[Module CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values#properties) định nghĩa các ánh xạ flow-relative cho nhiều {{glossary("physical properties")}} và giá trị trong CSS. Bài viết này thảo luận về module này và giải thích {{glossary("flow relative values")}} cùng các thuộc tính liên quan.

## Tại sao logical properties lại hữu ích

CSS 2.1 và các phiên bản trước đó định kích thước phần tử theo kích thước vật lý của màn hình. Do đó, chúng ta mô tả các hộp có {{CSSxRef("width")}} và {{CSSxRef("height")}}, định vị phần tử từ `top` và `left`, gán border, margin và padding cho `top`, `right`, `bottom`, `left`, v.v. Module Logical properties and values định nghĩa các ánh xạ cho những {{glossary("physical properties")}} và giá trị này sang các đối ứng logic, hay flow relative — ví dụ: `start` và `end` thay vì `left` và `right`/`top` và `bottom`.

Những ánh xạ này rất hữu ích cho các trang web được dịch sang ngôn ngữ có writing mode khác với bố cục gốc. Chẳng hạn, với CSS grid layout, nếu grid container có chiều rộng được áp dụng cùng với các thuộc tính {{CSSxRef("align-self")}} và {{CSSxRef("justify-self")}} để căn chỉnh các grid item, vì các thuộc tính này là flow relative, `justify-self: start` sẽ căn chỉnh item về phía đầu trên chiều inline, và `align-self: start` làm tương tự trên chiều block.

![Một grid trong writing mode ngang](grid-horizontal-width-sm.png)

Nếu writing mode của component này được thay đổi thành `vertical-rl` bằng thuộc tính {{CSSxRef("writing-mode")}}, việc căn chỉnh vẫn hoạt động theo cùng một cách. Chiều inline sẽ chạy dọc và chiều block chạy ngang. Tuy nhiên, grid trông không giống nhau vì chiều rộng được gán cho container là một phép đo ngang — gắn với đặc tính vật lý chứ không phải logic hay flow relative của văn bản.

![Một grid trong vertical writing mode.](grid-vertical-width-sm.png)

Nếu thay vì thuộc tính `width`, sử dụng thuộc tính logic {{CSSxRef("inline-size")}}, component sẽ hoạt động theo cùng một cách dù nó được hiển thị trong writing mode nào.

![Một grid layout trong vertical writing mode](grid-vertical-inline-size-small.png)

Bạn có thể thử điều này trong ví dụ trực tiếp bên dưới. Thay đổi `writing-mode` từ `vertical-rl` sang `horizontal-tb` trên `.grid` để xem cách các thuộc tính khác nhau thay đổi bố cục.

```html live-sample___intro-grid-example
<div class="grid">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```

```css hidden live-sample___intro-grid-example
body {
  font: 1.2em / 1.5 sans-serif;
}

.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: minmax(100px, auto);
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
}

.grid > * {
  border-radius: 5px;
  border: 2px solid rgb(96 139 168 / 0.4);
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
}

.grid :nth-child(1) {
  align-self: start;
}

.grid :nth-child(2) {
  justify-self: end;
}
```

```css live-sample___intro-grid-example
.grid {
  writing-mode: vertical-rl;
  inline-size: 400px;
}
```

{{EmbedLiveSample("intro-grid-example", "", "450px")}}

Khi làm việc với một trang web có writing mode khác với kiểu ngang từ trên xuống dưới, hoặc khi sử dụng writing mode vì mục đích sáng tạo, việc có thể tham chiếu theo luồng của nội dung sẽ rất có ý nghĩa.

## Chiều block và inline

Một khái niệm quan trọng khi làm việc với các thuộc tính và giá trị flow relative là hai chiều: block và inline. Các phương pháp layout CSS như flexbox và grid layout sử dụng khái niệm `block` và `inline` thay vì `right` và `left`/`top` và `bottom` khi căn chỉnh các item.

Chiều `inline` là chiều mà một dòng văn bản chạy theo trong writing mode đang được sử dụng. Do đó, trong một tài liệu tiếng Anh với văn bản chạy ngang từ trái sang phải, hoặc một tài liệu tiếng Ả Rập với văn bản chạy ngang từ phải sang trái, chiều inline là _ngang_. Chuyển sang vertical writing mode (ví dụ: tài liệu tiếng Nhật) thì chiều inline lúc này sẽ là _dọc_, vì các dòng trong writing mode đó chạy dọc.

Chiều block là chiều còn lại, và là hướng mà các khối — chẳng hạn như các đoạn văn — hiển thị lần lượt sau nhau. Trong tiếng Anh và tiếng Ả Rập, những khối này chạy dọc, trong khi ở bất kỳ vertical writing mode nào thì chúng chạy ngang.

Sơ đồ dưới đây cho thấy chiều inline và block trong horizontal writing mode:

![sơ đồ cho thấy trục inline chạy ngang, trục block chạy dọc.](mdn-horizontal.png)

Sơ đồ này cho thấy block và inline trong vertical writing mode:

![Sơ đồ cho thấy trục block chạy ngang, trục inline chạy dọc.](mdn-vertical.png)

## Xem thêm

- [Box alignment trong grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Box alignment trong flex layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Flow layout và writing modes](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes)
- [Understanding logical properties and values](https://www.smashingmagazine.com/2018/03/understanding-logical-properties-values/) trên Smashing Magazine (2018)
