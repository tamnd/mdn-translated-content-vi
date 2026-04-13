---
title: "FeaturePolicy: getAllowlistForFeature() method"
short-title: getAllowlistForFeature()
slug: Web/API/FeaturePolicy/getAllowlistForFeature
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FeaturePolicy.getAllowlistForFeature
---

{{APIRef("Feature Policy API")}}{{SeeCompatTable}}

Phương thức **`getAllowlistForFeature()`** của giao diện {{DOMxRef("FeaturePolicy")}} cho phép truy vấn danh sách cho phép của một tính năng cụ thể cho Chính sách Quyền hiện tại.

## Cú pháp

```js-nolint
getAllowlistForFeature(feature)
```

### Tham số

- `feature`
  - : Tên tính năng cụ thể cần lấy danh sách cho phép.

### Giá trị trả về

Một mảng chuỗi chứa danh sách tuần tự hóa các nguồn gốc được phép cho tính năng. Nếu sử dụng ký tự đại diện (`*`), mảng sẽ chứa `*`.

### Ngoại lệ

Hàm sẽ hiển thị cảnh báo nếu tên chỉ thị Chính sách Quyền được chỉ định không được nhận biết. Tuy nhiên, nó cũng sẽ trả về mảng rỗng, cho biết không có nguồn gốc nào được phép sử dụng tính năng.

## Ví dụ

Ví dụ sau in tất cả các nguồn gốc được Chính sách Quyền cho phép sử dụng API Camera. Lưu ý rằng API Camera cũng có thể bị hạn chế bởi [API Quyền](/en-US/docs/Web/API/Permissions_API) nếu người dùng chưa cấp quyền tương ứng.

```js
// First, get the FeaturePolicy object
const featurePolicy = document.featurePolicy;

// Query for specific feature
const allowlist = featurePolicy.getAllowlistForFeature("camera");

for (const origin of allowlist) {
  console.log(origin);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
