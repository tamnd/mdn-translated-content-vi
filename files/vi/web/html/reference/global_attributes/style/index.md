---
title: HTML style global attribute
short-title: style
slug: Web/HTML/Reference/Global_attributes/style
page-type: html-attribute
browser-compat: html.global_attributes.style
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`style`** chứa các khai báo tạo kiểu [CSS](/en-US/docs/Web/CSS) để áp dụng cho phần tử. Lưu ý rằng nên định nghĩa kiểu dáng trong một tệp riêng biệt. Thuộc tính này và phần tử {{HTMLElement("style")}} chủ yếu được dùng để tạo kiểu nhanh chóng, ví dụ như cho mục đích thử nghiệm.

{{InteractiveExample("HTML Demo: style", "tabbed-shorter")}}

```html interactive-example
<div style="background: #ffe7e8; border: 2px solid #e66465">
  <p style="margin: 15px; line-height: 1.5; text-align: center">
    Well, I am the slime from your video<br />
    Oozin' along on your livin' room floor.
  </p>
</div>
```

> [!NOTE]
> Thuộc tính này không được dùng để truyền tải thông tin ngữ nghĩa. Ngay cả khi tất cả kiểu dáng bị xóa, trang vẫn phải đúng về mặt ngữ nghĩa. Thông thường không nên dùng thuộc tính này để ẩn thông tin không liên quan; việc này nên được thực hiện bằng thuộc tính [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
- {{domxref("HTMLElement.style")}}
