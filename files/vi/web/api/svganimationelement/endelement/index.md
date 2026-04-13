---
title: "SVGAnimationElement: phương thức endElement()"
short-title: endElement()
slug: Web/API/SVGAnimationElement/endElement
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.endElement
---

{{APIRef("SVG")}}

Phương thức `endElement()` của {{domxref("SVGAnimationElement")}} tạo một thời điểm kết thúc cho thời gian hiện tại. Thời điểm mới được thêm vào danh sách thời điểm kết thúc. Hành vi của phương thức này tương đương với `endElementAt(0)`.

## Cú pháp

```js-nolint
endElement()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

## Ví dụ

Ví dụ này minh họa cách sử dụng `endElement()` để kết thúc một phần tử hoạt hình:

```js
const animationElement = document.querySelector("animate");
animationElement.endElement();
console.log("Animation has ended.");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
