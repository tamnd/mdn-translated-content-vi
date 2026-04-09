---
title: "ARIA: vai trò navigation"
short-title: navigation
slug: Web/Accessibility/ARIA/Reference/Roles/navigation_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#navigation
  - https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/navigation.html
sidebar: accessibilitysidebar
---

Vai trò `navigation` được dùng để xác định các nhóm liên kết chính dùng để điều hướng trong một website hoặc nội dung trang.

```html
<div role="navigation" aria-label="Main">
  <!-- list of links to main website locations -->
</div>
```

Đây là điều hướng chính của một trang web.

## Mô tả

Vai trò `navigation` là một vai trò [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles). Landmark cung cấp cách xác định tổ chức và cấu trúc của một trang web. Bằng cách phân loại và gắn nhãn các phần của trang, thông tin cấu trúc được thể hiện bằng bố cục trực quan có thể được biểu diễn theo chương trình. Trình đọc màn hình dùng vai trò landmark để cung cấp điều hướng bằng bàn phím đến các phần quan trọng của trang. Giống như phần tử HTML {{HTMLElement('nav')}}, các landmark điều hướng cung cấp cách xác định các nhóm liên kết (ví dụ: danh sách liên kết) dùng để điều hướng nội dung trang hoặc trang web. Nếu một trang có nhiều hơn một landmark điều hướng, mỗi landmark nên có một nhãn duy nhất. Nếu hai hoặc nhiều landmark điều hướng trên một trang có cùng bộ liên kết, hãy dùng cùng một nhãn cho mỗi landmark.

Nên ưu tiên dùng phần tử HTML5 [`<nav>`](/en-US/docs/Web/HTML/Reference/Elements/nav) để định nghĩa một landmark điều hướng. Nếu không dùng kỹ thuật phần tử nav HTML5, hãy dùng thuộc tính `role="navigation"` để định nghĩa landmark điều hướng.

> [!NOTE]
> Việc dùng phần tử {{HTMLElement('nav')}} sẽ tự động truyền đạt rằng một phần có vai trò `navigation`. Nhà phát triển luôn nên ưu tiên dùng phần tử HTML ngữ nghĩa đúng thay vì dùng ARIA.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Mô tả ngắn gọn về mục đích của điều hướng, không cần từ "navigation", vì trình đọc màn hình sẽ đọc cả vai trò lẫn nội dung của nhãn.

### Tương tác bàn phím

Không có.

### Tính năng JavaScript bắt buộc

Không có.

## Ví dụ

```html
<div role="navigation" aria-label="Customer service">
  <ul>
    <li><a href="#">Help</a></li>
    <li><a href="#">Order tracking</a></li>
    <li><a href="#">Shipping &amp; Delivery</a></li>
    <li><a href="#">Returns</a></li>
    <li><a href="#">Contact us</a></li>
    <li><a href="#">Find a store</a></li>
  </ul>
</div>
```

## Lưu ý về khả năng truy cập

[Các vai trò landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) nên được dùng tiết kiệm để xác định các phần lớn hơn của tài liệu. Dùng quá nhiều vai trò landmark có thể tạo ra "nhiễu" trong trình đọc màn hình, khiến khó hiểu bố cục tổng thể của trang.

## Thực hành tốt nhất

### Ưu tiên HTML

Việc dùng phần tử {{HTMLElement('nav')}} sẽ tự động truyền đạt rằng phần tử có vai trò `navigation`. Nếu có thể, hãy ưu tiên dùng phần tử ngữ nghĩa `<nav>` thay vì vai trò `navigation`.

### Gắn nhãn cho landmark

#### Nhiều landmark

Nếu có nhiều hơn một vai trò landmark `navigation` hoặc phần tử {{HTMLElement('nav')}} trong một tài liệu, hãy cung cấp nhãn cho từng landmark. Nhãn này giúp người dùng công nghệ hỗ trợ nhanh chóng hiểu mục đích của từng landmark.

```html
<div id="main-nav" role="navigation" aria-label="Main">
  <!-- content -->
</div>

…

<nav id="footer-nav" aria-label="Footer">
  <!-- content -->
</nav>
```

#### Landmark lặp lại

Nếu vai trò landmark `navigation` hoặc phần tử {{HTMLElement('nav')}} trong một tài liệu được lặp lại, và cả hai landmark có nội dung giống hệt nhau, hãy dùng cùng một nhãn cho mỗi landmark. Ví dụ là thanh điều hướng chính được lặp lại ở đầu và cuối trang.

```html
<header>
  <nav id="main-nav" aria-label="Main">
    <!-- list of links to main website locations -->
  </nav>
</header>

…

<footer>
  <nav id="footer-nav" aria-label="Main">
    <!-- list of links to main website locations -->
  </nav>
</footer>
```

#### Mô tả thừa

Trình đọc màn hình sẽ thông báo loại vai trò của landmark. Vì vậy, bạn không cần mô tả landmark là gì trong nhãn của nó. Ví dụ, khai báo `role="navigation"` với `aria-label="Primary navigation"` có thể được đọc thừa là "primary navigation navigation".

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('nav')}}
- [Sử dụng các phần và dàn trang HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
- [Accessible Landmarks | scottohara.me](https://www.scottohara.me/blog/2018/03/03/landmarks.html)
- [Semantic navigation with the nav element | HTML5 Doctor](https://html5doctor.com/nav-element/)
