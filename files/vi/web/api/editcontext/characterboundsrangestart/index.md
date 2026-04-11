---
title: "EditContext: characterBoundsRangeStart property"
short-title: characterBoundsRangeStart
slug: Web/API/EditContext/characterBoundsRangeStart
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.EditContext.characterBoundsRangeStart
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`characterBoundsRangeStart`** của giao diện {{domxref("EditContext")}} cho biết chỉ số của ký tự, trong nội dung văn bản có thể chỉnh sửa, tương ứng với phần tử đầu tiên trong mảng {{domxref("EditContext.characterBounds()", "characterBounds")}}.

Ví dụ, nếu `EditContent` chứa các ký tự `abc`, và nếu `characterBoundRangeStart` là `1`, thì phần tử đầu tiên trong mảng `characterBounds` chứa kích thước bao quanh của ký tự `b`.

## Giá trị

Một {{jsxref("Number")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
