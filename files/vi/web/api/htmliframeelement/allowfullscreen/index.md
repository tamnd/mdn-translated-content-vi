---
title: "HTMLIFrameElement: thuộc tính allowFullscreen"
short-title: allowFullscreen
slug: Web/API/HTMLIFrameElement/allowFullscreen
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.allowFullscreen
---

{{APIRef("HTML DOM")}}

Thuộc tính **`allowFullscreen`** của giao diện {{domxref("HTMLIFrameElement")}} là một giá trị boolean phản ánh thuộc tính `allowfullscreen` của phần tử {{HTMLElement("iframe")}}, cho biết có cho phép nội dung của iframe sử dụng {{domxref("Element.requestFullscreen", "requestFullscreen()")}} hay không.

> [!NOTE]
> Thuộc tính này được coi là một thuộc tính kế thừa. Hãy sử dụng `allow="fullscreen"` và {{domxref("HTMLIFrameElement.allow")}} thay thế.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<iframe id="el" allowfullscreen></iframe>
```

```js
const el = document.getElementById("el");
console.log(el.allowFullscreen); // Output: true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- {{domxref("Element.requestFullscreen()")}}
- [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- Chỉ thị chính sách quyền {{httpheader("Permissions-Policy/fullscreen", "fullscreen")}}
