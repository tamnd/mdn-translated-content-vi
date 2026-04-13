---
title: "HTMLLinkElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLLinkElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.disabled
---

{{APIRef("HTML DOM")}}

Thuộc tính **`disabled`** của giao diện {{domxref("HTMLLinkElement")}} là một giá trị kiểu logic cho biết liên kết có bị vô hiệu hóa hay không. Nó chỉ có hiệu lực với liên kết bảng kiểu (thuộc tính `rel` được đặt thành `stylesheet`).

Nếu thuộc tính `disabled` được chỉ định trong HTML khi tải, bảng kiểu sẽ không được tải trong khi tải trang. Thay vào đó, bảng kiểu sẽ chỉ được tải khi thuộc tính `disabled` được đặt thành `false` hoặc bị xóa. Việc đặt thuộc tính `disabled` bằng JavaScript sẽ khiến bảng kiểu bị xóa khỏi danh sách {{domxref("Document.styleSheets")}} của tài liệu.

Nó phản ánh thuộc tính `disabled` của phần tử {{HTMLElement("link")}}.

## Giá trị

Một giá trị kiểu logic.

## Ví dụ

```html
<link
  id="el"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  disabled
  crossorigin="anonymous" />
```

```js
const el = document.getElementById("el");
console.log(el.disabled); // Output: true

// Đặt thuộc tính disabled thành false để kích hoạt bảng kiểu
el.disabled = false;
console.log(el.disabled); // Output: false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.integrity")}}
- [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity)
