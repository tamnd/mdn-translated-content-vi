---
title: Pagination
slug: Web/CSS/How_to/Layout_cookbook/Pagination
page-type: how-to
sidebar: cssref
---

Mẫu cookbook này trình bày mẫu điều hướng được sử dụng để hiển thị phân trang, nơi người dùng có thể di chuyển giữa các trang nội dung như kết quả tìm kiếm.

![Liên kết đến các tập hợp trang trong danh sách phân trang](pagination.png)

## Yêu cầu

Mẫu phân trang thường hiển thị các mục trong một hàng. Để đảm bảo rằng phân trang có thể hiểu được bởi người sử dụng trình đọc màn hình, chúng ta đánh dấu các mục dưới dạng danh sách bên trong phần tử {{htmlelement("nav")}}, rồi sử dụng CSS để hiển thị bố cục trực quan dưới dạng hàng.

Thông thường, thành phần phân trang sẽ được căn giữa theo chiều ngang bên dưới nội dung.

## Công thức

Nhấn "Play" trong các khối mã dưới đây để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___pagination-example
<nav aria-label="pagination">
  <ul class="pagination">
    <li>
      <a href="">
        <span aria-hidden="true">&laquo;</span>
        <span class="visuallyhidden">previous set of pages</span>
      </a>
    </li>
    <li>
      <a href=""><span class="visuallyhidden">page </span>1</a>
    </li>
    <li>
      <a href="" aria-current="page">
        <span class="visuallyhidden">page </span>2
      </a>
    </li>
    <li>
      <a href=""> <span class="visuallyhidden">page </span>3 </a>
    </li>
    <li>
      <a href=""> <span class="visuallyhidden">page </span>4 </a>
    </li>
    <li>
      <a href="">
        <span class="visuallyhidden">next set of pages</span
        ><span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
```

```css live-sample___pagination-example
.visuallyhidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: auto;
  margin: 0;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
  white-space: nowrap;
}

nav {
  border-top: 1px solid #eeeeee;
  margin-top: 1em;
  padding-top: 0.5em;
  font: 1.2em sans-serif;

  display: flex;
  justify-content: center;
}

.pagination {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.pagination li {
  margin: 0 1px;
}

.pagination a {
  display: block;
  padding: 0.5em 1em;
  border: 1px solid #999999;
  border-radius: 0.2em;
  text-decoration: none;
}

.pagination a[aria-current="page"] {
  background-color: #333333;
  color: white;
}
```

{{EmbedLiveSample("pagination-example")}}

## Các lựa chọn được thực hiện

Mẫu này được bố cục bằng [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) - một flex container được lồng bên trong một cái khác. Phần tử {{htmlelement("nav")}} được chỉ định là flex container để chúng ta có thể căn giữa danh sách bên trong bằng thuộc tính {{cssxref("justify-content")}}.

Bản thân danh sách cũng trở thành flex container để bố trí các mục thành một hàng. Để tạo khoảng cách giữa các mục, chúng ta có thể sử dụng {{cssxref("margin")}} trên các flex item hoặc thêm {{cssxref("gap")}} trên flex container.

```css
.pagination {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  gap: 2px;
}
```

## Vấn đề khả năng tiếp cận

Chúng ta muốn đảm bảo rằng người sử dụng trình đọc màn hình hiểu điều hướng này làm gì và họ sẽ đi đâu khi nhấp vào liên kết. Để hỗ trợ điều này, chúng ta đã thêm [`aria-label="pagination"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) trên phần tử `<nav>`.

Chúng ta cũng đã thêm một số nội dung bổ sung sẽ được đọc bởi trình đọc màn hình nhưng bị ẩn về mặt trực quan, và đặt thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden) trên các mũi tên phân trang.

Phần "Xem thêm" ở cuối tài liệu này có liên kết đến các chủ đề khả năng tiếp cận liên quan.

## Xem thêm

- {{Cssxref("justify-content")}}, {{Cssxref("gap")}}
- [Know your ARIA: 'hidden' vs 'none'](https://www.scottohara.me/blog/2018/05/05/hidden-vs-none.html) (2018)
- [Invisible content just for screen reader users](https://webaim.org/techniques/css/invisiblecontent/#techniques) qua WebAIM.org (2020)
- [Writing CSS with accessibility in mind](https://medium.com/@matuzo/writing-css-with-accessibility-in-mind-8514a0007939) (2017)
- [a11y style guide: pagination](https://a11y-style-guide.com/style-guide/section-navigation.html#kssref-navigation-pagination)
