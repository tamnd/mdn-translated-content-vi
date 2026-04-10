---
title: "Screen: thuộc tính height"
short-title: height
slug: Web/API/Screen/height
page-type: web-api-instance-property
browser-compat: api.Screen.height
---

{{APIRef("CSSOM view API")}}

Thuộc tính chỉ đọc **`Screen.height`** trả về chiều cao của màn hình tính bằng CSS pixels.

## Giá trị

Một số.

## Ví dụ

```js
if (window.screen.availHeight !== window.screen.height) {
  // Có thứ gì đó đang chiếm không gian màn hình!
}
```

## Ghi chú

Lưu ý rằng không phải toàn bộ chiều cao được cung cấp bởi thuộc tính này đều khả dụng cho chính cửa sổ. Các widget như taskbars hoặc các cửa sổ ứng dụng đặc biệt khác tích hợp với hệ điều hành (ví dụ: trình phát Spinner thu nhỏ hoạt động như một thanh công cụ bổ sung trên windows) có thể giảm lượng không gian khả dụng cho cửa sổ trình duyệt và các ứng dụng khác, có sự khác biệt giữa `window.screen.height` và `window.screen.availHeight`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
