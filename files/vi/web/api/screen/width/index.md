---
title: "Screen: thuộc tính width"
short-title: width
slug: Web/API/Screen/width
page-type: web-api-instance-property
browser-compat: api.Screen.width
---

{{APIRef("CSSOM view API")}}

Thuộc tính chỉ đọc **`Screen.width`** trả về chiều rộng của màn hình tính bằng CSS pixels.

## Giá trị

Một số.

## Ví dụ

```js
// Cách đơn giản để kiểm tra màn hình ít nhất 1024x768
if (window.screen.width >= 1024 && window.screen.height >= 768) {
  // Độ phân giải là 1024x768 hoặc cao hơn
}
```

## Ghi chú

Lưu ý rằng không phải toàn bộ chiều rộng được cung cấp bởi thuộc tính này đều khả dụng cho chính cửa sổ. Khi các widget khác chiếm không gian không thể sử dụng bởi đối tượng `window`, có sự khác biệt giữa `window.screen.width` và `window.screen.availWidth`. Xem thêm {{DOMxRef("screen.height")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
