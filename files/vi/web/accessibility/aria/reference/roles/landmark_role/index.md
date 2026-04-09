---
title: "ARIA: vai trò landmark"
short-title: landmark
slug: Web/Accessibility/ARIA/Reference/Roles/landmark_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#landmark
sidebar: accessibilitysidebar
---

Landmark là một phân đoạn quan trọng của trang. Vai trò `landmark` là một lớp cha trừu tượng cho các giá trị vai trò aria dành cho các phần nội dung đủ quan trọng để người dùng có thể muốn điều hướng trực tiếp tới chúng.

> [!NOTE]
> Vai trò `landmark` là một [vai trò trừu tượng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#6._abstract_roles). Nó được đưa vào đây để tài liệu đầy đủ. Tác giả web không nên dùng nó.

## Mô tả

`landmark` là một vai trò trừu tượng cho một phần nội dung đủ quan trọng để người dùng có thể muốn điều hướng dễ dàng tới phần đó và có nó được đưa vào một bản tóm tắt được tạo động của trang. Các landmark cho phép công nghệ hỗ trợ điều hướng và tìm nội dung nhanh chóng.

Để tạo một vai trò landmark, hãy xác định mục đích của nội dung bằng cách dùng phần tử ngữ nghĩa như `<section>`, `<nav>` hoặc `<main>`, hoặc thêm một vai trò ARIA là lớp con của vai trò `landmark` như [`role="banner"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role), [`role="complementary"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role), hoặc [`role="region"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role). Đừng dùng `role="landmark"`.

Mỗi vai trò landmark cụ thể đều có phần tử HTML ngữ nghĩa tương ứng:

| Vai trò ARIA                                                                             | Phần tử HTML               |
| ---------------------------------------------------------------------------------------- | -------------------------- |
| [`banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role)               | {{HTMLElement('header')}}  |
| [`complementary`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role) | {{HTMLElement('aside')}}   |
| [`contentinfo`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role)     | {{HTMLElement('footer')}}  |
| [`form`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role)                   | {{HTMLElement('form')}}    |
| [`main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role)                   | {{HTMLElement('main')}}    |
| [`navigation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role)       | {{HTMLElement('nav')}}     |
| [`region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role)               | {{HTMLElement('section')}} |
| [`search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)               | {{HTMLElement('search')}}  |

Nên cung cấp một nhãn hiển thị, được tham chiếu bằng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Nếu cần, một nhãn ngắn gọn, mô tả có thể được cung cấp bằng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

Đối với người dùng trình đọc màn hình, việc thêm các vai trò landmark về thực chất tạo ra 'liên kết bỏ qua' cho người dùng trình đọc màn hình, nhưng đừng thay thế điều hướng trong trang vì các landmark không được bộc lộ theo cách khác.

## Thực hành tốt nhất

Đừng dùng `role="landmark"`; thay vào đó, hãy dùng các vai trò landmark con phù hợp, hoặc HTML ngữ nghĩa nếu có thể. Mặc dù không còn cần thiết nữa, vẫn được xem là thực hành tốt khi lặp lại các vai trò landmark con cùng với phần tử ngữ nghĩa tương ứng cho các trình duyệt cũ. Điều này tốt hơn là dùng các vai trò landmark trên các phần tử không mang ngữ nghĩa, như {{HTMLElement('div')}}, nhưng hãy dùng ít nhất một trong hai: `role` hoặc phần tử ngữ nghĩa để tạo landmark. Nếu không, nội dung của bạn sẽ khó điều hướng hơn với người dùng trình đọc màn hình.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `section`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/section_role)
- [ARIA: vai trò `banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role)
- [ARIA: vai trò `complementary`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role)
- [ARIA: vai trò `contentinfo`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role)
- [ARIA: vai trò `form`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role)
- [ARIA: vai trò `main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role)
- [ARIA: vai trò `navigation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role)
- [ARIA: vai trò `region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role)
- [ARIA: vai trò `search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)
- [Using HTML landmark roles to improve accessibility](/en-US/blog/aria-accessibility-html-landmark-roles/) trên MDN blog (2023)
