---
title: "FeaturePolicy: allowsFeature() method"
short-title: allowsFeature()
slug: Web/API/FeaturePolicy/allowsFeature
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FeaturePolicy.allowsFeature
---

{{APIRef("Feature Policy API")}}{{SeeCompatTable}}

Phương thức **`allowsFeature()`** của giao diện {{DOMxRef("FeaturePolicy")}} cho phép kiểm tra các chỉ thị riêng lẻ của [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) mà nó chạy trên. Nó trả về một {{JSxRef("Boolean")}} là `true` khi và chỉ khi tính năng được chỉ định được phép trong ngữ cảnh được chỉ định (hoặc ngữ cảnh mặc định nếu không có ngữ cảnh nào được chỉ định).

## Cú pháp

```js-nolint
allowsFeature(feature)
allowsFeature(feature, origin)
```

### Tham số

- `feature`
  - : Tên tính năng cụ thể cần kiểm tra tính khả dụng.
- `origin` {{Optional_inline}}
  - : Tên nguồn gốc cụ thể cần kiểm tra tính khả dụng. Nếu không được chỉ định, nguồn gốc mặc định sẽ được sử dụng.

### Giá trị trả về

Một {{JSxRef("Boolean")}} là `true` khi và chỉ khi tính năng được phép.

## Ví dụ

Ví dụ sau truy vấn xem tài liệu có được phép sử dụng API camera bởi Chính sách Quyền hay không. Lưu ý rằng API Camera có thể bị hạn chế bởi API Quyền nếu người dùng chưa cấp quyền tương ứng.

```js
// First, get the Feature Policy object
const featurePolicy = document.featurePolicy;

// Then query feature for specific
const allowed = featurePolicy.allowsFeature("camera");

if (allowed) {
  console.log("FP allows camera.");
} else {
  console.log("FP does not allows camera.");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
