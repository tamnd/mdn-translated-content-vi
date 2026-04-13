---
title: "HTMLIFrameElement: thuộc tính allow"
short-title: allow
slug: Web/API/HTMLIFrameElement/allow
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.allow
---

{{APIRef("HTML DOM")}}

Thuộc tính **`allow`** của giao diện {{domxref("HTMLIFrameElement")}} cho biết [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được chỉ định cho phần tử `<iframe>` này. Chính sách xác định những tính năng nào có sẵn cho phần tử `<iframe>` (ví dụ: quyền truy cập vào `microphone`, `camera`, `battery`, `web-share`, v.v.) dựa trên nguồn gốc của yêu cầu.

Chính sách quyền được chỉ định bởi thuộc tính `allow` thực thi một hạn chế bổ sung trên chính sách được chỉ định trong tiêu đề {{HTTPHeader("Permissions-Policy")}}. Nó không thay thế tiêu đề đó.

Xem [Cú pháp Chính sách quyền trong phần tử `<iframe>`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#iframes) để biết thêm chi tiết.

Nó phản ánh thuộc tính `allow` của phần tử {{HTMLElement("iframe")}}.

## Giá trị

Một chuỗi cho biết [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được chỉ định cho phần tử {{HTMLElement("iframe")}} này, mỗi chính sách phải được phân tách bằng dấu cách.

## Ví dụ

```html
<iframe
  id="el"
  src="https://example.com"
  allow="geolocation 'self' https://a.example.com https://b.example.com; fullscreen 'none'"></iframe>
```

```js
const el = document.getElementById("el");
console.log(el.allow); // Output: "geolocation 'self' https://a.example.com https://b.example.com; fullscreen 'none'"
```

Xem [Chính sách quyền trong phần tử `<iframe>`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#iframes) để biết thêm các ví dụ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
