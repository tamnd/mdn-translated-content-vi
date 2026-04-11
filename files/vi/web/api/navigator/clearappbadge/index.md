---
title: "Navigator: phương thức clearAppBadge()"
short-title: clearAppBadge()
slug: Web/API/Navigator/clearAppBadge
page-type: web-api-instance-method
browser-compat: api.Navigator.clearAppBadge
---

{{APIRef("Badging API")}}{{securecontext_header}}

Phương thức **`clearAppBadge()`** của giao diện {{domxref("Navigator")}} sẽ xóa huy hiệu trên biểu tượng của ứng dụng hiện tại bằng cách đặt huy hiệu đó thành `nothing`. Giá trị `nothing` cho biết hiện tại không có huy hiệu nào được đặt và trạng thái của huy hiệu là _clear_.

## Cú pháp

```js-nolint
clearAppBadge()
```

### Thông số

Không có.

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

Khi tất cả tin nhắn trong ứng dụng đã được đọc, hãy gọi `clearAppBadge()` để xóa huy hiệu và xóa thông báo.

```js
navigator.clearAppBadge();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Badging for app icons](https://developer.chrome.com/docs/capabilities/web-apis/badging-api/)
