---
title: List group with badges
slug: Web/CSS/How_to/Layout_cookbook/List_group_with_badges
page-type: how-to
sidebar: cssref
---

Trong công thức này, chúng ta sẽ tạo mẫu nhóm danh sách với các huy hiệu (badge) hiển thị số đếm.

![Danh sách các mục với huy hiệu chỉ số đếm được hiển thị bên phải văn bản.](list-group-badges.png)

## Yêu cầu

Các mục danh sách phải được hiển thị cùng với các huy hiệu. Huy hiệu phải được căn chỉnh về phía phải và căn giữa theo chiều dọc. Huy hiệu phải được căn giữa theo chiều dọc dù nội dung chỉ có một dòng hay nhiều dòng văn bản.

## Công thức

Nhấn "Play" trong các khối mã dưới đây để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___list-group-badges-example
<ul class="list-group">
  <li>
    Item One
    <span class="badge">2</span>
  </li>
  <li>
    Item Two
    <span class="badge">10</span>
  </li>
  <li>
    Item Three
    <span class="badge">9</span>
  </li>
  <li>
    Item Four
    <span class="badge">0</span>
  </li>
</ul>
```

```css live-sample___list-group-badges-example
body {
  font: 1.2em / 1.5 sans-serif;
  padding: 0;
  margin: 1em;
}
.list-group {
  list-style: none;
  margin: 0;
  padding: 0;
  border: 1px solid #cccccc;
  border-radius: 0.5em;
  width: 20em;
}

.list-group li {
  border-top: 1px solid #cccccc;
  padding: 0.5em;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.list-group li:first-child {
  border-top: 0;
}

.list-group .badge {
  background-color: rebeccapurple;
  color: white;
  font-weight: bold;
  font-size: 80%;
  border-radius: 10em;
  min-width: 1.5em;
  padding: 0.25em;
  text-align: center;
}
```

{{EmbedLiveSample("list-group-badges-example", "", "250px")}}

## Các lựa chọn được thực hiện

Flexbox giúp mẫu này trở nên đơn giản và cũng tạo điều kiện dễ dàng thực hiện các thay đổi bố cục.

Để đảm bảo văn bản và huy hiệu căn chỉnh đúng, tôi sử dụng thuộc tính {{cssxref("justify-content")}} với giá trị `space-between`. Điều này đặt phần không gian thừa giữa các phần tử. Trong ví dụ trực tiếp, nếu bạn xóa thuộc tính này, bạn sẽ thấy huy hiệu di chuyển đến cuối văn bản ở các mục có văn bản ngắn hơn một dòng.

Để căn chỉnh nội dung theo chiều ngang, tôi sử dụng thuộc tính {{cssxref("align-items")}} để căn chỉnh văn bản và huy hiệu trên trục chéo. Nếu bạn muốn huy hiệu căn chỉnh lên đầu nội dung thay vào đó, hãy thay đổi thành `align-items: flex-start`.

## Xem thêm

- [Căn chỉnh hộp trong flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Căn chỉnh các phần tử trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
