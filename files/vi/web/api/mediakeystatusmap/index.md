---
title: MediaKeyStatusMap
slug: Web/API/MediaKeyStatusMap
page-type: web-api-interface
browser-compat: api.MediaKeyStatusMap
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Giao diện **`MediaKeyStatusMap`** của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) là một bản đồ chỉ đọc các trạng thái khóa phương tiện theo ID khóa.

## Thuộc tính phiên bản

- {{domxref("MediaKeyStatusMap.size")}} {{ReadOnlyInline}}
  - : Trả về số lượng cặp khóa/giá trị trong bản đồ trạng thái.

## Phương thức phiên bản

- {{domxref("MediaKeyStatusMap.entries()")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng `Iterator` mới chứa một mảng `[key, value]` cho mỗi phần tử trong bản đồ trạng thái, theo thứ tự chèn.
- {{domxref("MediaKeyStatusMap.forEach()")}} {{ReadOnlyInline}}
  - : Gọi `callback` một lần cho mỗi cặp khóa-giá trị trong bản đồ trạng thái, theo thứ tự chèn. Nếu `argument` có mặt, nó sẽ được truyền cho callback.
- {{domxref("MediaKeyStatusMap.get()")}} {{ReadOnlyInline}}
  - : Trả về giá trị liên kết với khóa đã cho, hoặc `undefined` nếu không có.
- {{domxref("MediaKeyStatusMap.has()")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean xác nhận liệu có giá trị được liên kết với khóa đã cho hay không.
- {{domxref("MediaKeyStatusMap.keys()")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng `Iterator` mới chứa các khóa cho mỗi phần tử trong bản đồ trạng thái, theo thứ tự chèn.
- {{domxref("MediaKeyStatusMap.values()")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng `Iterator` mới chứa các giá trị cho mỗi phần tử trong bản đồ trạng thái, theo thứ tự chèn.
- `MediaKeyStatusMap[Symbol.iterator]()` {{ReadOnlyInline}}
  - : Trả về một đối tượng `Iterator` mới chứa một mảng `[key, value]` cho mỗi phần tử trong bản đồ trạng thái, theo thứ tự chèn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
