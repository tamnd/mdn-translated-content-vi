---
title: FeaturePolicy
slug: Web/API/FeaturePolicy
page-type: web-api-interface
status:
  - experimental
browser-compat: api.FeaturePolicy
---

{{APIRef("Feature Policy")}}{{SeeCompatTable}}

Giao diện `FeaturePolicy` đại diện cho tập hợp các [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được áp dụng cho ngữ cảnh thực thi hiện tại.

## Phương thức phiên bản

- {{DOMxRef("FeaturePolicy.allowsFeature")}} {{Experimental_Inline}}
  - : Trả về một giá trị Boolean cho biết một tính năng cụ thể có được bật trong ngữ cảnh được chỉ định hay không.
- {{DOMxRef("FeaturePolicy.features")}} {{Experimental_Inline}}
  - : Trả về danh sách tên của tất cả các tính năng được Tác nhân Người dùng hỗ trợ. Các tính năng có tên xuất hiện trong danh sách có thể không được phép bởi Chính sách Quyền của ngữ cảnh thực thi hiện tại và/hoặc có thể bị hạn chế bởi quyền do người dùng cấp.
- {{DOMxRef("FeaturePolicy.allowedFeatures")}} {{Experimental_Inline}}
  - : Trả về danh sách tên của tất cả các tính năng được Tác nhân Người dùng hỗ trợ và được Chính sách Quyền cho phép. Lưu ý rằng các tính năng xuất hiện trong danh sách này vẫn có thể ở phía sau quyền của người dùng.
- {{DOMxRef("FeaturePolicy.getAllowlistForFeature")}} {{Experimental_Inline}}
  - : Trả về danh sách cho phép cho tính năng được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Permissions-Policy")}}
- [Quyền riêng tư, quyền và bảo mật thông tin](/en-US/docs/Web/Privacy)
