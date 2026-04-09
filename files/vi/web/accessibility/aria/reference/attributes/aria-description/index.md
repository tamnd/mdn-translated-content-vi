---
title: "ARIA: thuộc tính aria-description"
short-title: aria-description
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-description
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-description
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-description` định nghĩa một giá trị chuỗi mô tả hoặc chú giải cho phần tử hiện tại.

> [!NOTE]
> `aria-description` vẫn đang ở bản thảo biên tập của W3C cho ARIA 1.3. Trong thời gian này, hãy tiếp tục dùng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby), vốn đã được hỗ trợ từ ARIA 1.1.

## Mô tả

Thuộc tính toàn cục `aria-description` cung cấp một cơ chế để nhà phát triển mô tả hoặc chú giải phần tử hiện tại, cung cấp thêm ngữ cảnh cho người dùng công nghệ hỗ trợ.

```html
<div
  role="application"
  aria-label="calendar"
  aria-description="Game schedule for the Boston Red Sox 2021 Season">
  <h1>Red Sox 2021</h1>
  <div role="grid">…</div>
</div>
```

Thuộc tính `aria-description` tương tự như [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) ở chỗ cả hai đều cung cấp một chuỗi văn bản gắn với phần tử, nhưng nhãn nên ngắn gọn, trong khi mô tả có thể dài hơn vì nó nhằm cung cấp thêm ngữ cảnh và thông tin.

Thuộc tính `aria-description` và `aria-describedby` có cùng mục đích; cả hai đều cung cấp cho người dùng văn bản mô tả bổ sung cho đối tượng mà chúng được đặt lên. Nếu văn bản mô tả đã có sẵn trong DOM, hãy dùng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) thay thế.

Thuộc tính `aria-description` chỉ nên được dùng khi việc cung cấp một mô tả hiển thị không phải là trải nghiệm người dùng mong muốn. Thuộc tính `aria-describedby` lấy giá trị là danh sách các `id` của các phần tử chứa văn bản mô tả về đối tượng. `aria-description` được dùng khi không có văn bản mô tả phù hợp nào có thể được liên kết với đối tượng bằng tham chiếu `id`. Nếu cả hai thuộc tính đều có mặt, `aria-describedby` sẽ được ưu tiên khi định nghĩa thuộc tính {{glossary("accessible description")}}.

Nội dung của phần mô tả, dù được đặt bằng `aria-description` hay `aria-describedby`, nên là văn bản phẳng. Nếu nội dung rất dài, có yêu cầu về ngữ nghĩa, hoặc có cấu trúc điều hướng, hãy dùng [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) thay thế.

## Giá trị

- `<string>`
  - : Giá trị là một chuỗi, một kiểu giá trị không bị ràng buộc, dự định được truyền đạt tới người dùng công nghệ hỗ trợ.

## Giao diện liên quan

- {{domxref("Element.ariaDescription")}}
  - : Thuộc tính [`ariaDescription`](/en-US/docs/Web/API/Element/ariaDescription), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-description`, vốn định nghĩa một giá trị chuỗi mô tả hoặc chú giải cho phần tử hiện tại.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- Thuộc tính HTML `title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title)
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
- [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details)
