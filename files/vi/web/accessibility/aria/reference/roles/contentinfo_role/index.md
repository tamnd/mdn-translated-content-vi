---
title: "ARIA: vai trò contentinfo"
short-title: contentinfo
slug: Web/Accessibility/ARIA/Reference/Roles/contentinfo_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#contentinfo
sidebar: accessibilitysidebar
---

Vai trò `contentinfo` là một landmark dùng để xác định thông tin về nội dung của trang hoặc site, thường tương đương với chân trang toàn cục.

## Mô tả

Landmark `contentinfo` dùng để xác định một vùng nội dung chứa thông tin về tài liệu hoặc site, chẳng hạn thông tin bản quyền, liên hệ hoặc liên kết chính sách. Trong HTML, phần tử {{HTMLElement("footer")}} thường đã truyền đạt ý nghĩa này.

Mỗi trang thường chỉ nên có một landmark `contentinfo`. Nếu có nhiều hơn một, mỗi landmark phải có tên truy cập riêng để người dùng công nghệ hỗ trợ có thể phân biệt.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có.

### Tương tác bàn phím

Không có.

### Các tính năng JavaScript bắt buộc

Không có.

## Ví dụ

```html
<footer role="contentinfo">
  <p>&copy; 2026 Ví dụ, Inc.</p>
  <nav>
    <a href="/privacy">Chính sách quyền riêng tư</a>
    <a href="/terms">Điều khoản dịch vụ</a>
  </nav>
</footer>
```

## Thực hành tốt nhất

Nếu có thể, hãy dùng phần tử {{HTMLElement("footer")}} thay vì vai trò `contentinfo`.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML `footer`
- [ARIA: vai trò `banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role)
- [ARIA: vai trò `main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role)
