---
title: 'Error: Permission denied to access property "x"'
slug: Web/JavaScript/Reference/Errors/Property_access_denied
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "Permission denied to access property" xảy ra khi có cố gắng truy cập một đối tượng mà bạn không có quyền.

## Thông báo

```plain
DOMException: Blocked a frame with origin "x" from accessing a cross-origin frame. (Chromium-based)
DOMException: Permission denied to access property "x" on cross-origin object (Firefox)
SecurityError: Blocked a frame with origin "x" from accessing a cross-origin frame. Protocols, domains, and ports must match. (Safari)
```

## Loại lỗi

{{domxref("DOMException")}}.

## Điều gì đã xảy ra?

Có cố gắng truy cập một đối tượng mà bạn không có quyền. Đây thường là một phần tử {{HTMLElement("iframe")}} được tải từ một domain khác và bạn đã vi phạm [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

## Ví dụ

### Không có quyền truy cập document

```html
<iframe id="myframe" src="http://www1.w3c-test.org/common/blank.html"></iframe>
```

```js
console.log(frames[0].document);
// Error: Permission denied to access property "document"
```

## Xem thêm

- {{HTMLElement("iframe")}}
- [Same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
