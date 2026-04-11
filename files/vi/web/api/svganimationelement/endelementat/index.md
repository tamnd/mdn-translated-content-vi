---
title: "SVGAnimationElement: phương thức endElementAt()"
short-title: endElementAt()
slug: Web/API/SVGAnimationElement/endElementAt
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.endElementAt
---

{{APIRef("SVG")}}

Phương thức `endElementAt()` của {{domxref("SVGAnimationElement")}} tạo một thời điểm kết thúc cho thời gian hiện tại cộng với độ lệch đã chỉ định. Thời điểm mới được thêm vào danh sách thời điểm kết thúc.

## Cú pháp

```js-nolint
endElementAt(offset)
```

### Tham số

- `offset`
  - : Một số thực biểu thị độ lệch từ thời gian tài liệu hiện tại, tính bằng giây, tại đó phần tử sẽ kết thúc.

### Giá trị trả về

Không có.

## Ví dụ

Ví dụ này minh họa cách sử dụng `endElementAt()` để kết thúc một phần tử hoạt hình sau khi trì hoãn 2 giây:

```js
const animationElement = document.querySelector("animate");
animationElement.endElementAt(2);
console.log("Animation will end after a 2-second delay.");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
