---
title: "CSSTransformComponent: toMatrix() method"
short-title: toMatrix()
slug: Web/API/CSSTransformComponent/toMatrix
page-type: web-api-instance-method
browser-compat: api.CSSTransformComponent.toMatrix
---

{{APIRef("CSS Typed OM")}}

Phương thức **`toMatrix()`** của giao diện
{{domxref("CSSTransformComponent")}} trả về đối tượng {{domxref('DOMMatrix')}}.

Tất cả các hàm transform có thể được biểu diễn bằng toán học dưới dạng ma trận biến đổi 4x4.

> [!NOTE]
> Thuộc tính `is2D` ảnh hưởng đến transform, và do đó loại ma trận sẽ được trả về. CSS 2D và 3D transforms khác nhau vì lý do lịch sử. Giải thích ngắn gọn về 2D và 3D transforms có thể được tìm thấy trong [Using CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using).

## Cú pháp

```js-nolint
toMatrix()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng {{domxref('DOMMatrix')}}

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu bất kỳ độ dài nào liên quan đến tạo ma trận không phải là đơn vị tương thích với px (chẳng hạn như độ dài tương đối hoặc phần trăm).

## Ví dụ

Đang cập nhật

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
