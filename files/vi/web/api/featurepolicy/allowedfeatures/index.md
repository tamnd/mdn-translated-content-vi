---
title: "FeaturePolicy: allowedFeatures() method"
short-title: allowedFeatures()
slug: Web/API/FeaturePolicy/allowedFeatures
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FeaturePolicy.allowedFeatures
---

{{APIRef("Feature Policy API")}}{{SeeCompatTable}}

Phương thức **`allowedFeatures()`** của giao diện {{DOMxRef("FeaturePolicy")}} trả về danh sách tên chỉ thị của tất cả các tính năng được [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) cho phép. Điều này cho phép kiểm tra các chỉ thị riêng lẻ của Chính sách Quyền mà nó chạy trên. Do đó, phương thức `allowedFeatures()` trả về một tập con các chỉ thị được trả về bởi {{DOMxRef("FeaturePolicy.features", "features()")}}.

## Cú pháp

```js-nolint
allowedFeatures()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi đại diện cho tên chỉ thị Chính sách Quyền được Chính sách Quyền mà phương thức này được gọi cho phép.

## Ví dụ

Ví dụ sau ghi lại tất cả các chỉ thị được phép cho tài liệu hiện tại. Lưu ý rằng các tính năng này có thể bị hạn chế bởi API Quyền nếu người dùng chưa cấp quyền tương ứng.

```js
// First, get the Permissions Policy object
const featurePolicy = document.featurePolicy;

// Then query feature for specific
const allowed = featurePolicy.allowedFeatures();

for (const directive of allowed) {
  console.log(directive);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
