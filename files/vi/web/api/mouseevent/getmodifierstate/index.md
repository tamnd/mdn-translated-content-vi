---
title: "MouseEvent: getModifierState() method"
short-title: getModifierState()
slug: Web/API/MouseEvent/getModifierState
page-type: web-api-instance-method
browser-compat: api.MouseEvent.getModifierState
---

{{APIRef("Pointer Events")}}

Phương thức **`MouseEvent.getModifierState()`** trả về trạng thái hiện tại của phím bổ trợ đã chỉ định: `true` nếu phím bổ trợ đang hoạt động (tức là phím bổ trợ được nhấn hoặc khóa), nếu không, `false`.

Xem {{domxref("KeyboardEvent.getModifierState","KeyboardEvent.getModifierState()")}} để biết chi tiết.

## Cú pháp

```js-nolint
getModifierState(key)
```

### Thông số

- `key`
  - : Giá trị khóa bổ trợ.
    Giá trị phải là một trong các giá trị {{domxref("KeyboardEvent.key")}} đại diện cho các khóa bổ trợ hoặc `"Accel"` {{deprecated_inline}}.
    Đây là trường hợp nhạy cảm.

### Giá trị trả về

Một giá trị boolean.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent")}} mà phương thức này thuộc về.
- {{domxref("KeyboardEvent.getModifierState")}}
