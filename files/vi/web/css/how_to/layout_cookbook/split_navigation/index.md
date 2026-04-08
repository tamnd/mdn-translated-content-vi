---
title: Split navigation
slug: Web/CSS/How_to/Layout_cookbook/Split_navigation
page-type: how-to
sidebar: cssref
---

**Split navigation** (điều hướng tách đôi) là một mẫu điều hướng trong đó một hoặc nhiều phần tử được tách biệt khỏi phần còn lại của các mục điều hướng.

![Các mục được tách thành hai nhóm.](split-navigation.png)

## Yêu cầu

Một mẫu điều hướng phổ biến là có một phần tử bị đẩy ra khỏi các phần tử khác. Chúng ta có thể sử dụng flexbox để đạt được điều này mà không cần phải tạo hai tập hợp mục thành hai flex container riêng biệt.

## Công thức

Nhấn "Play" trong các khối mã dưới đây để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___split-navigation-example
<nav>
  <ul class="main-nav">
    <li><a href="">About</a></li>
    <li><a href="">Products</a></li>
    <li><a href="">Our Team</a></li>
    <li class="push"><a href="">Contact</a></li>
  </ul>
</nav>
```

```css live-sample___split-navigation-example
.main-nav {
  margin: 0;
  padding: 0;
  list-style: none;
  font: 1.2em sans-serif;

  display: flex;
}

.main-nav a {
  padding: 0.5em 1em;
  display: block;
}

.push {
  margin-left: auto;
}
```

{{EmbedLiveSample("split-navigation-example")}}

## Các lựa chọn được thực hiện

Mẫu này kết hợp auto margin với flexbox để tách các mục.

Auto margin hấp thụ tất cả không gian có sẵn theo hướng nó được áp dụng. Đây là cách căn giữa một khối với auto margin hoạt động - bạn có một margin ở mỗi phía của khối cố gắng chiếm tất cả không gian, do đó đẩy khối vào giữa.

Trong trường hợp này, auto margin bên trái chiếm bất kỳ không gian có sẵn nào và đẩy mục sang phải. Bạn có thể áp dụng class `push` cho bất kỳ mục nào trong danh sách.

## Xem thêm

- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Thuộc tính {{cssxref("display")}}
- Thuộc tính {{cssxref("margin")}}
