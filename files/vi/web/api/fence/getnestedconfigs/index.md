---
title: "Fence: getNestedConfigs() method"
short-title: getNestedConfigs()
slug: Web/API/Fence/getNestedConfigs
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Fence.getNestedConfigs
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Phương thức **`getNestedConfigs()`** của giao diện
{{domxref("Fence")}} trả về các {{domxref("FencedFrameConfig")}} được tải vào các `<fencedframe>` nhúng bên trong `<fencedframe>` hiện tại.

## Cú pháp

```js-nolint
getNestedConfigs()
```

### Tham số

Không có.

### Giá trị trả về

`getNestedConfigs()` có hai giá trị trả về có thể:

- Một mảng gồm 20 đối tượng {{domxref("FencedFrameConfig")}}, nếu cấu hình của `<fencedframe>` hiện tại được tạo bằng API hỗ trợ cấu hình lồng nhau (ví dụ: [Protected Audience](https://privacysandbox.google.com/private-advertising/protected-audience)). Trong số 20 cấu hình này, N cấu hình đầu tiên là các cấu hình được đăng ký thông qua API và phần còn lại là các cấu hình đệm sẽ điều hướng đến `about:blank`, để số lượng cấu hình bị ẩn và không thể rò rỉ bất kỳ thông tin nào.
- `null` nếu cấu hình của `<fencedframe>` hiện tại được tạo bằng API không hỗ trợ cấu hình lồng nhau (ví dụ: [Shared Storage](/en-US/docs/Web/API/Shared_Storage_API)).

## Ví dụ

```js
// Run inside a <fencedframe>

// Retrieve the configs of embedded fenced frames
const configs = window.fence.getNestedConfigs();

// Set a new fenced frame's config to equal one of the retrieved configs
const frame = document.createElement("fencedframe");
frame.config = configs[0];
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
