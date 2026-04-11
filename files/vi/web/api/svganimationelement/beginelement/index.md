---
title: "SVGAnimationElement: phương thức beginElement()"
short-title: beginElement()
slug: Web/API/SVGAnimationElement/beginElement
page-type: web-api-instance-method
browser-compat: api.SVGAnimationElement.beginElement
---

{{APIRef("SVG")}}

Phương thức `beginElement()` của {{domxref("SVGAnimationElement")}} tạo một thời điểm bắt đầu cho thời gian hiện tại. Thời điểm mới được thêm vào danh sách thời điểm bắt đầu. Hành vi của phương thức này tương đương với `beginElementAt(0)`.

## Cú pháp

```js-nolint
beginElement()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

## Ví dụ

Ví dụ này minh họa cách sử dụng `beginElement()` để bắt đầu một phần tử hoạt hình:

```js
const animationElement = document.querySelector("animate");
animationElement.beginElement();
console.log("Animation has started.");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
