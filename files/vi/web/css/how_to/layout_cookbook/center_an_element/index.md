---
title: Center an element
slug: Web/CSS/How_to/Layout_cookbook/Center_an_element
page-type: how-to
sidebar: cssref
---

Trong công thức này, bạn sẽ thấy cách căn giữa một hộp bên trong một hộp khác bằng cách sử dụng [flexbox](#using_flexbox) và [grid](#using_grid), căn giữa nội dung theo cả chiều ngang lẫn chiều dọc.

![một phần tử được căn giữa bên trong một hộp lớn hơn](cookbook-center.png)

## Yêu cầu

Đặt một mục vào trung tâm của một hộp khác theo cả chiều ngang lẫn chiều dọc.

## Công thức

Nhấp vào "Play" trong các khối code bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___center-example
<div class="container">
  <div class="item">I am centered!</div>
</div>
```

```css live-sample___center-example
.item {
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;
  padding: 20px;
  width: 10em;
}

.container {
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  font: 1.2em sans-serif;

  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

{{EmbedLiveSample("center-example", "", "250px")}}

## Sử dụng flexbox

Để căn giữa một hộp bên trong một hộp khác, trước tiên hãy chuyển hộp chứa thành [flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts#the_flex_container) bằng cách đặt thuộc tính {{cssxref("display")}} thành `flex`. Sau đó đặt {{cssxref("align-items")}} thành `center` để căn giữa theo chiều dọc (trên trục block) và {{cssxref("justify-content")}} thành `center` để căn giữa theo chiều ngang (trên trục inline). Và đó là tất cả những gì cần thiết để căn giữa một hộp bên trong hộp khác!

### HTML

```html
<div class="container">
  <div class="item">I am centered!</div>
</div>
```

### CSS

```css
div {
  border: solid 3px;
  padding: 1em;
  max-width: 75%;
}

.item {
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;
  padding: 20px;
  width: 10em;
}

.container {
  height: 8em;
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  font: 1.2em sans-serif;

  display: flex;
  align-items: center;
  justify-content: center;
}
```

Chúng ta đặt chiều cao cho container để minh họa rằng mục bên trong thực sự được căn giữa theo chiều dọc trong container.

### Kết quả

{{EmbedLiveSample("Using_flexbox", "", "200px")}}

Thay vì áp dụng `align-items: center;` trên container, bạn cũng có thể căn giữa theo chiều dọc cho mục bên trong bằng cách đặt {{cssxref("align-self")}} thành `center` trên chính mục bên trong đó.

## Sử dụng grid

Một phương pháp khác bạn có thể dùng để căn giữa một hộp bên trong hộp khác là trước tiên biến hộp chứa thành [grid container](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#grid_container) và sau đó đặt thuộc tính {{cssxref("place-items")}} thành `center` để căn giữa các mục theo cả trục block lẫn inline.

### HTML

```html
<div class="container">
  <div class="item">I am centered!</div>
</div>
```

### CSS

```css
div {
  border: solid 3px;
  padding: 1em;
  max-width: 75%;
}

.item {
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;
  padding: 20px;
  width: 10em;
}

.container {
  height: 8em;
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;
  font: 1.2em sans-serif;

  display: grid;
  place-items: center;
}
```

### Kết quả

{{EmbedLiveSample("Using_grid", "", "200px")}}

Thay vì áp dụng `place-items: center;` trên container, bạn có thể đạt được cùng kết quả căn giữa bằng cách đặt {{cssxref("place-content", "place-content: center;")}} trên container hoặc bằng cách áp dụng {{cssxref("place-self", "place-self: center")}} hoặc {{cssxref("margin", "margin: auto;")}} trên chính mục bên trong đó.

## Tài nguyên trên MDN

- [Box alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [CSS box alignment guide](/en-US/docs/Web/CSS/Guides/Box_alignment)
