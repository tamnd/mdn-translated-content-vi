---
title: "EditContext: updateSelectionBounds() method"
short-title: updateSelectionBounds()
slug: Web/API/EditContext/updateSelectionBounds
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.updateSelectionBounds
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`EditContext.updateSelectionBounds()`** của giao diện {{domxref("EditContext")}} được dùng để thông báo cho hệ điều hành về kích thước bao quanh của vùng chọn văn bản trong vùng có thể chỉnh sửa được liên kết với đối tượng `EditContext`.

Gọi phương thức này để cho hệ điều hành biết kích thước bao quanh của vùng chọn hiện tại của người dùng. Bạn nên gọi phương thức này mỗi khi vùng chọn của người dùng thay đổi trong vùng có thể chỉnh sửa. Kích thước bao quanh vùng chọn được hệ điều hành dùng để giúp định vị cửa sổ IME hoặc các giao diện người dùng liên quan đến chỉnh sửa khác của nền tảng.

## Cú pháp

```js-nolint
updateSelectionBounds(selectionBounds)
```

### Tham số

- `selectionBounds`
  - : Một đối tượng {{domxref("DOMRect")}} đại diện cho kích thước bao quanh vùng chọn mới.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu phương thức được gọi không có tham số hoặc tham số được cung cấp không phải là đối tượng {{domxref("DOMRect")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
