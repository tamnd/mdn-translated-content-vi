---
title: "EditContext: characterBounds() method"
short-title: characterBounds()
slug: Web/API/EditContext/characterBounds
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.characterBounds
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`characterBounds()`** của giao diện {{domxref("EditContext")}} trả về một {{jsxref("Array")}} chứa danh sách hình chữ nhật bao quanh các ký tự trong đối tượng `EditContext`.

Vị trí và kích thước của các ký tự trong đối tượng `EditContext` được hệ điều hành dùng để định vị đúng các giao diện người dùng liên quan đến chỉnh sửa của nền tảng, chẳng hạn như cửa sổ {{glossary("Input Method Editor")}} (IME) khi cần. Điều này đặc biệt quan trọng trong các tình huống mà hệ điều hành không thể tự động phát hiện vị trí và kích thước của các ký tự, chẳng hạn như khi hiển thị văn bản trong phần tử `<canvas>`.

Các nhà phát triển web sẽ quan tâm nhất đến việc sử dụng sự kiện {{domxref("EditContext.characterboundsupdate_event", "characterboundsupdate")}} cùng với phương thức {{domxref("EditContext.updateCharacterBounds()")}} để cập nhật kích thước bao quanh ký tự khi hệ điều hành cho biết nó cần thông tin về vị trí và kích thước của các ký tự.

Phương thức `characterBounds()` trả về danh sách kích thước bao quanh ký tự được cập nhật lần cuối bằng `updateCharacterBounds()`. Danh sách không chứa mục cho mỗi ký tự trong đối tượng `EditContext`, mà chỉ cho những ký tự được cập nhật bằng `updateCharacterBounds()`. Để biết các ký tự nằm ở đâu trong đối tượng `EditContext`, sử dụng thuộc tính {{domxref("EditContext.characterBoundsRangeStart")}}.

## Cú pháp

```js-nolint
characterBounds()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} chứa các đối tượng {{domxref("DOMRect")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
