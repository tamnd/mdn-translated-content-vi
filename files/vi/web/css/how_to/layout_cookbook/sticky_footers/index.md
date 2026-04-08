---
title: Sticky footers
slug: Web/CSS/How_to/Layout_cookbook/Sticky_footers
page-type: how-to
sidebar: cssref
---

Mẫu sticky footer (footer dính) là mẫu trong đó footer của trang "dính" vào đáy của viewport trong trường hợp nội dung ngắn hơn chiều cao viewport. Chúng ta sẽ xem xét một vài kỹ thuật để tạo ra mẫu này trong công thức này.

## Yêu cầu

Mẫu sticky footer cần đáp ứng các yêu cầu sau:

- Footer dính vào đáy viewport khi nội dung ngắn.
- Nếu nội dung của trang mở rộng vượt qua đáy viewport, footer bị đẩy xuống, luôn nằm bên dưới nội dung như bình thường.

## Công thức

Nhấn "Play" trong các khối mã dưới đây để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___sticky-footer-example
<div class="wrapper">
  <header class="page-header">This is the header</header>
  <main class="page-body">
    <p contenteditable>
      The footer sticks to the bottom even though this paragraph is short. Add
      content to this editable area to see the footer push down when needed to
      fit the content.
    </p>
  </main>
  <footer class="page-footer">Sticky footer</footer>
</div>
```

```css live-sample___sticky-footer-example
* {
  box-sizing: inherit;
}

html {
  height: 100%;
  box-sizing: border-box;
}

body {
  height: 100%;
  font: 1.2em sans-serif;
}

.wrapper {
  min-height: 100%;
  display: grid;
  grid-template-rows: auto 1fr auto;
}

.page-header,
.page-footer {
  background-color: rgb(75 70 74);
  color: white;
  padding: 20px;
}

.page-body {
  padding: 20px;
}

.page-body p {
  border: 1px solid grey;
}
```

{{EmbedLiveSample("sticky-footer-example", "", "400px")}}

> [!NOTE]
> Trong ví dụ này và ví dụ tiếp theo, chúng ta đang sử dụng wrapper được đặt thành `min-height: 100%`. Bạn cũng có thể đạt được điều này cho một trang đầy đủ bằng cách đặt {{cssxref("min-height")}} là `100vh` trên {{htmlelement("body")}} rồi sử dụng nó làm grid container.

## Các lựa chọn được thực hiện

Trong ví dụ trên, chúng ta đạt được sticky footer bằng cách sử dụng [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout). `.wrapper` có chiều cao tối thiểu là `100%` có nghĩa là nó cao bằng container chứa nó. Sau đó chúng ta tạo bố cục lưới một cột với ba hàng, một hàng cho mỗi phần của bố cục.

[Grid auto-placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement) sẽ đặt các mục theo thứ tự nguồn vì vậy header đi vào track có kích thước tự động đầu tiên, nội dung chính vào track `1fr` và footer vào track có kích thước tự động cuối cùng. Track `1fr` sẽ chiếm tất cả không gian có sẵn và do đó tăng trưởng để lấp đầy khoảng trống.

## Phương pháp thay thế

Bạn cũng có thể sử dụng [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) để tạo sticky footer.

```html live-sample___sticky-footer-flexbox-example
<div class="wrapper">
  <header class="page-header">This is the header</header>
  <main class="page-body">
    <p contenteditable>
      The footer sticks to the bottom even though this paragraph is short. Add
      content to this editable area to see the footer push down when needed to
      fit the content.
    </p>
  </main>
  <footer class="page-footer">Sticky footer</footer>
</div>
```

```css live-sample___sticky-footer-flexbox-example
* {
  box-sizing: border-box;
}

html,
body {
  box-sizing: border-box;
  height: 100%;
  padding: 0;
  margin: 0;
  font: 1.2em sans-serif;
}

.wrapper {
  box-sizing: border-box;
  min-height: 100%;

  display: flex;
  flex-direction: column;
}

.page-header,
.page-footer {
  background-color: rgb(75 70 74);
  color: white;
  padding: 20px;

  flex-grow: 0;
  flex-shrink: 0;
}

.page-body {
  padding: 20px;

  flex-grow: 1;
}

.page-body p {
  border: 1px solid grey;
}
```

{{EmbedLiveSample("sticky-footer-flexbox-example", "", "400px")}}

Ví dụ flexbox bắt đầu theo cách tương tự, nhưng chúng ta sử dụng `display:flex` thay vì `display:grid` trên `.wrapper`; chúng ta cũng đặt {{cssxref("flex-direction")}} thành `column`. Sau đó chúng ta đặt nội dung chính thành [`flex-grow: 1`](/en-US/docs/Web/CSS/Reference/Properties/flex-grow) và hai phần tử còn lại thành [`flex-shrink: 0`](/en-US/docs/Web/CSS/Reference/Properties/flex-shrink) - điều này ngăn chúng thu nhỏ hơn khi nội dung lấp đầy khu vực chính.

## Tài nguyên trên MDN

- Thuộc tính CSS: {{cssxref("display")}}, {{cssxref("min-height")}}, {{cssxref("grid-template-rows")}}, {{cssxref("flex-direction")}}, {{cssxref("flex-grow")}}, {{cssxref("flex-shrink")}}
- [Khái niệm cơ bản về grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
