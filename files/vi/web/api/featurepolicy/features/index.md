---
title: "FeaturePolicy: features() method"
short-title: features()
slug: Web/API/FeaturePolicy/features
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FeaturePolicy.features
---

{{APIRef("Feature Policy API")}}{{SeeCompatTable}}

Phương thức **`features()`** của giao diện {{DOMxRef("FeaturePolicy")}} trả về danh sách tên của tất cả các tính năng được Tác nhân Người dùng hỗ trợ. Tính năng có tên xuất hiện trong danh sách có thể không được phép bởi [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) của ngữ cảnh thực thi hiện tại và/hoặc có thể không thể truy cập được do quyền của người dùng.

## Cú pháp

```js-nolint
features()
```

### Tham số

Không có.

### Giá trị trả về

Danh sách chuỗi đại diện cho tên của tất cả các chỉ thị Chính sách Quyền được tác nhân người dùng hỗ trợ.

## Ví dụ

Ví dụ sau ghi lại tất cả các chỉ thị được hỗ trợ vào bảng điều khiển.

```js
// Get the FeaturePolicy object
const featurePolicy = document.featurePolicy;

// Retrieve the list of all supported Permissions Policy directives
const supportedDirectives = featurePolicy.features();

// Print out each directive into the console
for (const directive of supportedDirectives) {
  console.log(directive);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
