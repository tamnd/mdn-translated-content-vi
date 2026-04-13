---
title: "SVGAnimationElement: phương thức beginElementAt()"
short-title: beginElementAt()
slug: Web/API/SVGAnimationElement/beginElementAt
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.beginElementAt
---

{{APIRef("SVG")}}

Phương thức `beginElementAt()` của {{domxref("SVGAnimationElement")}} tạo một thời điểm bắt đầu cho thời gian hiện tại cộng với độ lệch đã chỉ định. Thời điểm mới được thêm vào danh sách thời điểm bắt đầu.

## Cú pháp

```js-nolint
beginElementAt(offset)
```

### Tham số

- `offset`
  - : Một số thực biểu thị độ lệch từ thời gian tài liệu hiện tại, tính bằng giây, tại đó phần tử sẽ bắt đầu.

### Giá trị trả về

Không có.

## Ví dụ

Ví dụ này minh họa cách sử dụng `beginElementAt()` để bắt đầu một phần tử hoạt hình sau khi trì hoãn 2 giây:

```js
const animationElement = document.querySelector("animate");
animationElement.beginElementAt(2);
console.log("Animation will start after a 2-second delay.");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
