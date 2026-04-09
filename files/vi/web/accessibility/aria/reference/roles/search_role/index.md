---
title: "ARIA: vai trò search"
short-title: search
slug: Web/Accessibility/ARIA/Reference/Roles/search_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#search
  - https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/search.html
sidebar: accessibilitysidebar
---

Vai trò `search` được dùng để xác định chức năng tìm kiếm; phần của trang dùng để tìm trong trang, website, hoặc tập hợp các website.

```html
<form role="search">
  <!-- search input -->
</form>
```

## Mô tả

Vai trò `search` là một vai trò [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) có thể được thêm vào phần tử vùng chứa bao gồm tất cả các phần tử kết hợp lại tạo thành tính năng tìm kiếm của tài liệu hoặc ứng dụng, bao gồm một [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search) con. Nếu một tài liệu có nhiều hơn một khu vực tìm kiếm, mỗi khu vực nên có một nhãn duy nhất, trừ khi chúng là cùng một tìm kiếm được lặp lại, khi đó hãy dùng cùng một tên. Có [`input` kiểu `search`](/en-US/docs/Web/HTML/Reference/Elements/input/search), nhưng bản thân nó không xác định một search landmark. Dùng {{HTMLElement('search')}} là một cách thay thế để xác định search landmark.

## Ví dụ

Khi một {{HTMLElement('form')}} là một biểu mẫu tìm kiếm, hãy dùng vai trò `search` thay vì vai trò [`form`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role).

```html
<form id="search" role="search">
  <label for="search-input">Search this site</label>
  <input type="search" id="search-input" name="search" spellcheck="false" />
  <input value="Submit" type="submit" />
</form>
```

## Lưu ý về khả năng tiếp cận

Các vai trò [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) chỉ nên được dùng một cách tiết kiệm, để xác định các phần tổng thể lớn hơn của tài liệu. Dùng quá nhiều vai trò landmark có thể tạo ra "nhiễu" trong trình đọc màn hình, khiến khó hiểu bố cục tổng thể của trang.

## Thực hành tốt nhất

### Ưu tiên HTML

Dùng phần tử {{HTMLElement('search')}} sẽ tự động truyền đạt rằng phần tử có vai trò `search`. Nếu có thể, hãy ưu tiên dùng phần tử `<search>` ngữ nghĩa thay vì vai trò `search`.

Nếu `input` kiểu `search` của bạn đã nằm bên trong một {{HTMLElement("form")}}, thì việc bọc form trong một phần tử `<search>` khác có thể là markup không cần thiết. Trong trường hợp này, dùng `role="search"` trên chính `<form>` là chấp nhận được.

### Gắn nhãn landmark

#### Nhiều landmark

Nếu có nhiều hơn một vai trò landmark `search` trong một tài liệu, hãy cung cấp nhãn cho từng landmark. Nhãn này sẽ giúp người dùng công nghệ hỗ trợ nhanh chóng hiểu mục đích của từng landmark.

```html
<form id="site-search" role="search" aria-label="Sitewide">
  <!-- search input -->
</form>

…

<form id="page-search" role="search" aria-label="On this page">
  <!-- search input -->
</form>
```

#### Landmark lặp lại

Nếu một vai trò landmark `search` trong một tài liệu được lặp lại, và cả hai landmark có nội dung giống hệt nhau, hãy dùng cùng một nhãn cho mỗi landmark. Một ví dụ là lặp lại chức năng tìm kiếm toàn site ở đầu và cuối trang.

```html
<header>
  <form id="site-search-top" role="search" aria-label="Sitewide">
    <!-- search input -->
  </form>
</header>

…

<footer>
  <form id="site-search-bottom" role="search" aria-label="Sitewide">
    <!-- search input -->
  </form>
</footer>
```

#### Mô tả thừa

Trình đọc màn hình sẽ thông báo loại vai trò của landmark. Vì vậy, bạn không cần mô tả landmark là gì trong nhãn của nó. Ví dụ, khai báo `role="search"` với [`aria-label="Sitewide search"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) có thể được thông báo thừa là "sitewide search search".

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('form')}}
- Phần tử {{HTMLElement('input')}}
- Phần tử {{HTMLElement('search')}}
- [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search)
- [Using HTML sections and outlines](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
