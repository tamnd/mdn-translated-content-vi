---
title: "ARIA: vai trò banner"
short-title: banner
slug: Web/Accessibility/ARIA/Reference/Roles/banner_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#banner
  - https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/banner.html
sidebar: accessibilitysidebar
---

Vai trò `banner` dùng để xác định phần đầu trang toàn cục của site, thường bao gồm logo, tên công ty, chức năng tìm kiếm và có thể cả điều hướng toàn cục hoặc khẩu hiệu. Nó thường nằm ở đầu trang.

Theo mặc định, phần tử {{htmlelement("header")}} của HTML có cùng ý nghĩa với landmark `banner`, trừ khi nó là phần tử con của {{htmlelement("aside")}}, {{htmlelement("article")}}, {{htmlelement("main")}}, {{htmlelement("nav")}} hoặc {{htmlelement("section")}}, khi đó {{htmlelement("header")}} sẽ bộc lộ vai trò [`generic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role), chứ không phải tương đương với banner toàn site.

## Mô tả

Landmark `banner` ghi đè vai trò ARIA ngầm định của phần tử vùng chứa mà nó được áp dụng. Nó nên được dành cho nội dung lặp lại trên toàn site, thường nằm ở đầu mỗi trang.

Banner thường bao gồm những thứ như logo hoặc nhận diện doanh nghiệp, hoặc có thể là công cụ tìm kiếm riêng của site, và thường là thứ mà đội ngũ marketing của bạn sẽ gọi là "header" hoặc "top banner" của site. Nếu không dùng kỹ thuật phần tử [`header`](/en-US/docs/Web/HTML/Reference/Elements/header) cho banner đó, hãy dùng khai báo `role="banner"` để xác định một landmark banner cho công nghệ hỗ trợ.

Công nghệ hỗ trợ có thể xác định phần tử `header` của một trang là `banner` nếu nó là phần tử con của phần tử [`body`](/en-US/docs/Web/HTML/Reference/Elements/body), và không được lồng bên trong phân đoạn `article`, `aside`, `main`, `nav` hoặc `section`.

Mỗi trang có thể có một landmark `banner`, nhưng nhìn chung mỗi trang chỉ nên có một phần tử mang vai trò banner. Trong trường hợp trang chứa các vai trò `document` và/hoặc `application` lồng nhau, mỗi vai trò `document` hoặc `application` lồng nhau cũng có thể có một landmark `banner`. Nếu một trang có hơn một landmark `banner`, mỗi cái phải có một tên truy cập duy nhất.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có.

### Tương tác bàn phím

Không có.

### Các tính năng JavaScript bắt buộc

Không có.

## Ví dụ

Đây là một banner giả có liên kết bỏ qua tới điều hướng, một logo, một tiêu đề và một phụ đề. Vì đây là phần đầu trang chính của site, chúng ta đã thêm vai trò landmark `banner` vào phần tử vùng chứa.

```html
<div role="banner">
  <a href="#main" id="skipToMain" class="skiptocontent">Bỏ qua tới nội dung chính</a>
  <img src="images/w3c.png" alt="Logo W3C" />
  <h1>WAI-ARIA Landmarks</h1>
  <p>Xác định các phân đoạn của trang để dễ điều hướng</p>
  <nav>…</nav>
</div>
```

Chúng ta cũng có thể viết ví dụ trên bằng phần tử HTML `header`:

```html
<header>
  <a href="#main" id="skipToMain" class="skiptocontent">Bỏ qua tới nội dung chính</a>
  <img src="images/w3c.png" alt="Logo W3C" />
  <h1>WAI-ARIA Landmarks</h1>
  <p>Xác định các phân đoạn của trang để dễ điều hướng</p>
  <nav>…</nav>
</header>
```

## Thực hành tốt nhất

Sử dụng phần tử {{HTMLElement('header')}} sẽ tự động truyền đạt rằng phần tử đó có vai trò `banner`. Nếu có thể, hãy ưu tiên dùng phần tử `<header>` ngữ nghĩa thay vì vai trò `banner`.

Mặc dù tốt nhất là dùng phần tử `header` và bảo đảm nó không là phần tử con của bất kỳ phân đoạn nào của trang, đôi khi bạn không có quyền truy cập vào HTML nền. Trong trường hợp đó, bạn có thể thêm vai trò `banner` vào phần tử của trang vốn nên được bộc lộ như một `banner` bằng JavaScript. Xác định banner của trang theo cách này sẽ giúp cải thiện trợ năng của site.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML `header`
- [Ví dụ WC3 Landmarks](https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/banner.html)
