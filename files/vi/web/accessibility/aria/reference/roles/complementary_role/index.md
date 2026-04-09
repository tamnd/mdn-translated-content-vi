---
title: "ARIA: vai trò complementary"
short-title: complementary
slug: Web/Accessibility/ARIA/Reference/Roles/complementary_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#complementary
sidebar: accessibilitysidebar
---

Vai trò `complementary` là một landmark có ý nghĩa ngầm định tương đương với phần tử HTML {{HTMLElement("aside")}}, và thường được hiểu như nội dung bổ trợ hoặc nội dung phụ trợ.

## Mô tả

Vai trò `complementary` chủ yếu được dùng để xác định một phần nội dung bổ trợ, không phải nội dung chính. Nó tương đương về mặt ý nghĩa với phần tử {{HTMLElement("aside")}}, và nên được dùng cho những nội dung có liên quan đến nội dung chính nhưng không phải là trọng tâm của trang.

Ví dụ điển hình là thanh bên, hộp thông tin bổ trợ, hoặc một tập hợp liên kết liên quan.

Nếu phần nội dung đó đủ quan trọng để được xem như một landmark độc lập, nhưng không phải nội dung chính, `complementary` là lựa chọn phù hợp.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có.

### Tương tác bàn phím

Không có.

### Các tính năng JavaScript bắt buộc

Không có.

## Ví dụ

```html
<aside role="complementary">
  <h2>Nội dung liên quan</h2>
  <ul>
    <li><a href="/article-1">Bài viết liên quan 1</a></li>
    <li><a href="/article-2">Bài viết liên quan 2</a></li>
  </ul>
</aside>
```

## Thực hành tốt nhất

Nếu có thể, hãy dùng phần tử {{HTMLElement("aside")}} thay vì vai trò `complementary`.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML `aside`
- [ARIA: vai trò `region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role)
- [ARIA: vai trò `search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)
