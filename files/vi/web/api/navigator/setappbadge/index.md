---
title: "Navigator: phương thức setAppBadge()"
short-title: setAppBadge()
slug: Web/API/Navigator/setAppBadge
page-type: web-api-instance-method
browser-compat: api.Navigator.setAppBadge
---

{{APIRef("Badging API")}}{{securecontext_header}}

Phương thức **`setAppBadge()`** của giao diện {{domxref("Navigator")}} đặt huy hiệu trên biểu tượng được liên kết với ứng dụng này. Nếu một giá trị được truyền vào phương thức thì giá trị này sẽ được đặt làm giá trị của huy hiệu. Nếu không, huy hiệu sẽ hiển thị dưới dạng dấu chấm hoặc chỉ báo khác do nền tảng xác định.

## Cú pháp

```js-nolint
setAppBadge()
setAppBadge(contents)
```

### Thông số

- `contents` {{optional_inline}}
  - : {{jsxref("number")}} sẽ được sử dụng làm giá trị của huy hiệu. Nếu `contents` là `0` thì huy hiệu sẽ được đặt thành `nothing`, cho biết huy hiệu đã được xóa.

### Giá trị trả về

{{jsxref("Promise")}} phân giải bằng {{jsxref("undefined")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Bỏ đi nếu tài liệu không được kích hoạt đầy đủ.
- `SecurityError` {{domxref("DOMException")}}
  - : Bị hủy nếu cuộc gọi bị [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy) chặn.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Bị ném nếu {{domxref('PermissionStatus.state')}} không phải `granted`.

## Ví dụ

Trong ví dụ bên dưới, số lượng chưa đọc được chuyển tới `setAppBadge()`. Khi đó huy hiệu sẽ hiển thị `30`.

```js
const unread = 30;
navigator.setAppBadge(unread);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Badging for app icons](https://developer.chrome.com/docs/capabilities/web-apis/badging-api/)
